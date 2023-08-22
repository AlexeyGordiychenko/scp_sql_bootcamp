--  write a SQL statement which returns menu’s identifier and pizza names from
--  menu table and person’s identifier and person name from person table in one
--  global list ordered by object_id and then by object_name columns
SELECT id AS object_id,
    pizza_name AS object_name
FROM menu
UNION
SELECT id,
    name
FROM person
ORDER BY object_id,
    object_name;