-- write a SQL statement to see restaurants are grouping by visits and by orders
-- and joined with each other by using restaurant name. You can use internal
-- SQLs from Exercise 02 (restaurants by visits and by orders) without
-- limitations of amount of rows.
-- Additionally, please add the next rules.
--   calculate a sum of orders and visits for corresponding pizzeria (be aware,
--   not all pizzeria keys are presented in both tables).
--   sort results by total_count column in descending mode and by name in
--   ascending mode. Take a look at the data sample below.
SELECT pizzeria.name AS name,
    SUM(COUNT) AS total_count
FROM (
        (
            SELECT menu.pizzeria_id,
                COUNT(*) AS COUNT
            FROM person_order AS po
                JOIN menu ON po.menu_id = menu.id
            GROUP BY menu.pizzeria_id
        )
        UNION ALL
        (
            SELECT pv.pizzeria_id,
                COUNT(*)
            FROM person_visits AS pv
            GROUP BY pv.pizzeria_id
        )
    ) AS vo
    JOIN pizzeria ON vo.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY total_count DESC,
    name;