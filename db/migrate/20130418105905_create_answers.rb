class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :text
      t.boolean :is_correct

      t.timestamps
      t.references :question
    end
  end
end
