-- write a SQL statement which returns all possible combinations between person
-- and pizzeria tables and set ordering by person identifier and then by
-- pizzeria identifier columns.
SELECT person.id AS person_id,
    person.name AS person_name,
    age,
    gender,
    address,
    pizzeria.id AS pizzeria_id,
    pizzeria.name AS pizzeria_name,
    rating
FROM person,
    pizzeria
ORDER BY person.id,
    pizzeria.id;