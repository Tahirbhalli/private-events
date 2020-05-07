class Attendee < ApplicationRecord
  before_save :check
  belongs_to :user
  belongs_to :event

  def self.isjoined?(user_id, event_id)
    return true if where(user_id: user_id, event_id: event_id).exists?

    false
  end

  private

  def check
    u = Attendee.where(user_id: user_id, event_id: event_id).select('id')
    ids = u.ids[0]
    raise ActiveRecord::Rollback unless ids.nil?
  end
end
