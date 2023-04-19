/* query all items that do not have bids on them using the `NOT IN` operator with a subquery */
SELECT i.name AS "Not Bid On"
  FROM items AS i
 WHERE i.id NOT IN (SELECT b.item_id
                      FROM bids AS b);

/* alternative, using NOT EXISTS */
SELECT i.name AS "Not Bid On"
  FROM items AS i
 WHERE NOT EXISTS (SELECT b.item_id
                     FROM bids AS b
                    WHERE b.item_id = i.id);

/* alternative, using a join */
 SELECT DISTINCT i.name AS "Not Bid On"
            FROM items AS i
RIGHT OUTER JOIN bids AS b
              ON i.id != b.item_id
           WHERE i.sales_price IS NULL;

