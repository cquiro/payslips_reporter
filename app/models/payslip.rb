class Payslip < ApplicationRecord
  belongs_to :report

  validates :client_id, :vat, :date, :gross, :national_insurance_rate,
            :national_insurance_deductions, :tax_rate, :taxes, :net, presence: true
  validates :client_id, uniqueness: true, case_sensitive: false
end
