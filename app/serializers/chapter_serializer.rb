class ChapterSerializer < ActiveModel::Serializer
  attributes :id, :chapter_title, :chapter_content
  belongs_to :book
end
