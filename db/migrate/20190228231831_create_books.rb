class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.belongs_to :user, foreign_key: true, index: true
      t.belongs_to :category, foreign_key: true
      t.string :title
      t.string :author
      t.text :description
      t.boolean :finished, default: false

      t.timestamps null: false
    end
    add_index :books, :title
  end
end
