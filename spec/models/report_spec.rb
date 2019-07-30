require 'rails_helper'

describe Report do
  subject(:report) { build(:report) }

  it { is_expected.to validate_presence_of(:filename) }
  it { is_expected.to validate_presence_of(:year) }
  it { is_expected.to validate_presence_of(:month) }
  it { is_expected.to validate_uniqueness_of(:filename) }

  it { is_expected.to be_valid }
end
