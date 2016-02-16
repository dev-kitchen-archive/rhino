class MediumSerializer < ActiveModel::Serializer
  attributes :id, :type, :title, :teaser
  attributes :thumbnail_url
  attributes :data

  def thumbnail_url
    object.thumbnail.url
  end

  def type
    object.type.underscore
  end
end
