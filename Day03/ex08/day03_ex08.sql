-- register a new pizza with name “sicilian pizza” (whose id should be
-- calculated by formula “maximum id value + 1”) with a price of 900 rubles in
-- “Domino's” restaurant (please use an internal query to get identifier of
-- pizzeria). Don’t use direct numbers for identifiers of Primary Key and
-- pizzeria
INSERT INTO menu (id, pizzeria_id, pizza_name, price)
SELECT (
        SELECT MAX(id) + 1
        FROM menu
    ),
    (
        SELECT id
        FROM pizzeria
        WHERE name = 'Dominos'
    ),
    'sicilian pizza',
    900;