# frozen_string_literal: true

describe Achievement do
  describe '.award' do
    subject(:award_call) { described_class.award(:fantasy_team_create, user) }

    let!(:user) { create :user }

    before { create :kudos_achievement, award_name: 'fantasy_team_create', points: 5 }

    it 'creates kudos_achievement' do
      expect { award_call }.to change(user.kudos_users_achievements, :count).by(1)
    end

    context 'for existing achievement' do
      before { award_call }

      it 'does not create kudos_achievement' do
        expect { award_call }.not_to change(user.kudos_users_achievements, :count)
      end
    end
  end

  describe '.awards' do
    it 'returns list of awards', :aggregate_failures do
      described_class.awards.each do |key, value|
        expect(key).to eq :fantasy_team_create
        expect(value.is_a?(Proc)).to be_truthy
      end
    end
  end
end
