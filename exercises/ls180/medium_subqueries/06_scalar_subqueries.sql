/* query the each item available and the number of bids for each item */
  SELECT i.name, (SELECT COUNT(b.id)
                    FROM bids AS b
                   WHERE i.id = b.item_id)
    FROM items AS i;

/* alternative, using a join */
         SELECT i.name, COUNT(b.id)
           FROM items AS i
LEFT OUTER JOIN bids AS b
             ON i.id = b.item_id
       GROUP BY i.id
       ORDER BY i.id;
