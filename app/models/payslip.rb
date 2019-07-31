class Payslip < ApplicationRecord
  belongs_to :report

  validates :client_id, :vat, :date, :gross, :national_insurance_rate,
            :national_insurance_deductions, :tax_rate, :taxes, :net, presence: true
  validates :client_id, uniqueness: true, case_sensitive: false

  def tax_rate=(value)
    super(value)
    recalculate_net_and_taxes unless tax_rate.nil?
  end

  private

  def recalculate_net_and_taxes
    self.taxes = gross * tax_rate / 100
    self.net = gross - national_insurance_deductions - taxes
  end
end
