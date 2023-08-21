-- make a select statement that returns person names and pizzeria names based on
-- the person_visits table with date of visit in a period from 07th of January
-- to 09th of January 2022 (including all days) (based on internal query in FROM
-- clause). Add a ordering clause by person name in ascending mode and by
-- pizzeria name in descending mode
-- It's not allowed to use any types of JOINs
SELECT (
        SELECT name
        FROM person
        WHERE id = pv.person_id
    ) AS person_name,
    (
        SELECT name
        FROM pizzeria
        WHERE id = pv.pizzeria_id
    ) AS pizzeria_name
FROM (
        SELECT person_id,
            pizzeria_id
        FROM person_visits
        WHERE visit_date BETWEEN '2022-01-07' AND '2022-01-09'
    ) AS pv
ORDER BY person_name,
    pizzeria_name DESC;