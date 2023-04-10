/* returns a table with all customers with a service */
SELECT DISTINCT c.* FROM customers c
  JOIN customer_services cs
  ON c.id = cs.customer_id;

/* alternative */
SELECT c.* FROM customers c
  JOIN customer_services cs
  on c.id = cs.customer_id
  GROUP BY c.id;
