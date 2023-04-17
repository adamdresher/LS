/* query the description and count for services with at least 3 customers */
    SELECT description, count(cs.id)
      FROM customers_services AS cs
INNER JOIN services AS s 
        ON s.id = cs.service_id
  GROUP BY description
    HAVING count(cs.id) >= 3;
