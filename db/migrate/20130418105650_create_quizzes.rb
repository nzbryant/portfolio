class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :title
      t.boolean :is_private
      t.date :created

      t.timestamps
      t.references :subcategory
      t.references :user
    end
  end
end
