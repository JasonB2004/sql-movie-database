-- Movie Table
INSERT INTO public."Movie" (title, release_time, date, rating, budget, gross) 
VALUES 
    ('Spider-Man: Into the Spider-Verse', '20:00:00', '2018-12-14', 8, 90000000, 375500000),
    ('The Dark Knight', '20:00:00', '2008-07-18', 9, 185000000, 1004558444),
    ('Twin Peaks: The Missing Pieces', '00:00:00', '2014-07-29', 8, 5000000, 10000000),
    ('Grown Ups', '00:00:00', '2010-06-25', 6, 80000000, 271440000),
    ('Beautiful Mind', '00:00:00', '2001-12-21', 8, 60000000, 313000000),
	('Ant-Man', '20:00:00', '2015-07-17', 7, 130000000, 519000000),
    ('Fight Club', '00:00:00', '1999-10-15', 8, 63000000, 100000000),
    ('The Captive', '00:00:00', '2014-12-12', 7, 20000000, 15000000);  -- Adding The Captive

-- BirthLocation Table
INSERT INTO public."BirthLocation" (country, city, state) 
VALUES 
    ('USA', 'New York', 'NY'),
    ('USA', 'Los Angeles', 'CA'),
    ('UK', 'London', 'England'),
    ('USA', 'Eureka', 'CA'),
    ('USA', 'Philadelphia', 'PA'),
	('USA', 'San Francisco', 'CA'),  
    ('USA', 'Chicago', 'IL'),
	('Canada', 'Toronto', 'ON');

-- University Table
INSERT INTO public."University" (name, is_private, color) 
VALUES 
    ('New York University', TRUE, 'Violet'),
    ('University of Southern California', TRUE, 'Cardinal Red'),
    ('Harvard University', TRUE, 'Crimson'),
    ('Stanford University', FALSE, 'Cardinal'),
    ('University of California, Los Angeles', FALSE, 'Blue and Gold'),
    ('Princeton University', TRUE, 'Orange and Black'),
	('California Institute of Technology', TRUE, 'Blue and Gold'),  
    ('University of Chicago', TRUE, 'Maroon');

-- Director Table
INSERT INTO public."Director" (first_name, surname, year_of_birth, "id_BirthLocation", "id_Movie", "id_University")
VALUES 
    ('Bob', 'Persichetti', 1973, 2, 1, 1), 
    ('Christopher', 'Nolan', 1970, 2, 2, 4),
    ('David', 'Lynch', 1946, 4, 3, 5),
    ('Dennis', 'Dugan', 1946, 1, 4, 5),
    ('Ron', 'Howard', 1954, 5, 5, 6),
	('Peyton', 'Reed', 1962, 1, 4, 1),  
    ('David', 'Fincher', 1962, 2, 5, 2),
    ('Atom', 'Egoyan', 1960, 8, 8, 7);  

-- Actor Table
INSERT INTO public."Actor" (first_name, surname, year_of_birth, "id_BirthLocation", eye_color) 
VALUES 
    ('Shameik', 'Moore', 1995, 1, 'Brown'),  
    ('Jake', 'Johnson', 1978, 2, 'Blue'),    
    ('Hailee', 'Steinfeld', 1996, 2, 'Hazel'), 
    ('Christian', 'Bale', 1974, 1, 'Hazel'), 
    ('Heath', 'Ledger', 1979, 2, 'Brown'),   
    ('Kyle', 'McLachlan', 1959, 3, 'Brown'),
    ('Adam', 'Sandler', 1966, 1, 'Brown'),  
    ('Kevin', 'James', 1965, 1, 'Brown'), 
    ('Chris', 'Rock', 1965, 1, 'Black'),
    ('Russell', 'Crowe', 1964, 5, 'Blue'),
	('Paul', 'Rudd', 1969, 1, 'Brown'),  
    ('Evangeline', 'Lilly', 1979, 1, 'Hazel'), 
    ('Brad', 'Pitt', 1963, 2, 'Blue'),   
    ('Edward', 'Norton', 1969, 2, 'Green'),
    ('Ryan', 'Reynolds', 1976, 1, 'Brown'),  
    ('Scott', 'Speedman', 1975, 2, 'Blue'),   
    ('Rosario', 'Dawson', 1979, 3, 'Brown');  

-- Department Table 
INSERT INTO public."Department" ("id_University", name) 
VALUES 
    (1, 'Performing Arts'), 
    (2, 'Film and Television'), 
    (3, 'Film Studies'), 
    (4, 'Theater Arts'),
    (5, 'Cinema Studies'),
    (6, 'Mathematics and Physics'),
	(7, 'Film Studies');  

-- MovieActor Table 
INSERT INTO public."MovieActor" ("id_Movie", "id_Actor") 
VALUES 
    (1, 1), 
    (1, 2), 
    (1, 3), 
    (2, 4), 
    (2, 5), 
    (3, 6),
    (4, 7),   
    (4, 8),
    (4, 9),
    (5, 10),
	(6, 11),  
    (6, 12),  
    (7, 13),  
    (7, 14),
    (7, 15),  
    (8, 16),  
    (8, 17);  

-- Genre Table
INSERT INTO public."Genre" (type) 
VALUES 
    ('Animation'),  
    ('Adventure'), 
    ('Action'), 
    ('Drama'),
    ('Mystery'),
    ('Comedy'),
    ('Biography'),
    ('Thriller');  -- Adding Thriller for The Captive

-- MovieGenre Table 
INSERT INTO public."MovieGenre" ("id_Movie", "id_Genre") 
VALUES 
    (1, 1), 
    (1, 2), 
    (2, 3), 
    (2, 4), 
    (3, 5),
    (4, 6),
    (5, 7),
	(6, 2),
	(6, 3),
	(7, 4),
	(7, 6),
    (8, 8);  -- Adding Thriller to The Captive

-- Cinema Table
INSERT INTO public."Cinema" (cinema_name, location, type) 
VALUES 
    ('AMC Empire 25', 'New York, NY', 'Multiplex'),
    ('Cinemark 18', 'Los Angeles, CA', 'Multiplex');

-- Ticket Table
INSERT INTO public."Ticket" (price, "id_Cinema") 
VALUES 
    (15.00, 1),
    (12.50, 2);

-- ShowTime Table
INSERT INTO public."ShowTime" (show_name, show_time, show_duration, "id_Cinema_Ticket", "id_Movie") 
VALUES 
    ('Evening Show', '18:00:00', 150, 1, 1),
    ('Matinee', '14:00:00', 150, 2, 1),
    ('Evening Show', '19:00:00', 120, 1, 2),
    ('Night Show', '21:00:00', 120, 2, 2),
    ('Midnight Special', '23:00:00', 120, 1, 3),
    ('Evening Show', '19:00:00', 135, 1, 5),
    ('Special Screening', '20:00:00', 150, 1, 8);  -- Adding showtime for The Captive

-- Award Table
INSERT INTO public."Award" (award_name, "id_Movie") 
VALUES 
    ('Best Animated Feature', 1),
    ('Oscar', 2), 
    ('Golden Globe', 2),
    ('Best Director', 3), 
    ('Best Ensemble Cast', 4),
    ('Best Picture', 5);  

-- Category Table
INSERT INTO public."Category" (category_name, "award_id_Award", "id_Movie_Award") 
VALUES 
    ('Best Actor', 1, 2), 
    ('Best Supporting Actor', 2, 3),  
    ('Best Director', 2, 3), 
    ('Best Ensemble Cast', 3, 5), 
    ('Best Cinematography', 4, 5),
    ('Best Costume Design', 5, 6);
SELECT * FROM public."Movie"