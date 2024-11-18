drop table if exists movie_actors;
drop table if exists movie;
drop table if exists actor;

Create table movie (
id serial PRIMARY KEY,
title varchar(100),
genre varchar(50),
plot varchar(150),
release_date date
);

Create table actor (
id serial PRIMARY KEY,
name varchar(100),
born_date date,
born_location varchar(50),
height integer
);

create table movie_actors(
movie_id integer references movie(id),
actor_id integer references actor(id),
constraint movie_actors_pk PRIMARY KEY(movie_id,actor_id)
);

-- Movies
INSERT INTO movie (title, genre, plot, release_date) VALUES
('The Dark Knight', 'Action', 'Batman fights against the Joker in Gotham City', '2008-07-18'),
('Inception', 'Sci-Fi', 'Dream thieves perform corporate espionage', '2010-07-16'),
('Pulp Fiction', 'Crime', 'Intersecting stories of Los Angeles criminals', '1994-10-14'),
('The Matrix', 'Sci-Fi', 'A computer programmer discovers reality is not what it seems', '1999-03-31'),
('Forrest Gump', 'Drama', 'Slow-witted but kind-hearted man experiences historical events', '1994-07-06'),
('Jurassic Park', 'Adventure', 'Dinosaur theme park goes horribly wrong', '1993-06-11'),
('The Shawshank Redemption', 'Drama', 'Banker serves life sentence while maintaining his innocence', '1994-09-23'),
('Titanic', 'Romance', 'Love story aboard the ill-fated RMS Titanic', '1997-12-19'),
('The Silence of the Lambs', 'Thriller', 'FBI trainee must work with imprisoned cannibal', '1991-02-14'),
('Avatar', 'Sci-Fi', 'Marine on alien moon must choose between duty and protecting natives', '2009-12-18'),
('The Lion King', 'Animation', 'Young lion prince must reclaim his throne', '1994-06-24'),
('Gladiator', 'Action', 'Roman general seeks revenge against corrupt emperor', '2000-05-05'),
('The Godfather', 'Crime', 'Italian-American crime family power struggles', '1972-03-24'),
('Fight Club', 'Drama', 'Office worker forms underground fight club', '1999-10-15'),
('E.T.', 'Sci-Fi', 'Boy befriends stranded alien', '1982-06-11'),
('Jaws', 'Thriller', 'Police chief hunts giant shark terrorizing beach town', '1975-06-20'),
('The Breakfast Club', 'Drama', 'Five high school students spend Saturday in detention', '1985-02-15'),
('Back to the Future', 'Sci-Fi', 'Teenager accidentally travels back in time', '1985-07-03'),
('The Terminator', 'Sci-Fi', 'Robot assassin pursues woman targeted for termination', '1984-10-26'),
('Die Hard', 'Action', 'Cop battles terrorists in LA skyscraper', '1988-07-20');

-- Actors
INSERT INTO actor (name, born_date, born_location, height) VALUES
('Morgan Freeman', '1937-06-01', 'Memphis, USA', 188),
('Leonardo DiCaprio', '1974-11-11', 'Los Angeles, USA', 183),
('Meryl Streep', '1949-06-22', 'Summit, USA', 168),
('Brad Pitt', '1963-12-18', 'Shawnee, USA', 180),
('Tom Hanks', '1956-07-09', 'Concord, USA', 183),
('Julia Roberts', '1967-10-28', 'Atlanta, USA', 175),
('Denzel Washington', '1954-12-28', 'Mount Vernon, USA', 185),
('Kate Winslet', '1975-10-05', 'Reading, UK', 169),
('Robert De Niro', '1943-08-17', 'New York City, USA', 177),
('Natalie Portman', '1981-06-09', 'Jerusalem, Israel', 160),
('Samuel L. Jackson', '1948-12-21', 'Washington DC, USA', 189),
('Scarlett Johansson', '1984-11-22', 'New York City, USA', 160),
('Christian Bale', '1974-01-30', 'Haverfordwest, UK', 183),
('Emma Stone', '1988-11-06', 'Scottsdale, USA', 168),
('Tom Cruise', '1962-07-03', 'Syracuse, USA', 170),
('Cate Blanchett', '1969-05-14', 'Melbourne, Australia', 174),
('Matt Damon', '1970-10-08', 'Cambridge, USA', 178),
('Jennifer Lawrence', '1990-08-15', 'Louisville, USA', 175),
('Johnny Depp', '1963-06-09', 'Owensboro, USA', 178),
('Nicole Kidman', '1967-06-20', 'Honolulu, USA', 180),
('Anthony Hopkins', '1937-12-31', 'Port Talbot, UK', 175),
('Charlize Theron', '1975-08-07', 'Benoni, South Africa', 177),
('Gary Oldman', '1958-03-21', 'London, UK', 174),
('Sandra Bullock', '1964-07-26', 'Arlington, USA', 171),
('Robert Downey Jr.', '1965-04-04', 'New York City, USA', 174),
('Anne Hathaway', '1982-11-12', 'Brooklyn, USA', 173),
('Daniel Day-Lewis', '1957-04-29', 'London, UK', 187),
('Emma Watson', '1990-04-15', 'Paris, France', 165),
('Will Smith', '1968-09-25', 'Philadelphia, USA', 188),
('Angelina Jolie', '1975-06-04', 'Los Angeles, USA', 169),
('Hugh Jackman', '1968-10-12', 'Sydney, Australia', 190),
('Jennifer Aniston', '1969-02-11', 'Sherman Oaks, USA', 164),
('Michael Caine', '1933-03-14', 'London, UK', 188),
('Viola Davis', '1965-08-11', 'St. Matthews, USA', 165),
('Chris Hemsworth', '1983-08-11', 'Melbourne, Australia', 190),
('Helen Mirren', '1945-07-26', 'London, UK', 163),
('Idris Elba', '1972-09-06', 'London, UK', 189),
('Kate Hudson', '1979-04-19', 'Los Angeles, USA', 168),
('Mark Ruffalo', '1967-11-22', 'Kenosha, USA', 173),
('Michelle Yeoh', '1962-08-06', 'Ipoh, Malaysia', 163);

-- Movie-Actor relationships (sample connections)
INSERT INTO movie_actors (movie_id, actor_id) VALUES
(1, 13), -- Dark Knight - Christian Bale
(1, 23), -- Dark Knight - Gary Oldman
(2, 2),  -- Inception - Leonardo DiCaprio
(2, 26), -- Inception - Anne Hathaway
(3, 4),  -- Pulp Fiction - Brad Pitt
(3, 11), -- Pulp Fiction - Samuel L. Jackson
(4, 29), -- Matrix - Will Smith
(5, 5),  -- Forrest Gump - Tom Hanks
(6, 15), -- Jurassic Park - Tom Cruise
(7, 1),  -- Shawshank - Morgan Freeman
(8, 2),  -- Titanic - Leonardo DiCaprio
(8, 8),  -- Titanic - Kate Winslet
(9, 21), -- Silence of the Lambs - Anthony Hopkins
(10, 30), -- Avatar - Angelina Jolie
(11, 1),  -- Lion King - Morgan Freeman (voice)
(12, 4),  -- Gladiator - Brad Pitt
(13, 9),  -- Godfather - Robert De Niro
(14, 4),  -- Fight Club - Brad Pitt
(15, 26), -- E.T. - Anne Hathaway
(16, 25), -- Jaws - Robert Downey Jr
(17, 24), -- Breakfast Club - Sandra Bullock
(18, 17), -- Back to the Future - Matt Damon
(19, 31), -- Terminator - Hugh Jackman
(20, 15); -- Die Hard - Tom Cruise