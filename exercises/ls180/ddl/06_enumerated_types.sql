/* alter the spectral_type type in the stars table so that it uses an enumerated spectral_type
instead of a check constraint to ensure its value is in ['O', 'B', 'A', 'F', 'G', 'K'] */
CREATE TYPE spectral AS ENUM('O', 'B', 'A', 'F', 'G', 'K', 'M');

 ALTER TABLE stars
        DROP CONSTRAINT stars_spectral_type_check,
ALTER COLUMN spectral_type TYPE spectral
       USING spectral_type::spectral;
