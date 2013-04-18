class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :title
      t.string :description
      t.boolean :is_private
      t.date :created

      t.timestamps
      t.references :category
      t.references :user
    end
  end
end
