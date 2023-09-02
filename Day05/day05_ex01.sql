-- write a SQL statement that returns pizzas’ and corresponding pizzeria names.
-- Provide proof that your indexes are working for your SQL. The sample of proof
-- is the output of the EXPLAIN ANALYZE command:
-- ...
-- ->  Index Scan using idx_menu_pizzeria_id on menu m  (...)
-- ...
SET enable_seqscan = off;
EXPLAIN ANALYZE
SELECT menu.pizza_name AS pizza_name,
    pizzeria.name AS pizzeria_name
FROM menu
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id;