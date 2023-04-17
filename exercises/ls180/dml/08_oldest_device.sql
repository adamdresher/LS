/* insert additional data into the devices table and parts table,
then query the name of the oldest device in the devices table */
INSERT INTO devices
       (name)
VALUES ('Magnetometer');

INSERT INTO parts
       (part_number, device_id)
VALUES (42, 3);

  SELECT name
    FROM devices
ORDER BY created_at ASC
   LIMIT 1;

/* alternative, handles an edge case where multiple rows contain same oldest timestamp */
SELECT name
  FROM devices
 WHERE created_at = (SELECT min(created_at) FROM devices);

/* alternative 2, handles an edge case where multiple rows contain same oldest timestamp */
  SELECT string_agg(name, ', ') AS "oldest device(s)"
    FROM devices
GROUP BY created_at
ORDER BY created_at ASC
   LIMIT 1;
