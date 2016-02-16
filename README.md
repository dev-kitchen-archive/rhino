# Rhino

This is the backend for the interactive book app.

![](http://memeblender.com/wp-content/uploads/2014/04/funny-memes-real-unicorns-have-curves.jpg)


## API

### GET /media/:uuid

Allows to lookup the medium for an uuid.

#### Response

```json
{
  "id": "150f626e-9e1c-4a5d-9722-f0fb1f6ebf6c",
  "type": "movie",
  "title": "Star Wars 7",
  "teaser": "The force awakens",
  "thumbnail_url": "/asset/W1siZiIsIjIwMTYvMDIvMTYvMmxldmxmYm96c19TY3JlZW5zaG90XzIwMTZfMDJfMTZfMTMuMzcuMjgucG5nIl1d?sha=aa7182acf9168d76",
  "data": {
    "file_url": "/asset/W1siZiIsIjIwMTYvMDIvMTYvd2NpeGl1ZzV6X0lDRl9Xb3JzaGlwX1RhZ191bmRfTmFjaHQubXA0Il1d?sha=3852198f753ca9e8"
  }
}
```
