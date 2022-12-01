# frozen_string_literal: true

require 'kudos/version'
require 'kudos/engine'
require 'kudos/configuration'

module Kudos
  def self.included(base)
    base.class_eval do
      extend ClassMethods
    end
  end

  module ClassMethods
    # Public: Configure kudos.
    #
    #   Kudos.configure do |config|
    #     config.achievements_model_name = ::Achievement
    #   end
    #
    def configure
      yield configuration
    end

    # Public: Returns Kudos::Configuration instance.
    def configuration
      @configuration ||= Configuration.new
    end

    def awards
      @awards ||= {}
    end

    def award_for(award_name, &block)
      awards[award_name] = block
    end

    def award(award_name, *attributes)
      achievements = configuration.achievements_model_name.where(award_name: award_name).order(rank: :asc)
      awards[award_name].call(achievements, *attributes)
    end
  end
end
