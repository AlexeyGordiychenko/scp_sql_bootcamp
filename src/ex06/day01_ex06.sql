-- modify a SQL statement from exercise 03 to return person names instead of
-- person identifiers and change ordering by action_date in ascending mode and
-- then by person_name in descending mode
SELECT order_date AS action_date,
    (
        SELECT name
        FROM person
        WHERE person.id = person_order.person_id
    ) AS person_name
FROM person_order
INTERSECT
SELECT visit_date,
    (
        SELECT name
        FROM person
        WHERE person.id = person_visits.person_id
    ) AS person_name
FROM person_visits
ORDER BY action_date,
    person_name DESC;