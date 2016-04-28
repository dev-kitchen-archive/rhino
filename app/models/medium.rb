class Medium < ActiveRecord::Base
  dragonfly_accessor :thumbnail

  belongs_to :chapter

  validates :type, presence: true
  validates :title_de, :title_en, presence: true
  validates :teaser_de, :teaser_en, presence: true
  validates :thumbnail, presence: true
  validates :chapter, presence: true

  translates :title, :teaser
  globalize_accessors
end
