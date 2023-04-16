/* alter the distance column in the stars table so that any degree of percision is allowed (specifically fractional) */
 ALTER TABLE stars
ALTER COLUMN distance TYPE numeric;
