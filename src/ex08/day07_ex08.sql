-- write a SQL statement that returns address, pizzeria name and amount of
-- persons’ orders. The result should be sorted by address and then by
-- restaurant name. Particular person visits pizzerias in his/her city only.
SELECT person.address,
    pizzeria.name,
    COUNT(*) AS count_of_orders
FROM person_order AS po
    JOIN person ON po.person_id = person.id
    JOIN menu ON po.menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY person.address,
    pizzeria.name
ORDER BY person.address,
    pizzeria.name;