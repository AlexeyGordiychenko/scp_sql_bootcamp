-- create a Materialized View mv_dmitriy_visits_and_eats (with data included)
-- based on SQL statement that finds the name of pizzeria Dmitriy visited on
-- January 8, 2022 and could eat pizzas for less than 800 rubles (this SQL you
-- can find out at Day #02 Exercise #07).
CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pizzeria.name AS pizzeria_name
FROM person_visits AS pv
    JOIN person ON pv.person_id = person.id
    JOIN menu ON pv.pizzeria_id = menu.pizzeria_id
    JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
WHERE pv.visit_date = '2022-01-08'
    AND person.name = 'Dmitriy'
    AND menu.price < 800;