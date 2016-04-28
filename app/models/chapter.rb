class Chapter < ActiveRecord::Base
  belongs_to :book

  validates :number, presence: true
  validates :title_de, :title_en, presence: true
  validates :book, presence: true

  has_many :media

  translates :title
  globalize_accessors

  default_scope -> { order('chapters.number ASC') }

  def to_s
    "#{book.to_s}: #{number}. #{title}"
  end
end
