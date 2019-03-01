class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :chapters

  def user_id=(id)
    self.user = User.find_or_create_by(id: id)
  end

  def user_id
    self.user ? self.user.id : nil
  end

  def category_name=(name)
    self.category = Category.find_or_create_by(name: name)
  end

  def category_name
    self.category ? self.category.name : nil
  end
end
