class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :user_name
      t.integer :mob
      t.string :address
      

      t.timestamps
    end
  end
end
