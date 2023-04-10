/* returns a joined table with all customers without a service */
SELECT * FROM customers
  WHERE id NOT IN (
    SELECT customer_id FROM customer_services
  );

/* alternative */
SELECT c.* FROM customers c
  LEFT JOIN customer_services cs
    ON c.id = cs.customer_id
    WHERE cs.customer_id IS NULL;
 
/* returns a joined table with all customers without a service
and all services without a customer */
SELECT c.*, s.* FROM customers c
  LEFT JOIN customer_services cs
    ON c.id = cs.customer_id
  FULL JOIN services s
    ON cs.service_id = s.id
    WHERE cs.customer_id IS NULL
    OR cs.service_id IS NULL;
