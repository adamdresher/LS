/* query the total gross income expected based on the assumption that all customers bills are due for all services listed */
    SELECT sum(s.price) AS gross
      FROM customers_services AS cs
INNER JOIN services AS s
        ON s.id = cs.service_id;
