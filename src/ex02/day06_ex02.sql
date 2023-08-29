-- write a SQL statement that returns orders with actual price and price with
-- applied discount for each person in the corresponding pizzeria restaurant and
-- sort by person name, and pizza name.
SELECT person.name AS name,
    menu.pizza_name AS pizza_name,
    menu.price,
    ROUND(menu.price * (100 - pd.discount) / 100, 0) AS discount_price,
    pizzeria.name AS pizzeria_name
FROM person_order AS po
    JOIN person ON po.person_id = person.id
    JOIN menu ON po.menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    JOIN person_discounts AS pd ON po.person_id = pd.person_id
    AND pizzeria.id = pd.pizzeria_id
ORDER BY name,
    pizza_name;