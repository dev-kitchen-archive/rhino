class Medium < ActiveRecord::Base
  dragonfly_accessor :thumbnail

  belongs_to :chapter

  validates :type, presence: true
  validates :title, presence: true
  validates :teaser, presence: true
  validates :thumbnail, presence: true
  validates :chapter, presence: true
end
