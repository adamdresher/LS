/* update all rows's species value from 'Crow' to 'Raven' */
UPDATE birds
SET species='Raven'
WHERE species='Crow';

/* update the row where the column 'name' so that the species is set to 'Hawk' */
UPDATE birds
SET species='Hawk'
WHERE name='Jamie' AND species='Owl';
