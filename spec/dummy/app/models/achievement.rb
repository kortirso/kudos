# frozen_string_literal: true

class Achievement < Kudos::Achievement
  award_for :fantasy_team_create do |achievements, user|
    achievement = achievements.first
    user.award(achievement: achievement) unless user.awarded?(achievement: achievement)
  end
end
