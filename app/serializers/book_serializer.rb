class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :description, :updated_at
  attributes :image_url

  def image_url
    object.image.url
  end
end
