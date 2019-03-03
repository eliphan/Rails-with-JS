class Chapter < ApplicationRecord
  belongs_to :book

  # def user_id=(id)
  #   self.user = User.find_or_create_by(id: id)
  # end

  # def user_id
  #   self.user ? self.user.id : nil
  # end

  def book_id=(id)
    self.book = Book.find_or_create_by(id:id)
  end

  def book_id
    self.book ? self.book.id : nil
  end
end
