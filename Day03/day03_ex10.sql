-- register new orders from Denis and Irina on 24th of February 2022 for the new
-- menu with “sicilian pizza”. Don’t use direct numbers for identifiers of
-- Primary Key and pizzeria
INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT (
        SELECT MAX(id)
        FROM person_order
    ) + CASE
        WHEN person.name = 'Denis' THEN 1
        ELSE 2
    END AS id,
    person.id AS person_id,
    (
        SELECT id
        FROM menu
        WHERE pizza_name = 'sicilian pizza'
    ) AS menu_id,
    '2022-02-24' AS order_date
FROM person
WHERE name IN ('Denis', 'Irina');