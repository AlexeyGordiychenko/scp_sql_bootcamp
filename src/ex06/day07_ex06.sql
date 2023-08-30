-- write a SQL statement that returns the amount of orders, average of price,
-- maximum and minimum prices for sold pizza by corresponding pizzeria
-- restaurant. The result should be sorted by pizzeria name. Round your average
-- price to 2 floating numbers.
SELECT pizzeria.name,
    COUNT(*) AS count_of_orders,
    ROUND(AVG(menu.price), 2) AS average_price,
    MAX(menu.price) AS max_price,
    MIN(menu.price) AS min_price
FROM person_order AS po
    JOIN menu ON po.menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY pizzeria.name;