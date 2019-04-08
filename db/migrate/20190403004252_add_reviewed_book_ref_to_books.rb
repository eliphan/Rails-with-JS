class AddReviewedBookRefToBooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :books, :reviewed_book, foreign_key: true
  end
end
