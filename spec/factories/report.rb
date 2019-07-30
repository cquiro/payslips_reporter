FactoryBot.define do
  factory :report do
    filename  { "payslips.#{year}#{month}.txt" }
    year      { '2018' }
    month     { '07' }
  end
end
