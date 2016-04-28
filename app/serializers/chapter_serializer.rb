class ChapterSerializer < ActiveModel::Serializer
  attributes :id, :title, :number, :updated_at
end
