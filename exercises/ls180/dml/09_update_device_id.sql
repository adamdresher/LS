/* update the last two parts that belong to a 'Gyroscope' in the parts table such that they belong to an 'Accelerometer' */
UPDATE parts
   SET device_id = 1
 WHERE id IN (SELECT id
                FROM parts
            GROUP BY device_id, id
              HAVING device_id = 2
            ORDER BY id DESC
               LIMIT 2);

/* alternative, using WHERE to filter the device_id */
UPDATE parts
   SET device_id = 1
 WHERE id = (SELECT id
               FROM parts
              WHERE device_id = 2
           ORDER BY id DESC
              LIMIT 2);

