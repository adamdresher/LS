/* alter the mass column in the planets table so it's data type accepts fractional numbers to any level of precision
also ensure a value is required and it is not null */
 ALTER TABLE planets
ALTER COLUMN mass TYPE numeric,
ALTER COLUMN mass SET NOT NULL,
   ADD CHECK (mass > 0),
ALTER COLUMN designation SET NOT NULL;

