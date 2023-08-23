-- write a SQL statement which returns a list of pizzerias names with
-- corresponding rating value which have not been visited by persons.
-- It's now allowed to use: NOT IN, IN, NOT EXISTS, EXISTS, UNION, EXCEPT, INTERSECT
SELECT pizzeria.name,
    pizzeria.rating
FROM pizzeria
    LEFT JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
WHERE person_visits.pizzeria_id IS NULL;