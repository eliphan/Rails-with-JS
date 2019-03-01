class CreateChapters < ActiveRecord::Migration[5.2]
  def change
    create_table :chapters do |t|
      t.belongs_to :books, foreign_key: true
      t.string :chapter_title
      t.text :chapter_content

      t.timestamps null: false
    end
    add_index :chapters, :chapter_title
  end
end
