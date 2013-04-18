class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :text

      t.timestamps
      t.references :test
    end
  end
end
