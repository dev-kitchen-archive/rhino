# Rhino

This is the backend for the interactive book app.

![](http://memeblender.com/wp-content/uploads/2014/04/funny-memes-real-unicorns-have-curves.jpg)


## API

### GET /:locale/books.json

Allows to list all the available books.

#### `changed_since`

It also supports the optional query param `changed_since` which must be a ISO8601
formatted time string.
If `changed_since` is given, only the entities which have been modified since this given datetime will
be returned.

#### Response

```json
[
  {
    "id": 1,
    "title": "Tralala",
    "author": "Someone",
    "description": "Long text here",
    "image_url": "/asset/W1siZiIsIjIwMTYvMDIvMjgvOHU2Z2pjbWF3Yl9zY3JlZW5jYXB0dXJlX3d0YWdfaW52b2ljZXJfZGV2X2Rvc3NpZXJzXzdfMTQ1MzIxNjc1MzI3My5wbmciXV0?sha=2c42f86d778c3bc4",
    "updated_at": "2016-04-28T21:12:11.743Z"
  },
  {
    "id": 2,
    "title": "Trololo",
    "author": "Someone Else",
    "description": "Another Long text here",
    "image_url": "/asset/W1siZiIsIjIwMTYvMDIvMjgvOHU2Z2pjbWF3Yl9zY3JlZW5jYXB0dXJlX3d0YWdfaW52b2ljZXJfZGV2X2Rvc3NpZXJzXzdfMTQ1MzIxNjc1MzI3My5wbmciXV0?sha=2c42f86d778c3bc4",
    "updated_at": "2016-04-28T21:12:11.743Z"
  },
]
```

### GET /:locale/books/:id/chapters.json

Allows to list all the chapters of a book.

#### `changed_since`

It also supports the optional query param `changed_since` which must be a ISO8601
formatted time string.
If `changed_since` is given, only the entities which have been modified since this given datetime will
be returned.

#### Response

```json
[
  {
    "id": 1,
    "title": "The Beginning",
    "number": 1,
    "updated_at": "2016-04-28T21:12:11.743Z"
  },
  {
    "id": 3,
    "title": "The End",
    "number": 2,
    "updated_at": "2016-04-28T21:12:11.743Z"
  }
]
```

### GET /:locale/media/:uuid.json

Allows to lookup the medium for an uuid.

#### Response

```json
{
  "id": "150f626e-9e1c-4a5d-9722-f0fb1f6ebf6c",
  "chapter_id": 1,
  "type": "movie",
  "title": "Star Wars 7",
  "teaser": "The force awakens",
  "thumbnail_url": "/asset/W1siZiIsIjIwMTYvMDIvMTYvMmxldmxmYm96c19TY3JlZW5zaG90XzIwMTZfMDJfMTZfMTMuMzcuMjgucG5nIl1d?sha=aa7182acf9168d76",
  "data": {
    "file_url": "/asset/W1siZiIsIjIwMTYvMDIvMTYvd2NpeGl1ZzV6X0lDRl9Xb3JzaGlwX1RhZ191bmRfTmFjaHQubXA0Il1d?sha=3852198f753ca9e8"
  },
  "updated_at": "2016-04-28T21:12:11.743Z"
}
```

### GET /:locale/books/:id/media.json

Lists all the media of a book.

#### `changed_since`

It also supports the optional query param `changed_since` which must be a ISO8601
formatted time string.
If `changed_since` is given, only the entities which have been modified since this given datetime will
be returned.

#### Response

```json
[
  {
    "id": "150f626e-9e1c-4a5d-9722-f0fb1f6ebf6c",
    "chapter_id": 1,
    "type": "movie",
    "title": "Star Wars 7",
    "teaser": "The force awakens",
    "thumbnail_url": "/asset/W1siZiIsIjIwMTYvMDIvMTYvMmxldmxmYm96c19TY3JlZW5zaG90XzIwMTZfMDJfMTZfMTMuMzcuMjgucG5nIl1d?sha=aa7182acf9168d76",
    "data": {
      "file_url": "/asset/W1siZiIsIjIwMTYvMDIvMTYvd2NpeGl1ZzV6X0lDRl9Xb3JzaGlwX1RhZ191bmRfTmFjaHQubXA0Il1d?sha=3852198f753ca9e8"
    },
    "updated_at": "2016-04-28T21:12:11.743Z"
  }
]
```
