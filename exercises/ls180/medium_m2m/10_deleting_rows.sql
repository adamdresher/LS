/* delete the 'Bulk Email' service an the customer 'Chen Ke-Hua' */
DELETE FROM customers
      WHERE name = 'Chen Ke-Hua';

DELETE FROM services
      WHERE description = 'Bulk Email';
