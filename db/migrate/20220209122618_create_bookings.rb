class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.integer :user
      t.date :arriving_date
      t.date :leaving_date
      t.boolean :breakfast
      t.integer :room_id
      t.integer :user_id
      
      t.timestamps
    end
  end
end
