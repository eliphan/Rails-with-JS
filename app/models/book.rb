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

  def category_attributes=(category_attributes)
    if !category_attributes[:name].blank? 
      self.category = Category.find_or_create_by(category_attributes)
    end 
  end
end
