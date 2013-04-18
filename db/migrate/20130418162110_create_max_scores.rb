class CreateMaxScores < ActiveRecord::Migration
  def change
    create_table :max_scores do |t|
      t.integer :score
      t.references :user
      t.references :test

      t.timestamps
    end
    #add_index :max_scores, :user_id
    #add_index :max_scores, :test_id
  end
end
