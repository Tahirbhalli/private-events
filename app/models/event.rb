class Event < ApplicationRecord
  belongs_to :user
  has_many :attendees
  def self.created_before(time)
    where("event_date > ?", time)
  end
  def self.upcoming_events(time)
    where("event_date <= ?", time)
  end
  def self.creator
    User.where('user.id = self.user_id').select('name')
  end
end
