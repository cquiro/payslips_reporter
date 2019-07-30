class Report < ApplicationRecord
  has_many :payslips, dependent: :destroy

  validates :filename, :year, :month, presence: true
  validates :filename, uniqueness: true
end
