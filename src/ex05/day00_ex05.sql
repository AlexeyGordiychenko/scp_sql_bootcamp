-- make a select statement which returns person's names (based on internal query
-- in SELECT clause) who made orders for the menu with identifiers 13 , 14 and
-- 18 and date of orders should be equal 7th of January 2022.
-- It's not allowed to use IN, any types of JOINs
SELECT (
        SELECT name
        FROM person
        WHERE person.id = person_order.person_id
    ) AS name
FROM person_order
WHERE order_date = '2022-01-07'
    AND (
        menu_id = 13
        OR menu_id = 14
        OR menu_id = 18
    );