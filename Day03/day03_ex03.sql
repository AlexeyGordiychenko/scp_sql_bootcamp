--  find pizzerias that have been visited more often by women or by men. For any
--  SQL operators with sets save duplicates (UNION ALL, EXCEPT ALL, INTERSECT
--  ALL constructions). Please sort a result by the pizzeria name.
WITH male AS (
    SELECT pizzeria_id
    FROM person_visits AS pv
        JOIN person ON pv.person_id = person.id
    WHERE person.gender = 'male'
),
female AS (
    SELECT pizzeria_id
    FROM person_visits AS pv
        JOIN person ON pv.person_id = person.id
    WHERE person.gender = 'female'
)
SELECT pizzeria.name AS pizzeria_name
FROM (
        (
            SELECT pizzeria_id
            FROM female
            EXCEPT ALL
            SELECT pizzeria_id
            FROM male
        )
        UNION ALL
        (
            SELECT pizzeria_id
            FROM male
            EXCEPT ALL
            SELECT pizzeria_id
            FROM female
        )
    ) AS mf
    JOIN pizzeria ON mf.pizzeria_id = pizzeria.id
ORDER BY pizzeria_name;