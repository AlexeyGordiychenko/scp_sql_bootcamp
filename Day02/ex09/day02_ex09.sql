--  find the names of all females who ordered both pepperoni and cheese pizzas
--  (at any time and in any pizzerias). Order the result by person name
WITH fo AS (
    SELECT DISTINCT person.name AS name,
        menu.pizza_name AS pizza
    FROM person_order AS po
        JOIN person ON po.person_id = person.id
        JOIN menu ON po.menu_id = menu.id
    WHERE person.gender = 'female'
        AND menu.pizza_name IN ('cheese pizza', 'pepperoni pizza')
)
SELECT name
FROM fo
WHERE pizza = 'cheese pizza'
INTERSECT
SELECT name
FROM fo
WHERE pizza = 'pepperoni pizza'
ORDER BY name;