CREATE TABLE properties (
    property_code VARCHAR PRIMARY KEY,
    property_type VARCHAR,
    place_type VARCHAR,
    name VARCHAR,
    check_in_time TIME,
    check_out_time TIME,
    suppored_booking_type VARCHAR, -- you can still use ENUM if preferred
    property_details JSONB,        -- contains max_guests, bedrooms, bathrooms, beds
    address JSONB,                 -- nested structure: location, fullAddress, city, country
    amenity_groups JSONB,          -- list of amenity groups and amenities
    descriptions JSONB,            -- array of objects (id, title, paragraphs)
    general_descriptions JSONB,    -- single object (id, title, paragraphs)
    images JSONB,                  -- list of images with id, caption, url, source
    highlighting_features JSONB,   -- array of { id, name }
    contact JSONB                  -- phone, email
);
