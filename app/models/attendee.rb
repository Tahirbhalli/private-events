class Attendee < ApplicationRecord
    after_save :check
    belongs_to :user
    belongs_to :event
    private
      def check
        
        if Attendee.where(user_id: self.user_id, event_id: self.event_id)
            raise ActiveRecord::Rollback
        end
      end
end