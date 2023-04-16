/* alter the stars table so that the name column's data type accepts up to 50 characters */
 ALTER TABLE stars
ALTER COLUMN name TYPE varchar(50);
