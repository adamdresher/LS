/* query all items that have a big placed on them by using the logical operator `IN` with a subquery */
SELECT i.name AS "Bid on Items"
  FROM items AS i
 WHERE i.id IN (SELECT item_id
                           FROM bids);

/* alternative, using a join */
SELECT i.name AS "Bid on Items"
           FROM items AS i
     INNER JOIN bids AS b
             ON i.id = b.item_id;
