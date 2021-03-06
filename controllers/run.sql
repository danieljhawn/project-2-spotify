INSERT INTO cities
    (city, country, createdAt, updatedAt)
SELECT distinct city, country, now(), now()
FROM spotify_db.Spotifies;
UPDATE cities a
        INNER JOIN
    cityCoords ON cityCoords
.city = a.city
        AND cityCoords.country = a.country
SET 
    lat
= latitude,
    lon = longitude;


INSERT INTO genres
    (name, createdAt, updatedAt)
SELECT DISTINCT artist_genres, now(), now()
FROM Spotifies;
INSERT INTO listeners
    (count, cityId, genreId, createdAt, updatedAt)
SELECT
    count, cities.id as cityid, genres.id as genreid, now(), now()
FROM
    (SELECT
        SUM(listeners) AS count, city, country, artist_genres
    FROM
        Spotifies
    GROUP BY city , country , artist_genres) yonge
    INNER JOIN
    genres ON artist_genres = name
    INNER JOIN
    cities ON cities.city = yonge.city and cities.country = yonge.country  