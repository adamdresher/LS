/* query all the parts that have a part_number beginning with 3 */
SELECT *
  FROM parts
 WHERE part_number::text LIKE '3%';

/* alternative, using position function */
SELECT *
  FROM parts
 WHERE postion('3' IN part_number::text) = 1;

/* alternative, using strpos function */
SELECT *
  FROM parts
 WHERE strpos(part_number::text, '3') = 1
