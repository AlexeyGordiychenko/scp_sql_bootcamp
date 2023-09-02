-- rewrite your SQL query from Exercise #01 by using the CTE (Common Table
-- Expression) pattern. Please move into the CTE part of your "day generator".
-- The result should be similar like in Exercise #01
-- It's now allowed to use: NOT IN, IN, NOT EXISTS, EXISTS, UNION, EXCEPT, INTERSECT
WITH interval AS (
    SELECT generate_series(
            TIMESTAMP '2022-01-01',
            TIMESTAMP '2022-01-10',
            INTERVAL '1 day'
        ) AS date
)
SELECT interval.date::date AS missing_date
FROM interval
    LEFT JOIN person_visits ON interval.date = person_visits.visit_date
    AND person_visits.person_id BETWEEN 1 AND 2
WHERE person_visits.id IS NULL
ORDER BY missing_date