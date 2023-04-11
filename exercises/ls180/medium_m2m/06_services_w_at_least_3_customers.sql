/* returns a joined table that displays description and count
for services with at least 3 customers */

/* attempt 1
how to list the count and description at the same time?
count is an aggregate function and thus requires a GROUP BY clause
GROUP BY clauses require being sorted by any non-aggregate list items
aggregate functions are not allowed in WHERE clauses
*/
SELECT description, count(service_id) FROM customers_services cs
  LEFT JOIN services s
    ON s.id = cs.service_id
      GROUP BY description
;
