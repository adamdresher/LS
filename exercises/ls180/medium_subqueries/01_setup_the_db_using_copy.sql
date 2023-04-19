/* create an auction database */
/*
$ createdb auction
$ psql auction
*/

/* create 3 tables- bidders, items, bids */
CREATE TABLE bidders (
             id SERIAL PRIMARY KEY,
             name TEXT NOT NULL
);

CREATE TABLE items (
             id SERIAL PRIMARY KEY,
             name TEXT NOT NULL,
             initial_price NUMERIC(6, 2) NOT NULL,
             sales_price NUMERIC(6, 2),
             CHECK(initial_price BETWEEN 0.01 AND 1000.00),
             CHECK(sales_price BETWEEN 0.01 AND 1000.00)
);

CREATE TABLE bids (
             id SERIAL PRIMARY KEY,
             bidder_id INTEGER NOT NULL REFERENCES bidders(id) ON DELETE CASCADE,
             item_id INTEGER NOT NULL REFERENCES items(id) ON DELETE CASCADE,
             amount NUMERIC(6, 2) NOT NULL
);

CREATE INDEX ON bids(bidder_id, item_id);

/* copy data from *.csv to the relevant table using the \copy meta-command */
/*
\COPY bidders FROM bidders.csv WITH HEADER CSV
*/

