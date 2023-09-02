--  write a SQL statement to see 3 favorite restaurants by visits and by orders
--  in one list (add an action_type column with values ‘order’ or ‘visit’, it
--  depends on data from the corresponding table). The result should be sorted
--  by action_type column in ascending mode and by count column in descending
--  mode.
(
    SELECT p.name AS name,
        COUNT(*) AS COUNT,
        'order' AS action_type
    FROM person_order AS po
        JOIN menu ON po.menu_id = menu.id
        JOIN pizzeria AS p ON menu.pizzeria_id = p.id
    GROUP BY p.name,
        action_type
    ORDER BY COUNT DESC
    LIMIT 3
)
UNION ALL
(
    SELECT p.name AS name,
        COUNT(*) AS COUNT,
        'visit' AS action_type
    FROM person_visits AS pv
        JOIN pizzeria AS p ON pv.pizzeria_id = p.id
    GROUP BY p.name,
        action_type
    ORDER BY COUNT DESC
    LIMIT 3
)
ORDER BY action_type;