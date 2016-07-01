class TwoMoviesAndTextSerializer < MediumSerializer
  def data
    {
      movie1_url: object.movie1.remote_url,
      movie2_url: object.movie2.remote_url,
      description1: object.description1,
      description2: object.description2,
    }
  end
end
