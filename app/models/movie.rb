class Movie < Medium
  store_accessor :sti_store, :file_uid
  dragonfly_accessor :file

  validates :file, presence: true

  validates_property :format, of: :file, in: Medium::VIDEO_FORMATS
end
