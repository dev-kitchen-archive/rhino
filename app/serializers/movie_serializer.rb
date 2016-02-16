class MovieSerializer < MediumSerializer
  def data
    {
      file_url: object.file.url,
    }
  end
end
