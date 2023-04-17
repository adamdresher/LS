/* adjust the following query such that it displays results in order of quantity of parts, highest to lowest */
/*
         SELECT d.name, count(p.id) AS "quantity of parts"
           FROM devices AS d
LEFT OUTER JOIN parts AS p
             ON d.id = p.device_id
       GROUP BY d.name;
*/

         SELECT d.name, count(p.id) AS "quantity of parts"
           FROM devices AS d
LEFT OUTER JOIN parts AS p
             ON d.id = p.device_id
       GROUP BY d.name
       ORDER BY "quantity of parts" DESC;
