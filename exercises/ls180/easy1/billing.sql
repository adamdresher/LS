/* database: billing
   table: customers
          id serial primary key
          name varchar(100) UNIQUE NOT NULL
          payment_token char(8) UNIQUE NOT NULL only uppercase alphabetical letters
   table: services
          id serial primary key
          descrption varchar(256)
          price numeric(10,2)
*/

/* using 'idempotent_script.sh' to create the database
CREATE DATABASE billing;
*/

CREATE TABLE customers (
  id serial PRIMARY KEY,
  name text UNIQUE NOT NULL,
  payment_token char(8) UNIQUE NOT NULL CHECK (payment_token ~ '^[A-Z]{8}$')
);

CREATE TABLE services (
  id serial PRIMARY KEY,
  description text NOT NULL,
  /* description varchar NOT NULL, */
  price numeric(10,2) CONSTRAINT positive_price CHECK (price >= 0) NOT NULL
);

INSERT INTO customers
       (name, payment_token)
VALUES ('Pat Johnson', 'XHGOAHEQ'),
       ('Nancy Monreal', 'JKWQPJKL'),
       ('Lynn Blake', 'KLZXWEEE'),
       ('Chen Ke-Hua', 'KWETYCVX'),
       ('Scott Lakso', 'UUEAPQPS'),
       ('Jim Pornot', 'XKJEYAZA');

INSERT INTO services
       (description, price)
VALUES ('Unix Hosting', 5.95),
       ('DNS', 4.95),
       ('Whois Registration', 1.95),
       ('High Bandwidth', 15),
       ('Business Support', 250),
       ('Dedicated Hosting', 50),
       ('Bulk Email', 250),
       ('One-to-one Training', 999);

CREATE TABLE customer_services
(
  id serial PRIMARY KEY,
  customer_id integer NOT NULL
    REFERENCES customers(id)
    ON DELETE CASCADE,
  service_id integer NOT NULL
    REFERENCES services(id),
  UNIQUE (customer_id, service_id)
);

INSERT INTO customer_services
       (customer_id, service_id)
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (3, 1),
       (3, 2),
       (3, 3),
       (3, 4),
       (3, 5),
       (4, 1),
       (4, 4),
       (5, 1),
       (5, 2),
       (5, 6),
       (6, 1),
       (6, 2),
       (6, 7);
