class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :chapters
  has_many :reviews


  validates :title, presence: true, length: {minimum: 1}
  validates :author, presence: true
  validates :description, presence: true, length: {minimum: 5}
  # def user_id=(id)
  #   self.user = User.find_or_create_by(id: id)
  # end

  # def user_id
  #   self.user ? self.user.id : nil
  # end

  def category_attributes=(category_attributes)
    if !category_attributes[:name].blank? 
      self.category = Category.find_or_create_by(category_attributes)
    end 
  end

  def review_contents=(reviews)
    reviews.each do |content|
      if content.strip != ''
        self.reviews.build(content: content)
      end
    end
  end
  
  def review_contents
    self.reviews.map(:content)
  end

  def finished?
    self.finished == true
  end

  def not_finished?
    self.finished == false
  end
end
