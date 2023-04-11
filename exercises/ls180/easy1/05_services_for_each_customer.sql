/* return a joined table of customers and the list of the services they are using */
SELECT name, string_agg(description, ', ') AS services FROM customers c
LEFT JOIN customers_services cs
  ON c.id = cs.customer_id
FULL JOIN services s
  ON s.id = cs.service_id
  WHERE name IS NOT NULL
  GROUP BY name

/* alternative */
SELECT name, string_agg(description, ', ') AS services FROM customers_services cs
LEFT JOIN services s
  ON s.id = cs.service_id
JOIN customers c
  ON c.id = cs.customer_id
  WHERE name IS NOT NULL
  GROUP BY name;

/* return a joined table of customers and each service they are using (each service on a new row) */
SELECT customers.name,
       lag(customers.name)
         OVER (ORDER BY customers.name)
         AS previous,
       services.description
FROM customers
LEFT OUTER JOIN customers_services
             ON customer_id = customers.id
LEFT OUTER JOIN services
             ON services.id = service_id;
