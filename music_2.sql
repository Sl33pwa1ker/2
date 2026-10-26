CREATE TABLE genre (
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE artist (
    artist_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL
);

CREATE TABLE genre_artist (
    genre_id INTEGER NOT NULL REFERENCES genre(genre_id),
    artist_id INTEGER NOT NULL REFERENCES artist(artist_id),
    PRIMARY KEY (genre_id, artist_id)
);

CREATE TABLE album (
    album_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    release_year INTEGER NOT NULL
);

CREATE TABLE artist_album (
    artist_id INTEGER NOT NULL REFERENCES artist(artist_id),
    album_id INTEGER NOT NULL REFERENCES album(album_id),
    PRIMARY KEY (artist_id, album_id)
);


CREATE TABLE track (
    track_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    duration INTEGER NOT NULL,
    album_id INTEGER NOT NULL REFERENCES album(album_id)
);

CREATE TABLE collection (
    collection_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    release_year INTEGER NOT NULL
);


CREATE TABLE collection_track (
    collection_id INTEGER NOT NULL REFERENCES collection(collection_id),
    track_id INTEGER NOT NULL REFERENCES track(track_id),
    PRIMARY KEY (collection_id, track_id)
);
