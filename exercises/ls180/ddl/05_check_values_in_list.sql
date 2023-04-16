/* alter the stars table to enforce a restriction on the spectral_type column */
ALTER TABLE stars
  ADD CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'K', 'M'));

/* alternative, using regex to match any character with `[]` */
 ALTER TABLE stars
   ADD CHECK (spectral_type ~ [OBAFGKM]);

/* alternative, using regex pattern matching with the metacharacter, |, to denote alternation */
 ALTER TABLE stars
   ADD CHECK (spectral_type SIMILAR TO 'O|B|A|F|G|K|M');

/* alternative, creating a new data type */
 CREATE TYPE spectral AS ENUM('O', 'B', 'A', 'F', 'G', 'K', 'M');

 ALTER TABLE stars
ALTER COLUMN spectral_type spectral;
