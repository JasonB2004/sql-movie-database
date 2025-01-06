-- average age from actors
SELECT ROUND(AVG(2024 - year_of_birth), 0) AS average_age
FROM "Actor";

-- Find the number of different countries in which actors 
-- from the movie “Beautiful Mind” were born.
SELECT COUNT(DISTINCT "BirthLocation".country) AS num_countries
FROM "Actor"
JOIN "BirthLocation" ON "Actor"."id_BirthLocation" = "BirthLocation".id
WHERE "Actor".id IN (
    SELECT "Actor".id
    FROM "MovieActor"
    JOIN "Movie" ON "MovieActor"."id_Movie" = "Movie".id
	JOIN "Actor" ON "MovieActor"."id_Actor" = "Actor".id
    WHERE "Movie".title = 'Beautiful Mind'
);

-- # of actors with green eye color
SELECT COUNT(*) AS green_eyes_actors_count
FROM "Actor"
WHERE "Actor".eye_color = 'Green';

-- # of Brad Pitt Movies
SELECT COUNT(*) AS brad_pitt_movies
FROM "MovieActor"
JOIN "Movie" ON "MovieActor"."id_Movie" = "Movie".id
JOIN "Actor" ON "MovieActor"."id_Actor" = "Actor".id
WHERE "Actor".first_name ||' '|| "Actor".surname = 'Brad Pitt';

-- Find the minimum, average and maximum budget for each genre type of movie
SELECT "Genre".type AS genre_type,
	MIN("Movie".budget) AS min_budget,
    AVG("Movie".budget) AS avg_budget,
    MAX("Movie".budget) AS max_budget
FROM "MovieGenre"
JOIN "Movie" ON "MovieGenre"."id_Movie" = "Movie".id
JOIN "Genre" ON "MovieGenre"."id_Genre" = "Genre".id
GROUP BY "Genre".type;

-- Find the average rating for each movie which has director 
-- born in Toronto or blue eye color
SELECT "Movie".title, AVG("Movie".rating) AS avg_rating_blue_eyes_and_toronto
FROM "Movie"
JOIN "Director" ON "Director"."id_Movie" = "Movie".id
JOIN "BirthLocation" ON "Director"."id_BirthLocation" = "BirthLocation".id
WHERE "BirthLocation".city = 'Toronto' -- there is no director eye_color
GROUP BY "Movie".id, "Movie".title


-- Find all the movies that have actors born in at least two different countries.
SELECT DISTINCT "Movie".title AS movies_2_diff_c
FROM "MovieActor"
JOIN "Movie" ON "MovieActor"."id_Movie" = "Movie".id
JOIN "Actor" ON "MovieActor"."id_Actor" = "Actor".id
JOIN "BirthLocation" ON "Actor"."id_BirthLocation" = "BirthLocation".id
GROUP BY "Movie".id
HAVING COUNT(DISTINCT "BirthLocation".country) >= 2;

-- Find how many awards each movie in total has 
-- received and rank the movies (display the title) 
-- by the amount of awards.
SELECT "Movie".title, COUNT("Award".award_id) AS total_awards
FROM "Award"
JOIN "Movie" ON "Award"."id_Movie" = "Movie".id
GROUP BY "Movie".id, "Movie".title
ORDER BY total_awards DESC;