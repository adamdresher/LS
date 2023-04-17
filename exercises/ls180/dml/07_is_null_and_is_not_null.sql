/* query all the parts that are used in a device, displaying part_number and device_id */
    SELECT part_number, device_id
      FROM parts
INNER JOIN devices
        ON devices.id = parts.device_id;

/* alternative */
    SELECT part_number, device_id
      FROM parts
     WHERE device_id IS NOT NULL;

/* query all the parts that are not used in a device, displaying part_number and device_id */
    SELECT part_number, device_id
      FROM parts
     WHERE device_id IS NULL;
