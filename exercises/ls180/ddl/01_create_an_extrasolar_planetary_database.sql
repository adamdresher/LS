/* create 'extrasolar' database */
CREATE DATABASE extrasolar;

/* alternative, using PostgreSQL programs
$ createdb extrasolar
*/

/* create two tables, stars and planets */
CREATE TABLE stars (
             id            serial      PRIMARY KEY,
             name          varchar(25) UNIQUE NOT NULL,
             distance      int         NOT NULL,
             spectral_type char(1),
             companions    int         NOT NULL,

             CHECK (distance > 0),
             CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'G', 'K', 'M')),
             CHECK (companions >= 0)
);

CREATE TABLE planets (
             id          serial  PRIMARY KEY,
             designation char(1) UNIQUE,
             mass        int,

             CHECK (designation BETWEEN  'a' AND 'z')
);

/* alternative, using regex to match any character with []
CHECK (spectral_type ~ [OBAFGKM]) */

/* alternative 2, using regex pattern matching with the metacharacter, |, to denote alternation
CHECK (spectral_type SIMILAR TO 'O|B|A|F|G|K|M') */

/* alternative 3, creating a new data type
CREATE TYPE spectral AS ENUM('O', 'B', 'A', 'F', 'G', 'K', 'M');

...

spectral_type spectral,

...
*/
