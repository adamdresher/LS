/* query all devices with their associated part numbers */
    SELECT d.name, p.part_number
      FROM devices AS d
INNER JOIN parts AS p
        ON d.id = p.device_id;
