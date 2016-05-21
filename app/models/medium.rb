class Medium < ActiveRecord::Base
  VIDEO_FORMATS = %w(video/mp4).freeze
  IMAGE_FORMATS = %w(image/jpeg image/png).freeze

  dragonfly_accessor :thumbnail

  belongs_to :chapter

  validates :type, presence: true
  validates :title_de, :title_en, presence: true
  validates :teaser_de, :teaser_en, presence: true
  validates :thumbnail, presence: true
  validates :chapter, presence: true

  validates_property :mime_type, of: :thumbnail, in: Medium::IMAGE_FORMATS

  translates :title, :teaser
  globalize_accessors
end
