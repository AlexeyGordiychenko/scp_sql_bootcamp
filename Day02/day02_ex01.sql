-- write a SQL statement which returns the missing days from 1st to 10th of
-- January 2022 (including all days) for visits of persons with identifiers 1 or
-- 2 (it means days missed by both). Order by visiting days in ascending mode
-- It's now allowed to use: NOT IN, IN, NOT EXISTS, EXISTS, UNION, EXCEPT, INTERSECT
SELECT interval.date::date AS missing_date
FROM (
        SELECT generate_series(
                TIMESTAMP '2022-01-01',
                TIMESTAMP '2022-01-10',
                INTERVAL '1 day'
            ) AS date
    ) AS interval
    LEFT JOIN person_visits ON interval.date::date = person_visits.visit_date
    AND person_visits.person_id BETWEEN 1 AND 2
WHERE person_visits.id IS NULL
ORDER BY missing_date