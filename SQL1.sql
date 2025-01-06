-- All directors born in Canada
SELECT first_name || ' ' || surname AS full_name
FROM "Director"
JOIN "BirthLocation" ON "Director"."id_BirthLocation" = "BirthLocation".id
WHERE "BirthLocation".country = 'Canada';

-- Movies directed by David Lynch
SELECT "Movie".title
FROM "Director"
JOIN "Movie" ON "Director"."id_Movie" = "Movie".id
WHERE "Director".first_name || ' ' || "Director".surname = 'David Lynch';

-- List of all actors who played in movies for 
-- which cost of production was more than 1m
SELECT "Actor".first_name || ' ' || "Actor".surname AS full_name_1m_budget, 
	"Movie".budget AS budget_USD,
	ROUND(("Movie".budget * 1.39)::numeric, 2) AS budget_CAD,
	ROUND(("Movie".budget * 1.39)::numeric, 2) AS budget_JPY,  
	ROUND(("Movie".budget * 0.014)::numeric, 2) AS budget_RUB,  
    ROUND(("Movie".budget * 0.012)::numeric, 2) AS budget_EUR,  
    ROUND(("Movie".budget * 0.011)::numeric, 2) AS budget_CHF
FROM "MovieActor"
JOIN "Movie" ON "MovieActor"."id_Movie" = "Movie".id
JOIN "Actor" ON "MovieActor"."id_Actor" = "Actor".id
WHERE "Movie".budget >= 1000000;

-- Using LIKE operator find all directors whose surname start with "A" and "D
SELECT "Director".first_name || ' ' || "Director".surname AS surname_A_D
FROM "Director"
WHERE "Director".surname LIKE 'A%' OR "Director".surname LIKE 'D%';

-- Find all comedy movies in which there is a 
-- playing actor who is less than 40
SELECT DISTINCT "Movie".title AS comedy_movie
FROM "MovieGenre"
JOIN "Movie" ON "MovieGenre"."id_Movie" = "Movie".id
JOIN "Genre" ON "MovieGenre"."id_Genre" = "Genre".id
JOIN "MovieActor" ON "MovieActor"."id_Movie" = "Movie".id
JOIN "Actor" ON "MovieActor"."id_Actor" = "Actor".id
WHERE "Genre".type = 'Comedy' AND "Actor".year_of_birth <= 1984;
-- (EXTRACT(YEAR FROM CURRENT_DATE) - "Actor".year_of_birth) < 40;

-- Find all comedy movies in which there is a playing actor who is less than 40 using nested queries
SELECT title AS comedy_movie
FROM "Movie"
WHERE id IN (
    SELECT "MovieActor"."id_Movie"
    FROM "MovieActor"
    JOIN "Actor" ON "MovieActor"."id_Actor" = "Actor".id
    WHERE (2024 - "Actor".year_of_birth) < 40
) AND id IN (
    SELECT "MovieGenre"."id_Movie"
    FROM "MovieGenre"
    JOIN "Genre" ON "MovieGenre"."id_Genre" = "Genre".id
    WHERE "Genre".type = 'Comedy'
);

-- Find all the pairs of actors who have blue eye color. 
-- Produce pairs in alphabetic order, e.g., (Howard before lynch)
-- and do not produce pairs like (Lynch, Lynch)
SELECT 
    A1.first_name || ' ' || A1.surname AS actor_1,
    A2.first_name || ' ' || A2.surname AS actor_2
FROM 
    "Actor" A1, "Actor" A2
WHERE 
    A1.eye_color = 'Blue' AND
    A2.eye_color = 'Blue' AND
	A1.id < A2.id 