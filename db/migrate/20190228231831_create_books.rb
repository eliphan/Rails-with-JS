class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.belongs_to :users, foreign_key: true
      t.belongs_to :categories, foreign_key: true
      t.string :title
      t.string :author
      t.text :description
      t.boolean :finished, default: false

      t.timestamps null: false
    end
    add_index :books, :title
    add_index :books, :user_id
    add_index :books, :chapter_id
  end
end
