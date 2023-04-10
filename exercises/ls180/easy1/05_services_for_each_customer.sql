/* return a joined table of customers and the list of the services they are using */
SELECT name, string_agg(description, ', ') AS services FROM customers c
LEFT JOIN customer_services cs
  ON c.id = cs.customer_id
FULL JOIN services s
  ON s.id = cs.service_id
  WHERE name IS NOT NULL
  GROUP BY name

/* alternative */
SELECT name, string_agg(description, ', ') AS services FROM customer_services cs
LEFT JOIN services s
  ON s.id = cs.service_id
JOIN customers c
  ON c.id = cs.customer_id
  WHERE name IS NOT NULL
  GROUP BY name;
