/* make two queries:
first, the total gross income from all currently subscribed services costing $100 or more
second, the total gross income if all current users subscribed to all services costing $100 or more */
    SELECT sum(s.price)
      FROM customers_services AS cs
INNER JOIN services AS s
        ON s.id = cs.service_id
     WHERE s.price >= 100;

    SELECT sum(s.price)
      FROM services AS s
CROSS JOIN customers
     WHERE s.price >= 100;

/* alternative, using a sub-query as a part of a select list element */
SELECT sum(s.price) * (SELECT count(id) FROM customers) AS sum
  FROM services AS s
 WHERE s.price >= 100;
