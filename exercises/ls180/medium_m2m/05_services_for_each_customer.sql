/* return a joined table of customers and the list of the services they are using */
         SELECT name, string_agg(description, ', ') AS services
           FROM customers AS c
LEFT OUTER JOIN customers_services AS cs
             ON c.id = cs.customer_id
      FULL JOIN services AS s
             ON s.id = cs.service_id
          WHERE name IS NOT NULL
       GROUP BY name;

/* alternative */
         SELECT name, string_agg(description, ', ') AS services
           FROM customers_services AS cs
LEFT OUTER JOIN services AS s
             ON s.id = cs.service_id
     INNER JOIN customers AS c
             ON c.id = cs.customer_id
          WHERE name IS NOT NULL
       GROUP BY name;

/* return a joined table of customers and each service they are using (each service on a new row) */
         SELECT CASE lag(customers.name) OVER (ORDER BY customers.name)
                WHEN customers.name THEN ''
                ELSE customers.name
                END,
                services.description
           FROM customers
LEFT OUTER JOIN customers_services
             ON customer_id = customers.id
LEFT OUTER JOIN services
             ON services.id = service_id;

/* alternative, using the customers_services table as main because it makes sense to start with the join table */
         SELECT CASE lag(c.name) OVER (ORDER BY c.name)
                WHEN c.name THEN ''
                ELSE c.name
                END,
                s.description
           FROM customers_services AS cs
     INNER JOIN customers AS c
             ON cs.customer_id = c.id
LEFT OUTER JOIN services AS s
             ON s.id = cs.service_id;

