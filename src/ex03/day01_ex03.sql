-- write a SQL statement which returns common rows for attributes order_date,
-- person_id from person_order table from one side and visit_date, person_id
-- from person_visits table from the other side. In other words, let’s find
-- identifiers of persons, who visited and ordered some pizza on the same day.
-- Add ordering by action_date in ascending mode and then by person_id in
-- descending mode.
-- It's now allowed to use: any type of JOINs
SELECT order_date AS action_date,
    person_id AS person_id
FROM person_order
INTERSECT
SELECT visit_date,
    person_id
FROM person_visits
ORDER BY action_date,
    person_id DESC;