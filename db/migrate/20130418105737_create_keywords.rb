class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :text

      t.timestamps
      t.references :quiz
      t.references :question
    end
  end
end
