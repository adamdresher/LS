/* alter the planets table to add a 'semi_major_axis' column which stores the average distance from the planet to the planet's star
use numeric to represent distance in Astronomical Units (AU), also require a value */
ALTER TABLE planets
 ADD COLUMN semi_major_axis numeric NOT NULL;

