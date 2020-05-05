class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.belongs_to :user
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
