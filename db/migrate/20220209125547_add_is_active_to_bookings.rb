class AddIsActiveToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :is_active, :boolean, default: true
  end
end
