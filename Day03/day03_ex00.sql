-- write a SQL statement which returns a list of pizza names, pizza prices,
-- pizzerias names and dates of visit for Kate and for prices in range from 800
-- to 1000 rubles. Sort by pizza, price and pizzeria names.
SELECT menu.pizza_name AS pizza_name,
    menu.price AS price,
    pizzeria.name AS pizzeria_name,
    pv.visit_date AS visit_date
FROM person_visits AS pv
    JOIN person ON pv.person_id = person.id
    JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
    JOIN menu ON pv.pizzeria_id = menu.pizzeria_id
WHERE person.name = 'Kate'
    AND menu.price BETWEEN 800 AND 1000
ORDER BY pizza_name,
    price,
    pizzeria_name;