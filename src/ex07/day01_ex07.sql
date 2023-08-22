-- write a SQL statement which returns the date of order from the person_order
-- table and corresponding person name (name and age are formatted as in the
-- data sample below) which made an order from the person table. Add a sort by
-- both columns in ascending mode.
SELECT person_order.order_date AS order_date,
    concat(person.name, ' (age:', person.age, ')') AS person_information
FROM person_order
    JOIN person ON person_order.person_id = person.id
ORDER BY order_date,
    person_information;