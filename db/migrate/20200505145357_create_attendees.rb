# frozen_string_literal: true

class CreateAttendees < ActiveRecord::Migration[6.0]
  def change
    create_table :attendees do |t|
      t.belongs_to :user
      t.belongs_to :event

      t.timestamps
    end
  end
end
