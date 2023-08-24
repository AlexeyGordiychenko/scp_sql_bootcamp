-- register new visits into Domino's restaurant from Denis and Irina on 24th of
-- February 2022. Don’t use direct numbers for identifiers of Primary Key and
-- pizzeria
INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
SELECT (
        SELECT MAX(id)
        FROM person_visits
    ) + CASE
        WHEN person.name = 'Denis' THEN 1
        ELSE 2
    END AS id,
    person.id AS person_id,
    (
        SELECT id
        FROM pizzeria
        WHERE name = 'Dominos'
    ) AS pizzeria_id,
    '2022-02-24' AS visit_date
FROM person
WHERE name IN ('Denis', 'Irina');