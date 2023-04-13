/* add a constraint that ensures ages are a positive number,
then confirm the constraint works */
ALTER TABLE birds
ADD CHECK (age > 0);

INSERT INTO birds
       (name, age, species)
VALUES ('Polly', 0, 'Parrot');
