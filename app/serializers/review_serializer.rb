class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_username, :created_at
  belongs_to :book
end
