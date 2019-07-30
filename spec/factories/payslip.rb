FactoryBot.define do
  factory :payslip do
    client_id                     { '123456789012'}
    vat                           { '123456789' }
    date                          { DateTime.parse('20180711') }
    gross                         { 123456.78 }
    national_insurance_rate       { 12.34 }
    national_insurance_deductions { 123456.78 }
    tax_rate                      { 12.34 }
    taxes                         { 123456.78 }
    net                           { 123456.78 }
    report
  end
end
