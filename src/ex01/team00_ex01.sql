SELECT *
FROM v_tsp
WHERE total_cost = (SELECT MIN(total_cost) from v_tsp) OR total_cost = (SELECT MAX(total_cost) from v_tsp)
ORDER BY total_cost, tour;