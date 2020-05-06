# frozen_string_literal: true

class Attendee < ApplicationRecord
  before_save :check
  belongs_to :user
  belongs_to :event

  private

  def check
    u = Attendee.where(user_id: user_id, event_id: event_id).select('id')
    ids = u.ids[0]
    raise ActiveRecord::Rollback unless ids.nil?
  end
end
