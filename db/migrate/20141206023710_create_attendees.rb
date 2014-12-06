class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.integer :user_id
      t.string :confirm_status
      t.boolean :bring_vinyl
      t.boolean :bring_drinks
      t.boolean :bring_food
      t.boolean :bring_theparty
      t.integer :event_id
      t.text :comments

      t.timestamps null: false
    end
  end
end
