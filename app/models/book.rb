class Book < ActiveRecord::Base
  dragonfly_accessor :image

  has_many :chapters

  validates :title, presence: true
  validates :author, presence: true
  validates :description, presence: true
  validates :image, presence: true
end
