-- find all menu identifiers which are not ordered by anyone. The result should
-- be sorted by identifiers.
-- It's now allowed to use: any type of JOINs
SELECT id AS menu_id
FROM menu
EXCEPT
SELECT menu_id
FROM person_order
ORDER BY menu_id;