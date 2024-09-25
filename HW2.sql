CREATE TABLE IF NOT EXISTS genre (
id SERIAL NOT NULL PRIMARY KEY,
name varchar(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS artist(
id SERIAL NOT NULL PRIMARY KEY,
nick_name varchar(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS genre_artist(
id SERIAL PRIMARY KEY,
genre_id integer NOT NULL REFERENCES genre(id),
artist_id integer NOT NULL REFERENCES artist(id)
);

CREATE TABLE IF NOT EXISTS album(
id SERIAL NOT NULL PRIMARY KEY,
album_name varchar(100) NOT NULL,
album_year integer NOT NULL,
CONSTRAINT album_year CHECK (album_year > 1000)
);

CREATE TABLE IF NOT EXISTS genre_album(
id SERIAL PRIMARY KEY,
album_id integer NOT NULL REFERENCES album(id),
artist_id integer NOT NULL REFERENCES artist(id)
);

CREATE TABLE IF NOT EXISTS track(
id SERIAL NOT NULL PRIMARY KEY,
track_name varchar(100) NOT NULL,
track_length integer NOT NULL
CONSTRAINT track_length CHECK (track_length > 0)
);

CREATE TABLE IF NOT EXISTS songs_collection(
id SERIAL NOT NULL PRIMARY KEY,
collection_year integer NOT NULL,
CONSTRAINT collection_year CHECK (collection_year > 1000),
collection_name varchar(100) NOT NULL);

CREATE TABLE IF NOT EXISTS track_collection(
id SERIAL PRIMARY KEY,
track_id integer NOT NULL REFERENCES track(id),
collection_id integer NOT NULL REFERENCES songs_collection(id)
);
