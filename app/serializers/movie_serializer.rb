class MovieSerializer < MediumSerializer
  def data
    {
      file_url: object.file.remote_url,
    }
  end
end
