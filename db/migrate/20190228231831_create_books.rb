class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.belongs_to :users, foreign_key :true
      t.belongs_to :categories, foreign_key :true
      t.string :title
      t.string :author
      t.text :content
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.boolean :finished, default: false

      t.timestamps
    end
    add_index :books, :title
    add_index :books, :user_id
  end
end
