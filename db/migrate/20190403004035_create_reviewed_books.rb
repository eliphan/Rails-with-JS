class CreateReviewedBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :reviewed_books do |t|
      t.string :title
    end
  end
end
