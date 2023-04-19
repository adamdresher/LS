/* query a list of names of everyone who has bid in the auction using a subquery with the `EXISTS` clause */
SELECT b.name
  FROM bidders AS b
 WHERE EXISTS (SELECT bids.bidder_id
                 FROM bids
                WHERE bids.bidder_id = b.id);

/* alternative, using a different return value for the subquery */
SELECT b.name
  FROM bidders AS b
 WHERE EXISTS (SELECT 1
                 FROM bids
                WHERE bids.bidder_id = b.id);

/* alternative, using a different return value for the subquery */
SELECT b.name
  FROM bidders AS b
 WHERE EXISTS (SELECT FROM bids
                     WHERE bids.bidder_id = b.id);

/* alternative, using a join and ordering alphabetically */
    SELECT b.name
      FROM bidders AS b
INNER JOIN bids
        ON b.id = bids.bidder_id
  GROUP BY b.name
  ORDER BY b.name;
