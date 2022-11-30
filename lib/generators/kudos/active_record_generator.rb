# frozen_string_literal: true

require 'rails/generators/active_record'

module Kudos
  module Generators
    class ActiveRecordGenerator < ::Rails::Generators::Base
      include ::Rails::Generators::Migration
      desc 'Generates migration for kudos tables'

      source_paths << File.join(File.dirname(__FILE__), 'templates')

      argument :name, type: :string, default: 'User'

      def self.next_migration_number(dirname)
        ::ActiveRecord::Generators::Base.next_migration_number(dirname)
      end

      def self.migration_version
        "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]" if requires_migration_number?
      end

      def self.requires_migration_number?
        Rails::VERSION::MAJOR.to_i >= 6
      end

      def create_migration_file
        @user_model_name = name.underscore

        migration_template 'migration.erb', 'db/migrate/create_kudos_tables.rb'
        template 'achievement_group.erb', 'app/models/kudos/achievement_group.rb'
        template 'achievement.erb', 'app/models/kudos/achievement.rb'
        template 'users_achievement.erb', 'app/models/kudos/users/achievement.rb'
        template 'achievementable.erb', 'app/models/concerns/kudos/achievementable.rb'
        template 'uuidable.erb', 'app/models/concerns/kudos/uuidable.rb'
      end

      def migration_version
        self.class.migration_version
      end
    end
  end
end
