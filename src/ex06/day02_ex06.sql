-- find all pizza names (and corresponding pizzeria names using menu table) that
-- Denis or Anna ordered. Sort a result by both columns
SELECT menu.pizza_name AS pizza_name,
    pizzeria.name AS pizzeria_name
FROM person_order AS po
    JOIN person ON po.person_id = person.id
    JOIN menu ON po.menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE person.name IN ('Denis', 'Anna')
ORDER BY pizza_name,
    pizzeria_name;