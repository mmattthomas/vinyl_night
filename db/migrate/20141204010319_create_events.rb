class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.integer :create_user_id
      t.date :scheduled
      t.time :start_time
      t.time :end_time
      t.string :address
      t.text :description

      t.timestamps null: false
    end
  end
end
