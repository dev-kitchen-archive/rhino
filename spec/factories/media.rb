FactoryGirl.define do
  factory :medium do
    chapter
    title_de 'Cool Thing'
    title_en 'Cool Thing'
    teaser_de 'Cool Things are happening, check it out'
    teaser_en 'Cool Things are happening, check it out'

    factory :movie, class: Movie do
      type 'Movie'
      thumbnail Rails.root.join('spec', 'fixtures', 'movie.png')
      file Rails.root.join('spec', 'fixtures', 'movie.mp4')
    end
  end
end
