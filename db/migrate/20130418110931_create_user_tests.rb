class CreateUserTests < ActiveRecord::Migration
  def change
    create_table :user_tests do |t|
      t.integer :max_score

      t.timestamps
    end
  end
end
