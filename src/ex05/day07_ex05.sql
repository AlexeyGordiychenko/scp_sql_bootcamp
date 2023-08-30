-- write a simple SQL query that returns a list of unique person names who made
-- orders in any pizzerias. The result should be sorted by person name
-- It's not allowed to use: GROUP BY, any type (UNION,...) working with sets
SELECT DISTINCT person.name
FROM person_order AS po
    JOIN person ON po.person_id = person.id
ORDER BY person.name;