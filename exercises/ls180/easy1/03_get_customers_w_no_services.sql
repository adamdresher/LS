/* returns a joined table with all customers without a service */
SELECT * FROM customers
  WHERE id NOT IN (
    SELECT customers_id FROM customer_services
  );

/* alternative */
SELECT c.* FROM customers c
  LEFT JOIN customers_services cs
    ON c.id = cs.customers_id
    WHERE cs.customers_id IS NULL;
 
/* returns a joined table with all customers without a service
and all services without a customer */
SELECT c.*, s.* FROM customers c
  LEFT JOIN customers_services cs
    ON c.id = cs.customers_id
  FULL JOIN services s
    ON cs.service_id = s.id
    WHERE cs.customers_id IS NULL
    OR cs.service_id IS NULL;
