# frozen_string_literal: true

describe Kudos::AchievementGroup do
  it 'factory should be valid' do
    kudos_achievement_group = build :kudos_achievement_group

    expect(kudos_achievement_group).to be_valid
  end

  describe 'associations' do
    it { is_expected.to belong_to(:parent).class_name('Kudos::AchievementGroup').optional }
    it { is_expected.to have_many(:kudos_achievements).dependent(:destroy) }
    it { is_expected.to have_many(:children).class_name('Kudos::AchievementGroup').dependent(:nullify) }
  end
end
