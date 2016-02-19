class TwoMoviesAndTextSerializer < MediumSerializer
  def data
    {
      movie1_url: object.movie1.url,
      movie2_url: object.movie2.url,
      description1: object.description1,
      description2: object.description2,
    }
  end
end
