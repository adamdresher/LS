/* compare the two queries using EXPLAIN ANALYZE
and explain which is more efficient and why */
EXPLAIN (FORMAT JSON, ANALYZE, VERBOSE) SELECT MAX(bid_counts.count)
                                          FROM (  SELECT COUNT(bidder_id)
                                                    FROM bids
                                                GROUP BY bidder_id) AS bid_counts;

EXPLAIN (FORMAT JSON, ANALYZE, VERBOSE) SELECT COUNT(bidder_id) AS max_bid
                                          FROM bids
                                      GROUP BY bidder_id
                                      ORDER BY max_bid DESC
                                      LIMIT 1;
 
/* 
| query type | planning time | execution time | total costs |
| ---------- | ------------- | -------------- | ----------- |
| subquery   | 0.120         | 0.099          | 37.65       | 
| order by   | 0.173         | 0.471          | 35.65       |
| / limit    | "             | "              | "           |

The query using a subquery has planning time and execution time of 0.233 ms and 0.101 ms, respectively.
The query using a order by and limit has a planning time and execution time of 0.207 ms and 0.221 ms, respectively.

The total costs required for the subquery query is 35.65.
The total costs required for the order by and limit query is 37.16.

By every metric in this benchmark, the subquery has performed faster than the order by and limit.  Upon comparison of
each query's nodes, it seems the query using a subquery performs 2 operations while the query using a order by and limit
performs 4 operations.  The two additional nodes are for sorting and limiting operations.  It would seem 
that these nodes are the result of the ORDER BY and LIMIT clauses and make up for ~2x in execution time.
*/

EXPLAIN ANALYZE SELECT name, (SELECT COUNT(item_id)
                                FROM bids
                               WHERE item_id = items.id)
                  FROM items;

EXPLAIN ANALYZE SELECT i.name, COUNT(b.id)
                  FROM items AS i
       LEFT OUTER JOIN bids AS b
                    ON i.id = b.item_id
              GROUP BY i.id
              ORDER BY i.id;

/* 
| query type | planning time | execution time | total costs |
| ---------- | ------------- | -------------- | ----------- |
| subquery   | 0.146         | 0.105          | 25455.20    | 
| join       | 0.157         | 0.134          | 120.47      |

Incredibly, the total costs expected for the subquery ~200x greater than using a join.  However the actual planning time and 
execution time are roughly equivalent.  The subquery contains 3 nodes, sequential scan, aggregate function, and another 
sequential scan.  The join contains 6 nodes, sort, hash aggregate, hash join, sequential scan, hash, and another sequential scan.

It seems the subquery requires looping through the child sequential scan and aggregate function 6 times each, which is likely
influencing the total costs estimated for the query.  The join query doesn't require additional loops.
*/
