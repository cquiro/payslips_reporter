module Payslips
  class TaxUpdater
    include Interactor

    delegate :year, :month, :tax_rate, to: :context

    attr_reader :payslips

    def call
      @payslips = retrieve_payslips
      context.fail!(error: '404: Payslips not found') if payslips.blank?

      update_tax_rates
    end

    private

    def retrieve_payslips
      Payslips::Retrieve.call(year: year, month: month).payslips
    end

    def update_tax_rates
      payslips.each { |payslip| payslip.update!(tax_rate: tax_rate) }
    end
  end
end
