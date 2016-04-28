class Book < ActiveRecord::Base
  translates :title, :description
  globalize_accessors

  dragonfly_accessor :image

  has_many :chapters

  validates :title_de, :title_en, presence: true
  validates :author, presence: true
  validates :description_de, :description_en, presence: true
  validates :image, presence: true

  def to_s
    title
  end
end
