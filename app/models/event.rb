class Event < ApplicationRecord
  belongs_to :user
  has_many :attendees
end
