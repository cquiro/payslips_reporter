class Report < ApplicationRecord
  has_many :payslips, dependent: :destroy
end
