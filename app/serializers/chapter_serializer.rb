class ChapterSerializer < ActiveModel::Serializer
  attributes :id, :title, :number
  has_one :book
end
