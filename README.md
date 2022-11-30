# Kudos
Reputation engine for Rails application similar to World of Warcraft achievements system.

## Installation

Add this line to your application's Gemfile:
```ruby
gem 'kudos'
```

And then for generating migration and models execute:
```bash
$ bundle install
$ rails g kudos:active_record
$ rails db:migrate
```

If you would like to attach achievements not to User model, run instead
```bash
$ rails g kudos:active_record ModelName
```

## Сonfiguration

```ruby
class User < ApplicationRecord
  include Kudos::Achievementable
  ...
end
```

## Generating achievements

### Achievements database records

```ruby
general_group = Kudos::AchievementGroup.create(name: { en: 'General' })

Kudos::Achievement.create(
  award_name: 'fantasy_team_create',
  points: 5,
  kudos_achievement_group: general_group
)
```

### Describe award rules

For one rank achievements conditions for awarding can be defined like
```ruby
class Achievement < Kudos::Achievement
  award_for :fantasy_team_create do |achievements, user|
    achievement = achievements.first
    user.award(achievement: achievement) unless user.awarded?(achievement: achievement)
  end
end
```

For multi-rank achievements conditions for awarding can be defined like
```ruby
class Achievement < Kudos::Achievement
  award_for :lineup_points do |achievements, lineup|
    user = lineup.user
    achievements.each do |achievement|
      if !user.awarded?(achievement: achievement) && lineup.points >= (achievement.rank * 10)
        user.award(achievement: achievement)
      end
    end
  end
end
```

## Usage

For awarding user just call this code in callback or by any event generator
```ruby
Achievement.award(:fantasy_team_create, user)
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
