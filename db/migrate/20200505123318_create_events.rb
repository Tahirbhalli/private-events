# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true

      t.string :title
      t.string :description
      t.date :event_date

      t.timestamps
    end
  end
end
