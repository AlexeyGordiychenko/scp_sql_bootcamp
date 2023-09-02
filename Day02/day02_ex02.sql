-- write a SQL statement that returns a whole list of person names visited (or
-- not visited) pizzerias during the period from 1st to 3rd of January 2022 from
-- one side and the whole list of pizzeria names which have been visited (or not
-- visited) from the other side. Add ‘-’ as a substitution value for NULL values
-- in person_name and pizzeria_name columns. Please also add ordering for all 3
-- columns.
-- It's now allowed to use: NOT IN, IN, NOT EXISTS, EXISTS, UNION, EXCEPT, INTERSECT
SELECT COALESCE(person.name, '-') AS person_name,
    visits.visit_date,
    COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM (
        SELECT person_id,
            pizzeria_id,
            visit_date
        FROM person_visits
        WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03'
    ) AS visits
    FULL JOIN person ON visits.person_id = person.id
    FULL JOIN pizzeria ON visits.pizzeria_id = pizzeria.id
ORDER BY person_name,
    visits.visit_date,
    pizzeria_name