/* returns a table with all customers with a service */
SELECT DISTINCT c.*
           FROM customers c
     INNER JOIN customers_services cs
             ON c.id = cs.customer_id;

/* alternative, using GROUP BY instead of DISTINCT */
    SELECT c.*
      FROM customers c
INNER JOIN customers_services cs
        ON c.id = cs.customer_id
  GROUP BY c.id;
