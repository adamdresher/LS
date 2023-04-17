/* returns a joined table with all customers without a service */
SELECT *
  FROM customers
 WHERE id NOT IN (SELECT customer_id
                    FROM customers_services
                  );

/* alternative, using a JOIN instead of sub-query */
         SELECT c.*
           FROM customers c
LEFT OUTER JOIN customers_services cs
             ON c.id = cs.customer_id
          WHERE cs.customer_id IS NULL;
 
/* returns a joined table with all customers without a service
and all services without a customer */
         SELECT c.*, s.*
           FROM customers c
LEFT OUTER JOIN customers_services cs
             ON c.id = cs.customer_id
      FULL JOIN services s
             ON cs.service_id = s.id
          WHERE cs.customer_id IS NULL
             OR cs.service_id IS NULL;
