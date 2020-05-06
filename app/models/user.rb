# frozen_string_literal: true

class User < ApplicationRecord
  has_many :events
  has_many :attendees
end
