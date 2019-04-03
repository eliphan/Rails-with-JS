class Chapter < ApplicationRecord
  belongs_to :book
  has_many :comments
  validates :chapter_title, presence: true, length: {minimum: 1}
  validates :chapter_content, presence: true, length: {minimum: 5}
  
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

  def comment_contents=(comments)
    comments.each do |content|
      if content.strip != ''
        self.comments.build(content: content)
      end
    end
  end
  
  def comment_contents
    self.comments.map(&:content)
  end
  
end
