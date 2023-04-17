/* query a result table containing each device name and the quantity of parts per device */
         SELECT d.name, count(p.id) AS "quantity of parts"
           FROM devices AS d
LEFT OUTER JOIN parts AS p
             ON d.id = p.device_id
       GROUP BY d.name;
