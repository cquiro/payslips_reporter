require 'rails_helper'

describe Payslip do
  subject(:payslip) { build(:payslip) }

  it { is_expected.to validate_presence_of(:client_id) }
  it { is_expected.to validate_uniqueness_of(:client_id).case_insensitive }
  it { is_expected.to validate_presence_of(:vat) }
  it { is_expected.to validate_presence_of(:date) }
  it { is_expected.to validate_presence_of(:gross) }
  it { is_expected.to validate_presence_of(:national_insurance_rate) }
  it { is_expected.to validate_presence_of(:national_insurance_deductions) }
  it { is_expected.to validate_presence_of(:tax_rate) }
  it { is_expected.to validate_presence_of(:taxes) }
  it { is_expected.to validate_presence_of(:net) }

  it { is_expected.to be_valid }
end
