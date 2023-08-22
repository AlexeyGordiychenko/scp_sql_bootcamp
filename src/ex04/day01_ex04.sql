-- write a SQL statement which returns a difference (minus) of person_id column
-- values with saving duplicates between person_order table and person_visits
-- table for order_date and visit_date are for 7th of January of 2022
-- It's now allowed to use: any type of JOINs
SELECT person_id
FROM person_order
WHERE order_date = '2022-01-07'
EXCEPT ALL
SELECT person_id
FROM person_visits
WHERE visit_date = '2022-01-07';