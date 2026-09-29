--1 List the names of all songs in the database.
SELECT name
FROM songs;


--2 List the names of all songs in increasing order of tempo.
SELECT name
FROM songs
ORDER BY tempo;


--3 List the names of the 5 longest songs, in descending order of duration.
SELECT name
FROM songs
ORDER BY duration_ms DESC
LIMIT 5;


--4 List the names of songs with danceability, energy,
-- and valence greater than 0.75.
SELECT name
FROM songs
WHERE danceability > 0.75
  AND energy > 0.75
  AND valence > 0.75;


--5 Calculate the average energy of all songs.
SELECT AVG(energy)
FROM songs;


--6 List the names of songs by Post Malone.
SELECT name
FROM songs
WHERE artist_id = (
    SELECT id
    FROM artists
    WHERE name = 'Post Malone'
);


--7 Calculate the average energy of songs by Drake.
SELECT AVG(energy)
FROM songs
JOIN artists ON songs.artist_id = artists.id
WHERE artists.name = 'Drake';


--8 List the names of songs that feature other artists.
SELECT name
FROM songs
WHERE name LIKE '%feat.%';