-- write a SQL statement which returns all possible combinations between person
-- and pizzeria tables and set ordering by person identifier and then by
-- pizzeria identifier columns.
SELECT *
FROM person,
    pizzeria
ORDER BY person.id,
    pizzeria.id;