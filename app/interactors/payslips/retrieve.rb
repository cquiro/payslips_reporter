module Payslips
  class Retrieve
    include Interactor

    delegate :year, :month, to: :context

    attr_reader :report

    def call
      @report = fetch_report
      context.payslips = report.payslips if report.present?
    end

    private

    def filename
      @filename ||= "payslips.#{year}#{month}.txt"
    end

    def fetch_report
      Report.find_by(filename: filename) || create_report_from_txt
    end

    def create_report_from_txt
      context.fail!(error: '404: Payslips not found') if payslips_data.nil?

      Report.transaction do
        @report = Report.create(filename: filename, year: year, month: month)
        create_payslips
      end

      report
    end

    def create_payslips
      payslips_data.each { |payslip| report.payslips.create(payslip) }
    end

    def payslips_data
      @payslips_data ||= PayslipsReport::Service.new(filename: filename, year: year, month: month)
                                                .import
    end
  end
end
