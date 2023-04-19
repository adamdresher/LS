/* use EXPLAIN on the following query
then add ANALYZE clause
explain the output and what is happening in both cases */
EXPLAIN SELECT b.name
  FROM bidders AS b
 WHERE EXISTS (SELECT bids.bidder_id
                 FROM bids
                WHERE bids.bidder_id = b.id);
/*
                                QUERY PLAN
--------------------------------------------------------------------------
 Hash Join  (cost=33.38..66.47 rows=635 width=32)
   Hash Cond: (b.id = bids.bidder_id)
   ->  Seq Scan on bidders b  (cost=0.00..22.70 rows=1270 width=36)
   ->  Hash  (cost=30.88..30.88 rows=200 width=4)
         ->  HashAggregate  (cost=28.88..30.88 rows=200 width=4)
               Group Key: bids.bidder_id
               ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4)
*/

(7 rows)
EXPLAIN ANALYZE SELECT b.name
  FROM bidders AS b
 WHERE EXISTS (SELECT bids.bidder_id
                 FROM bids
                WHERE bids.bidder_id = b.id);
/* 
                                                     QUERY PLAN
---------------------------------------------------------------------------------------------------------------------
 Hash Join  (cost=33.38..66.47 rows=635 width=32) (actual time=0.222..0.229 rows=6 loops=1)
   Hash Cond: (b.id = bids.bidder_id)
   ->  Seq Scan on bidders b  (cost=0.00..22.70 rows=1270 width=36) (actual time=0.043..0.045 rows=7 loops=1)
   ->  Hash  (cost=30.88..30.88 rows=200 width=4) (actual time=0.085..0.086 rows=6 loops=1)
         Buckets: 1024  Batches: 1  Memory Usage: 9kB
         ->  HashAggregate  (cost=28.88..30.88 rows=200 width=4) (actual time=0.052..0.055 rows=6 loops=1)
               Group Key: bids.bidder_id
               Batches: 1  Memory Usage: 40kB
               ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.025..0.032 rows=26 loops=1)
 Planning Time: 3.171 ms
 Execution Time: 0.583 ms
(11 rows)
*/
/*
To analyze the query using a SELECT statement, the EXPLAIN statement can be used to generate an execution plan.
This execution plan displays operations for how tables are scanned and, if there are multiple tables, joined.  
Each operation is displayed beginning with a node name representing the operation (ie, `Hash Join`).  The estimation 
costs are then displayed (ie, `(cost=33.38..66.47 rows=635 width=32)`).

These costs estimate how expensive the nodes are.  There are four values provided in the execution costs (stated in 
order found): 'cost' is comprised of two values (starting cost and total cost), 'rows' is the total rows returned by the 
operation, and 'width' is the average size of an individual row in bytes.  The starting cost and total cost are measured 
in arbitrary 'cost units'.
The important value to focus on is typically the total cost of the top-most node.  This value is an estimation of all 
scanning and joining.  Nodes that are indented below the top-most node are children nodes.  These children are nested
operations and required for the parent node.

The same query analysis can be performed by appending the ANALYZE clause to EXPLAIN.  This results in the following 
statement to actually be executed and will include, along with the planning estimates, actual run time statistics (in
milliseconds).  As with the planning estimates, the execution costs are displayed with four values: 'actual time' is 
comprised of two values (starting costs and total costs), 'rows' is the actual total rows returned, and 'loops'.  
The 'loops' indicates the number of times the process is looped.  Just like with planning estimates, the total costs 
of the top-most line is typically the value most relevant.  A bonus is that the 'Planning Time' and 'Execution Time'
are provided in milliseconds.

It's worth noting that executing EXPLAIN ANALYZE will result in the statement being executed, not simply estimated.  
This can result in side-effects when used for statements such as INSERT, UPDATE, and DELETE.  To alleviate this 
potentially undesired effect, the ROLLBACK statement can be followed and will rollback the previously executed
statement.
*/
