create table if not exists genre (
id SERIAL not null primary key,
name varchar(50) not null
);

create table if not exists artist(
id SERIAL not null primary key,
nick_name varchar(50) not null
);

create table if not exists genre_artist(
id SERIAL primary key,
genre_id integer not null references genre(id),
artist_id integer not null references artist(id)
);

create table if not exists album(
id SERIAL not null primary key,
album_name varchar(100) not null,
album_year integer not null,
constraint album_year check (album_year > 1000)
); 

create table if not exists genre_album(
id SERIAL primary key,
album_id integer not null references album(id),
artist_id integer not null references artist(id)
);

create table if not exists track(
id SERIAL not null primary key,
track_name varchar(100) not null,
track_length integer not null
constraint track_length check (track_length > 0)
); 

create table if not exists songs_collection(
id SERIAL not null primary key,
collection_year integer not null,
constraint collection_year check (collection_year > 1000),
collection_name varchar(100) not null);

create table if not exists track_collection(
id SERIAL primary key,
track_id integer not null references track(id),
collection_id integer not null references songs_collection(id)
);
