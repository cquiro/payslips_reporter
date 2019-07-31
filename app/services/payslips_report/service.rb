module PayslipsReport
  class Service
    include HTTParty
    base_uri Rails.application.credentials.config[:txt_file_uri]

    attr_reader :filename, :year, :month, :data

    def initialize(filename:, year:, month:)
      @filename = filename
      @year = year
      @month = month
    end

    def import
      @data = self.class.get("/#{filename}")
      return if data.include?('404')

      parsed_data
    end

    private

    def parsed_data # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
      data.split.map do |payslip|
        {
          client_id: payslip[0..11],
          vat: payslip[12..20],
          date: DateTime.parse(payslip[21..28]),
          gross: "#{payslip[29..34]}.#{payslip[35..36]}",
          national_insurance_rate: "#{payslip[37..38]}.#{payslip[39..40]}",
          national_insurance_deductions: "#{payslip[41..46]}.#{payslip[47..48]}",
          tax_rate: "#{payslip[49..50]}.#{payslip[51..52]}",
          taxes: "#{payslip[53..58]}.#{payslip[59..60]}",
          net: "#{payslip[61..66]}.#{payslip[67..68]}"
        }
      end
    end
  end
end
