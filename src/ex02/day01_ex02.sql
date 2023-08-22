-- write a SQL statement which returns unique pizza names from the menu table
-- and orders by pizza_name column in descending mode.
-- It's now allowed to use: DISTINCT, GROUP BY, HAVING, any type of JOINs
SELECT pizza_name
FROM menu
INTERSECT
SELECT pizza_name
FROM menu
ORDER BY pizza_name DESC;