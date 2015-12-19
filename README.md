# Rhino

This is the backend for the interactive book app.

![](http://memeblender.com/wp-content/uploads/2014/04/funny-memes-real-unicorns-have-curves.jpg)


## API

### GET /media/:uuid

Allows to lookup the media for an uuid.

#### Response
{
  "uuid": "6ba9252f-ebe6-4730-b792-7af63aa2a523",
  "type": "movie",
  "url": "/movies/1"
}

### GET /movies/:id

Allows to fetch the details of a movie.

{
  "id": "1",
  "title": "Swag with Beans",
  "asset_url": "/assets/movies/1.mp4"
}
