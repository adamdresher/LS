/* query the id for a specific item given the item's name, initial_price, and sales_price
do not use the AND clause */
SELECT id
  FROM items
 WHERE ROW(name, initial_price, sales_price) = ROW('Painting', 100.00, 250.00)

/* alternative, using AND */
SELECT id
  FROM items
 WHERE name = 'Painting'
   AND initial_price = 100.00
   AND sales_price = 250.00;

/* alternative, less specific */
SELECT id
  FROM items
 WHERE EXISTS (SELECT FROM bids WHERE name = 'Painting');

