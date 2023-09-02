-- add a possibility to see additional rows with the most expensive cost to the
-- SQL from the previous exercise. Sort data by total_cost and then by tour.
SELECT *
FROM v_tsp
WHERE total_cost = (
        SELECT MIN(total_cost)
        FROM v_tsp
    )
    OR total_cost = (
        SELECT MAX(total_cost)
        FROM v_tsp
    )
ORDER BY total_cost,
    tour;