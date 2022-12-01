# frozen_string_literal: true

module Kudos
  class Configuration
    attr_accessor :achievements_model_name

    def initialize
      # model name with defined award_for methods
      @achievements_model_name = ::Achievement
    end
  end
end
