/* add a star_id to the planets table
must reference a value in the stars table
*/
ALTER TABLE planets
 ADD COLUMN star_id int NOT NULL REFERENCES stars(id);

