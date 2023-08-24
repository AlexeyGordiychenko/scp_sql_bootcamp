-- find a union of pizzerias that have orders either from women or from men.
-- Other words, you should find a set of pizzerias names have been ordered by
-- females only and make "UNION" operation with set of pizzerias names have been
-- ordered by males only. Please be aware with word “only” for both genders. For
-- any SQL operators with sets don’t save duplicates (UNION, EXCEPT, INTERSECT).
-- Sort a result by the pizzeria name
WITH male AS (
    SELECT DISTINCT menu.pizzeria_id
    FROM person_order AS po
        JOIN person ON po.person_id = person.id
        JOIN menu ON po.menu_id = menu.id
    WHERE person.gender = 'male'
),
female AS (
    SELECT DISTINCT menu.pizzeria_id
    FROM person_order AS po
        JOIN person ON po.person_id = person.id
        JOIN menu ON po.menu_id = menu.id
    WHERE person.gender = 'female'
)
SELECT pizzeria.name AS pizzeria_name
FROM (
        (
            SELECT pizzeria_id
            FROM female
            EXCEPT
            SELECT pizzeria_id
            FROM male
        )
        UNION
        (
            SELECT pizzeria_id
            FROM male
            EXCEPT
            SELECT pizzeria_id
            FROM female
        )
    ) AS mf
    JOIN pizzeria ON mf.pizzeria_id = pizzeria.id
ORDER BY pizzeria_name;