# frozen_string_literal: true

class User < ApplicationRecord
  include Kudos::Achievementable
end
