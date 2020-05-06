# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user
  has_many :attendees
end
