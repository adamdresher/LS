/* insert data */
INSERT INTO birds
       (name, age, species)
VALUES ('Charlie', 3, 'Finch'),
       ('Allie', 5, 'Owl'),
       ('Jennifer', 3, 'Magpie'),
       ('Jamie', 4, 'Owl'),
       ('Roy', 8, 'Crow');

/* alternative */
INSERT INTO birds
VALUES (DEFAULT, 'Charlie', 3, 'Finch'),
       (DEFAULT, 'Allie', 5, 'Owl'),
       (DEFAULT, 'Jennifer', 3, 'Magpie'),
       (DEFAULT, 'Jamie', 4, 'Owl'),
       (DEFAULT, 'Roy', 8, 'Crow');
