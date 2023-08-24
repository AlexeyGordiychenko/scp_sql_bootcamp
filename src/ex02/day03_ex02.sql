-- use SQL statement from Exercise #01 and show pizza names from pizzeria which
-- are not ordered by anyone, including corresponding prices also. The result
-- should be sorted by pizza name and price.
SELECT menu.pizza_name,
    menu.price,
    pizzeria.name
FROM(
        SELECT id AS id
        FROM menu
        EXCEPT
        SELECT menu_id
        FROM person_order
    ) AS t
    NATURAL JOIN menu
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY pizza_name,
    price;