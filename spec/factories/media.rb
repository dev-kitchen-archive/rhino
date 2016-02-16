FactoryGirl.define do
  factory :medium do
    title 'Cool Thing'
    teaser 'Cool Things are happening, check it out'

    factory :movie, class: Movie do
      thumbnail Rails.root.join('spec', 'fixtures', 'movie.png')
      file Rails.root.join('spec', 'fixtures', 'movie.mp4')
    end
  end
end
