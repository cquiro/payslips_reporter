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

  describe "#tax_rate=" do
    subject(:payslip) do
      build(
        :payslip,
        gross: '3000.00',
        national_insurance_rate: '07.00',
        national_insurance_deductions: '210.00',
        tax_rate: '12.00',
        taxes: '360.00',
        net: '2430.00'
      )
    end

    it 'recalculates net when tax_rate is updated' do
      subject.tax_rate = 25.00
      expect(subject.net).to eq 2040.00 # net calculated manually for 25% tax rate
    end

  end
end
