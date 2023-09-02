-- use SQL construction from Exercise 05 and add a new calculated column (use
-- column's name ‘check_name’) with a check statement (a pseudo code for this
-- check is presented below) in the SELECT clause.
-- if (person_name == 'Denis') then return true
--      else return false
-- It's not allowed to use IN, any types of JOINs
SELECT name,
    CASE
        WHEN names.name = 'Denis' THEN TRUE
        ELSE FALSE
    END AS check_name
FROM (
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
            )
    ) AS names;