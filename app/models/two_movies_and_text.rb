class TwoMoviesAndText < Medium
  store_accessor :sti_store, :description1
  store_accessor :sti_store, :movie1_uid
  store_accessor :sti_store, :description2
  store_accessor :sti_store, :movie2_uid

  dragonfly_accessor :movie1
  dragonfly_accessor :movie2

  validates :movie1, presence: true
  validates :movie2, presence: true
  validates :description1_de, :description1_en, presence: true
  validates :description2_de, :description2_en, presence: true

  validates_property :format, of: :movie1, in: Medium::VIDEO_FORMATS
  validates_property :format, of: :movie2, in: Medium::VIDEO_FORMATS

  translates :description1, :description2
  globalize_accessors
end
