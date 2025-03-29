-- Create galaxy table
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    type TEXT,
    distance NUMERIC,
    is_observable BOOLEAN NOT NULL,
    discovered DATE NOT NULL
);

-- Insert sample data into galaxy table
INSERT INTO galaxy (name, type, distance, is_observable, discovered)
VALUES 
    ('Milky Way', 'Spiral', 0, TRUE, '2000-01-01'),
    ('Andromeda', 'Spiral', 2500000, TRUE, '2000-02-01'),
    ('Whirlpool', 'Spiral', 23100000, TRUE, '1999-11-01'),
    ('Sombrero', 'Spiral', 28000000, FALSE, '2010-01-01'),
    ('Triangulum', 'Spiral', 3000000, TRUE, '2005-06-01');

-- Create star table
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    galaxy_id INT REFERENCES galaxy(galaxy_id) ON DELETE CASCADE,
    type TEXT,
    brightness NUMERIC,
    is_visible BOOLEAN NOT NULL
);

-- Insert sample data into star table
INSERT INTO star (name, galaxy_id, type, brightness, is_visible)
VALUES 
    ('Sun', 1, 'Yellow Dwarf', 1, TRUE),
    ('Alpha Centauri', 1, 'Triple Star', 0.5, TRUE),
    ('Betelgeuse', 2, 'Red Supergiant', 8000, TRUE),
    ('Sirius', 1, 'Binary Star', 25.4, TRUE),
    ('Rigel', 3, 'Blue Supergiant', 12000, FALSE);

-- Create planet table
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    star_id INT REFERENCES star(star_id) ON DELETE CASCADE,
    type TEXT,
    distance_from_star NUMERIC,
    has_rings BOOLEAN NOT NULL
);

-- Insert sample data into planet table
INSERT INTO planet (name, star_id, type, distance_from_star, has_rings)
VALUES 
    ('Earth', 1, 'Terrestrial', 0, FALSE),
    ('Mars', 1, 'Terrestrial', 227.9, FALSE),
    ('Jupiter', 1, 'Gas Giant', 778.3, TRUE),
    ('Saturn', 1, 'Gas Giant', 1433.5, TRUE),
    ('Venus', 1, 'Terrestrial', 108.2, FALSE),
    ('Neptune', 1, 'Ice Giant', 4497.1, TRUE),
    ('Uranus', 1, 'Ice Giant', 2871, TRUE),
    ('Mercury', 1, 'Terrestrial', 57.9, FALSE),
    ('Pluto', 1, 'Dwarf Planet', 5913.5, FALSE),
    ('Kepler-452b', 2, 'Super-Earth', 1400, FALSE),
    ('Gliese 581g', 3, 'Earth-like', 0, FALSE),
    ('HD 209458b', 4, 'Hot Jupiter', 140, TRUE);

-- Create moon table
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    planet_id INT REFERENCES planet(planet_id) ON DELETE CASCADE,
    type TEXT,
    diameter NUMERIC,
    has_atmosphere BOOLEAN NOT NULL
);

-- Insert sample data into moon table
INSERT INTO moon (name, planet_id, type, diameter, has_atmosphere)
VALUES 
    ('Moon', 1, 'Rocky', 3474.8, FALSE),
    ('Phobos', 2, 'Rocky', 22.4, FALSE),
    ('Deimos', 2, 'Rocky', 12.4, FALSE),
    ('Io', 3, 'Volcanic', 3643.2, FALSE),
    ('Europa', 3, 'Icy', 3121.6, FALSE),
    ('Ganymede', 3, 'Icy', 5268.0, FALSE),
    ('Callisto', 3, 'Icy', 4820.6, FALSE),
    ('Titan', 4, 'Icy', 5150.0, TRUE),
    ('Rhea', 4, 'Icy', 1527.6, FALSE),
    ('Iapetus', 4, 'Icy', 1469.0, FALSE),
    ('Triton', 5, 'Icy', 2706.8, TRUE),
    ('Charon', 6, 'Rocky', 1212.0, FALSE),
    ('Titania', 7, 'Rocky', 1578.0, FALSE),
    ('Oberon', 7, 'Rocky', 1523.0, FALSE),
    ('Miranda', 7, 'Rocky', 471.6, FALSE),
    ('Enceladus', 4, 'Icy', 504.2, TRUE),
    ('Mimas', 4, 'Icy', 396.0, FALSE),
    ('Hyperion', 4, 'Icy', 270.0, FALSE),
    ('Ganymede', 8, 'Icy', 5268.0, FALSE);

-- Create galaxy_cluster table
CREATE TABLE galaxy_cluster (
    cluster_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    distance NUMERIC,
    galaxy_count INT NOT NULL,
    discovered DATE NOT NULL
);

-- Insert sample data into galaxy_cluster table
INSERT INTO galaxy_cluster (name, distance, galaxy_count, discovered)
VALUES 
    ('Local Group', 0, 50, '1930-01-01'),
    ('Virgo Cluster', 50000000, 1300, '1960-04-01'),
    ('Coma Cluster', 320000000, 1000, '1980-11-01'),
    ('Hercules Cluster', 500000000, 1000, '2000-01-01'),
    ('Bootes Void', 700000000, 60, '2010-01-01');
