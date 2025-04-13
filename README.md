# Airbnb
Properties TablePurpose:

The properties table stores detailed information about a property including address, amenities, images, and nested meta info — all in a single table using PostgreSQL’s JSONB types to reduce table fragmentation.

#### 📌 Basic Info

Column Name Type Description  

```js
+---------------------------+
|        properties         |
+---------------------------+
| property_code : VARCHAR  |
| property_type : VARCHAR  |
| place_type : VARCHAR     |
| name : VARCHAR           |
| check_in_time : TIME     |
| check_out_time : TIME    |
| supported_booking_type   |
| property_details : JSONB |
|   └─ max_guests          |
|   └─ total_bedrooms      |
|   └─ bathrooms           |
|   └─ beds                |
| address : JSONB          |
|   └─ address.location    |
|   └─ fullAddress         |
|   └─ city.name           |
|   └─ country.name        |
| amenity_groups : JSONB   |
|   └─ groupName           |
|   └─ amenities[]         |
| descriptions : JSONB     |
|   └─ id, title           |
|   └─ paragraphs[]        |
| general_descriptions     |
|   └─ id, title           |
|   └─ paragraphs[]        |
| images : JSONB           |
|   └─ id, caption, url    |
| highlighting_features    |
|   └─ id, name            |
| contact : JSONB          |
|   └─ phone, email        |
+---------------------------+

```

#### 🧩 JSONB Columns (Expandable Data)



#### 🏡 property_details (JSONB)

#### 

- max_guests – Maximum number of guests

- total_bedrooms – Number of bedrooms

- bathrooms – Number of bathrooms

- beds – Number of beds

Example:

```js
{
  "max_guests": 2,
  "total_bedrooms": 1,
  "bathrooms": 1,
  "beds": 1
}

```

#### 📍 address (JSONB)

- fullAddress – Human-readable address

- location – GPS coordinates (Point type)

- city.name – City name

- city.location – City's coordinates

- country.name – Country name

- country.code – ISO country code

Example:

```js
{
  "address": {
    "location": { "type": "Point", "coordinates": [-86.89721, 16.10199] },
    "fullAddress": "Jerico, Isla de Utila, Honduras",
    "city": {
      "name": "Isla de Utila",
      "location": { "type": "Point", "coordinates": [-86.94017, 16.09409] }
    },
    "country": { "name": "Honduras", "code": "HN" }
  }
}

```

#### 🌿 amenity_groups (JSONB)

An array of grouped amenities.

- groupName – E.g., General

- amenities[] – List of amenities with id and name

Example:

```js
[
  {
    "id": "general",
    "groupName": "General",
    "amenities": [
      { "id": "air-conditioning", "name": "Air conditioning" },
      { "id": "garden", "name": "Garden" }
    ]
  }
]

```

#### 📝 descriptions (JSONB)

An array of content blocks (sectioned description).

- id – e.g., location, services

- title – Section title

- paragraphs[] – List of text paragraphs

Example:

```js
[
  {
    "id": "location",
    "title": "Location",
    "paragraphs": [
      "A very nice option for those who like to be on the move!",
      "Places nearby: Chepes Beach."
    ]
  }
]

```

#### 📃 general_descriptions (JSONB)

- id, title

- paragraphs[] – List of general description paragraphs

Example:

```js
{
  "id": "general",
  "title": "General",
  "paragraphs": [
    "Free Wi-Fi and parking available.",
    "Pet-friendly, with BBQ area and laundry."
  ]
}

```

#### 🖼 images (JSONB)

An array of image metadata.

- id – Image ID

- caption – Image caption

- url – Full image URL

- source – E.g., RATE_HAWK

Example:

```js
[
  {
    "id": "1",
    "caption": "Front view",
    "url": "https://cdn.example.com/image.jpg",
    "source": "RATE_HAWK"
  }
]

```

#### 🌟 highlighting_features (JSONB)

A list of highlighted features shown to guests.

- id

- name – E.g., Free Wi-Fi, Free Parking

Example:

```js
[
  { "id": "free-wifi", "name": "Free Wi-Fi" },
  { "id": "free-parking", "name": "Free Parking" }
]

```

#### 📞 contact (JSONB)

- phone

- email

Example:

```js
{
  "phone": "+1234567890",
  "email": "required@acbontroller.com"
}

```
