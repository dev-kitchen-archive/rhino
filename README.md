# Rhino

This is the backend for the interactive book app.

![](http://memeblender.com/wp-content/uploads/2014/04/funny-memes-real-unicorns-have-curves.jpg)


## API

### GET /media/:uuid

Allows to lookup the media for an uuid.

#### Response

```json
{
  "uuid": "6ba9252f-ebe6-4730-b792-7af63aa2a523",
  "type": "movie",
  "id": 1,
  "uri": "/movies/1"
  "title": "Swag with Beans",
  "teaser": "A short text to tease the viewer",
  "thumbnail_uri": "/assets/movies/1-thumbnail.jpg"
}
```

### GET /movies/:id

Allows to fetch the details of a movie.

#### Response

```json
{
  "id": 1,
  "asset_url": "/assets/movies/1.mp4",
  "description": "A long text to describe the movie",
  "updated_at": "2016-01-19T20:19:42+01:00",
  "created_at": "2016-01-05T10:32:22+01:00"
}
```

### GET /image/:id

Allows to fetch the details of an image.

#### Response

```json
{
  "id": 1,
  "asset_url": "/assets/images/1.jpg",
  "description": "A long text to describe the image",
  "updated_at": "2016-01-19T20:19:42+01:00",
  "created_at": "2016-01-05T10:32:22+01:00"
}
```
