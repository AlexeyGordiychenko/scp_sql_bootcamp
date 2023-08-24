-- write a SQL statement which returns a list of pizzerias which Andrey visited
-- but did not make any orders. Order by the pizzeria name
SELECT pizzeria.name as pizzeria_name
FROM person_visits AS pv
    JOIN person ON pv.person_id = person.id
    JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
    LEFT JOIN person_order AS po
    JOIN menu ON po.menu_id = menu.id ON pv.person_id = po.person_id
    AND pv.pizzeria_id = menu.pizzeria_id
WHERE person.name = 'Andrey'
    AND menu.pizzeria_id IS NULL
ORDER BY pizzeria_name;