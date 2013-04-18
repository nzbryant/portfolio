class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :text

      t.timestamps
      t.references :quiz
    end
  end
end
