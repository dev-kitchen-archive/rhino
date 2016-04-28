class MediumSerializer < ActiveModel::Serializer
  attributes :id, :type, :title, :teaser, :chapter_id
  attributes :thumbnail_url
  attributes :data
  attributes :updated_at

  def thumbnail_url
    object.thumbnail.url
  end

  def type
    object.type.underscore
  end
end
