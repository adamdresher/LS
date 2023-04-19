/* query the largest number of bids from an individual bidder
use a subquery to filter the table being queried */
SELECT max(bids_per_bidder.count)
  FROM (  SELECT count(b.id)
            FROM bids AS b
        GROUP BY b.bidder_id) AS bids_per_bidder;

/* alternative, without a subquery */
  SELECT count(b.id)
    FROM bids AS b
GROUP BY b.bidder_id
ORDER BY count(b.id) DESC
   LIMIT 1;

/* alternative, using a WITH clause */
  WITH bids_per_bidder AS (  SELECT COUNT(id)
                               FROM bids
                           GROUP BY bidder_id)
SELECT MAX(count)
  FROM bids_per_bidder;
