FactoryBot.define do
  factory :report do
    filename  { 'payslips.201807.txt' }
    year      { '2018' }
    month     { '07' }
  end
end
