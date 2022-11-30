# frozen_string_literal: true

describe Kudos::Achievement do
  it 'factory should be valid' do
    kudos_achievement = build :kudos_achievement

    expect(kudos_achievement).to be_valid
  end

  describe 'associations' do
    it { is_expected.to belong_to(:kudos_achievement_group) }
    it { is_expected.to have_many(:kudos_users_achievements).dependent(:destroy) }
    it { is_expected.to have_many(:users).through(:kudos_users_achievements) }
  end
end
