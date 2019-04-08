class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_username, :created_at
end
