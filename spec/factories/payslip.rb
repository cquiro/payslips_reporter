FactoryBot.define do
  factory :payslip do
    client_id                     { Faker::Number.number(12) }
    vat                           { Faker::Number.number(9) }
    date                          { DateTime.parse('20180711') }
    gross                         { Faker::Number.decimal(6, 2) }
    national_insurance_rate       { Faker::Number.decimal(2) }
    national_insurance_deductions { Faker::Number.decimal(6, 2) }
    tax_rate                      { Faker::Number.decimal(2) }
    taxes                         { Faker::Number.decimal(6, 2) }
    net                           { Faker::Number.decimal(6, 2) }
    report
  end
end
