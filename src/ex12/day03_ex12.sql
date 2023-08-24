-- Please register new orders from all persons for “greek pizza” by 25th of
-- February 2022. Use “insert-select” pattern.
-- Don’t use:
-- direct numbers for identifiers of Primary Key, and menu
-- window functions like ROW_NUMBER()
-- atomic INSERT statements |
INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT generate_series(
        (
            SELECT MAX(id) + 1
            FROM person_order
        ),
        (
            SELECT MAX(id)
            FROM person_order
        ) + (
            SELECT COUNT(id)
            FROM person
        )
    ) AS id,
    generate_series(
        (
            SELECT MIN(id)
            FROM person
        ),
        (
            SELECT MAX(id)
            FROM person
        )
    ) AS person_id,
    (
        SELECT id
        FROM menu
        WHERE pizza_name = 'greek pizza'
    ) AS menu_id,
    '2022-02-25' AS order_date;