-- rewrite a SQL statement from exercise 07 by using NATURAL JOIN construction.
-- The result must be the same like for exercise 07.
-- It's now allowed to use: other types of JOINs
SELECT order_date,
    concat(person_mod.name, ' (age:', person_mod.age, ')') AS person_information
FROM person_order
    NATURAL JOIN (
        SELECT id AS person_id,
            name,
            age
        FROM person
    ) AS person_mod
ORDER BY order_date,
    person_information;