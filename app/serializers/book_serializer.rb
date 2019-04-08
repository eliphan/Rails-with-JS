class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :author
end
