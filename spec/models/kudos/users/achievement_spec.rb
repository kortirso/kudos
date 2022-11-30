# frozen_string_literal: true

describe Kudos::Users::Achievement do
  it 'factory should be valid' do
    kudos_users_achievement = build :kudos_users_achievement

    expect(kudos_users_achievement).to be_valid
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:kudos_achievement) }
  end
end
