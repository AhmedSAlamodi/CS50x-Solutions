--1 List the titles of all movies released in 2008.
SELECT title
FROM movies
WHERE year = 2008;


--2 Determine the birth year of Emma Stone.
SELECT birth
FROM people
WHERE name = 'Emma Stone';


--3 List the titles of all movies with a release date on or after 2018,
-- in alphabetical order.
SELECT title
FROM movies
WHERE year >= 2018
ORDER BY title;


--4 Determine the number of movies with an IMDb rating of 10.0.
SELECT COUNT(*)
FROM ratings
WHERE rating = 10.0;


--5 List the titles and release years of all Harry Potter movies,
-- in chronological order.
SELECT title, year
FROM movies
WHERE title LIKE 'Harry Potter and the %'
ORDER BY year;


--6 Determine the average rating of all movies released in 2012.
SELECT AVG(rating)
FROM ratings
JOIN movies ON ratings.movie_id = movies.id
WHERE movies.year = 2012;


--7 List all movies released in 2010 and their ratings,
-- in descending order by rating.
-- For movies with the same rating, order them alphabetically by title.
SELECT movies.title, ratings.rating
FROM movies
JOIN ratings ON movies.id = ratings.movie_id
WHERE movies.year = 2010
ORDER BY ratings.rating DESC, movies.title ASC;


--8 List the names of all people who starred in Toy Story.
SELECT people.name
FROM people
JOIN stars ON people.id = stars.person_id
JOIN movies ON stars.movie_id = movies.id
WHERE movies.title = 'Toy Story';


--9 List the ID and names of all people who starred in a movie
-- released in 2004, ordered by birth year.
SELECT DISTINCT people.id, people.name
FROM people
JOIN stars ON people.id = stars.person_id
JOIN movies ON stars.movie_id = movies.id
WHERE movies.year = 2004
ORDER BY people.birth;


--10 List the names of all people who have directed a movie
-- that received a rating of at least 9.0.
SELECT DISTINCT people.name
FROM people
JOIN directors ON people.id = directors.person_id
JOIN ratings ON directors.movie_id = ratings.movie_id
WHERE ratings.rating >= 9.0;


--11 List the titles of the five highest rated movies
-- that Chadwick Boseman starred in, starting with the highest rated.
SELECT movies.title
FROM movies
JOIN ratings ON movies.id = ratings.movie_id
JOIN stars ON movies.id = stars.movie_id
JOIN people ON stars.person_id = people.id
WHERE people.name = 'Chadwick Boseman'
ORDER BY ratings.rating DESC
LIMIT 5;


--12 List the titles of all movies in which both Bradley Cooper
-- and Jennifer Lawrence starred.
SELECT DISTINCT movies.title
FROM movies
JOIN stars AS jennifer ON movies.id = jennifer.movie_id
JOIN people AS p1 ON jennifer.person_id = p1.id
JOIN stars AS bradley ON movies.id = bradley.movie_id
JOIN people AS p2 ON bradley.person_id = p2.id
WHERE p1.name = 'Jennifer Lawrence'
  AND p2.name = 'Bradley Cooper';


--13 List the names of all people who starred in a movie
-- in which Kevin Bacon also starred.
-- Kevin Bacon must be the one born in 1958.
SELECT DISTINCT people.name
FROM people
JOIN stars ON people.id = stars.person_id
WHERE stars.movie_id IN (
    SELECT stars.movie_id
    FROM stars
    JOIN people ON stars.person_id = people.id
    WHERE people.name = 'Kevin Bacon'
      AND people.birth = 1958
)
AND people.id != (
    SELECT id
    FROM people
    WHERE name = 'Kevin Bacon'
      AND birth = 1958
);