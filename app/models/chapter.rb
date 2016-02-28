class Chapter < ActiveRecord::Base
  belongs_to :book

  validates :number, presence: true
  validates :title, presence: true
  validates :book, presence: true

  default_scope -> { order('chapters.number ASC') }

  def to_s
    "#{book.to_s}: #{number}. #{title}"
  end
end
