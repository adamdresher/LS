/* delete any data related to 'Accelerometer', including any parts associated with it */
SELECT *
  FROM parts
 WHERE device_id = (SELECT id
                      FROM devices
                     WHERE name = 'accelerometer');

DELETE FROM parts
      WHERE device_id = (SELECT id
                           FROM devices
                          WHERE name = 'accelerometer');

DELETE FROM devices
      WHERE name = 'accelerometer';

/* alternative, using ON DELETE CASCADE */
ALTER TABLE parts
       DROP CONSTRAINT parts_device_id_fkey,
        ADD FOREIGN KEY (device_id) REFERENCES devices(id) ON DELETE CASCADE;

DELETE FROM devices
      WHERE name = 'accelerometer';
