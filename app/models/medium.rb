class Medium < ActiveRecord::Base
  dragonfly_accessor :thumbnail

  validates :type, presence: true
  validates :title, presence: true
  validates :teaser, presence: true
  validates :thumbnail, presence: true
end
