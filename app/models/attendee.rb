class Attendee < ApplicationRecord
    before_save :check
    belongs_to :user
    belongs_to :event
    private
      def check
        u = Attendee.where(user_id: self.user_id, event_id: self.event_id).select('id')
        ids=u.ids[0]
        raise ActiveRecord::Rollback if ids != nil
        
      end
end