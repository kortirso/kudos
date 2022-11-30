# frozen_string_literal: true

describe User do
  it 'factory should be valid' do
    user = build :user

    expect(user).to be_valid
  end

  describe 'associations' do
    it { is_expected.to have_many(:kudos_users_achievements).dependent(:destroy) }
    it { is_expected.to have_many(:kudos_achievements).through(:kudos_users_achievements) }
  end

  describe 'award' do
    let!(:user) { create :user }
    let!(:achievement) { create :kudos_achievement, award_name: 'fantasy_team_create', points: 5 }

    it 'creates kudos_achievement' do
      expect { user.award(achievement: achievement) }.to(
        change(user.kudos_users_achievements, :count).by(1)
      )
    end
  end

  describe 'awarded?' do
    let!(:user) { create :user }
    let!(:achievement) { create :kudos_achievement, award_name: 'fantasy_team_create', points: 5 }
    let!(:lineup_achievement1) { create :kudos_achievement, award_name: 'lineup_points', points: 10, rank: 1 }
    let!(:lineup_achievement2) { create :kudos_achievement, award_name: 'lineup_points', points: 25, rank: 2 }

    context 'without achievement, for no rank' do
      it 'returns false' do
        expect(user.awarded?(achievement: achievement)).to be_falsy
      end
    end

    context 'with achievement, for no rank' do
      before { user.award(achievement: achievement) }

      it 'returns true' do
        expect(user.awarded?(achievement: achievement)).to be_truthy
      end
    end

    context 'with achievement, with lower rank' do
      before { user.award(achievement: lineup_achievement1) }

      it 'returns false' do
        expect(user.awarded?(achievement: lineup_achievement2)).to be_falsy
      end
    end

    context 'with achievement, with rank' do
      before { user.award(achievement: lineup_achievement1) }

      it 'returns true' do
        expect(user.awarded?(achievement: lineup_achievement1)).to be_truthy
      end
    end
  end
end
