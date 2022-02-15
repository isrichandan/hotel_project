class AddUnconfirmedToDevise < ActiveRecord::Migration[6.1]
  def change
    change_table(:users) do |t|
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

  
      add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true  

      
      end
  end
end
