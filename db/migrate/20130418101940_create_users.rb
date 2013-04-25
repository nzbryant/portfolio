class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.boolean :is_logged_in
      
      t.string :password_hash
      t.string :password_salt
      t.string :password_confirmation

      t.timestamps
    end
  end
end
