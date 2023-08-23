--  find the names of all males from Moscow or Samara cities who orders either
--  pepperoni or mushroom pizzas (or both). Order the result by person name in
--  descending mode
SELECT person.name
FROM person_order AS po
    JOIN person ON po.person_id = person.id
    JOIN menu ON po.menu_id = menu.id
WHERE person.gender = 'male'
    AND person.address IN ('Moscow', 'Samara')
    AND menu.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY person.name DESC;