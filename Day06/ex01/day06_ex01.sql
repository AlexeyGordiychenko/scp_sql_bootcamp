-- write a DML statement (INSERT INTO ... SELECT ...) that makes inserts new
-- records into person_discounts table based on the rules:
--  take aggregated state by person_id and pizzeria_id columns from person_order
--  calculate personal discount value by the next pseudo code:
--      if “amount of orders” = 1 then “discount” = 10.5 
--      else if “amount of orders” = 2 then “discount” = 22
--      else  “discount” = 30
--  to generate a primary key for the person_discounts table please use ...
--  ROW_NUMBER( ) OVER ( ) AS id ...
INSERT INTO person_discounts
SELECT ROW_NUMBER() OVER () AS id,
    person_id,
    menu.pizzeria_id,
    CASE
        WHEN COUNT(po.id) = 1 THEN 10.5
        WHEN COUNT(po.id) = 2 THEN 22
        ELSE 30
    END AS discount
FROM person_order AS po
    JOIN menu ON po.menu_id = menu.id
GROUP BY person_id,
    menu.pizzeria_id
ORDER BY person_id,
    pizzeria_id;