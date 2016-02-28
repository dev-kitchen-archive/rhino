FactoryGirl.define do
  factory :medium do
    chapter
    title 'Cool Thing'
    teaser 'Cool Things are happening, check it out'

    factory :movie, class: Movie do
      type 'Movie'
      thumbnail Rails.root.join('spec', 'fixtures', 'movie.png')
      file Rails.root.join('spec', 'fixtures', 'movie.mp4')
    end
  end
end
