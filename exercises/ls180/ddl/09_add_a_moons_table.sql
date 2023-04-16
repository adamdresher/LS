/* create a moons table */
CREATE TABLE moons (
             id serial PRIMARY KEY,
             planet_id int NOT NULL REFERENCES planets(id),
             designation int NOT NULL, -- the order in which the moon is found
             semi_major_axis numeric, -- the average distance in km from the planet to the moon when it is at its fartherest point in orbit
             mass numeric, -- measured in terms of Earth Moon masses
             CHECK (designation > 0),
             CHECK (semi_major_axis > 0.0),
             CHECK (mass > 0.0)
);
