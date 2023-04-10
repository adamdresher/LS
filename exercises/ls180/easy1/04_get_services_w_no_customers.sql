/* returns a joined table with all services without a customer */
SELECT description FROM customer_services
  RIGHT JOIN services s
    ON s.id = service_id
    WHERE customer_id IS NULL;
