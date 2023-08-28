-- take a look at SQL below from a technical perspective (ignore a logical case
-- of that SQL statement). Create a new BTree index with name idx_1 which should
-- improve the “Execution Time” metric of this SQL. Please provide proof
-- (EXPLAIN ANALYZE) that SQL was improved.
DROP INDEX IF EXISTS idx_1;
SET enable_seqscan = off;
EXPLAIN ANALYZE
SELECT m.pizza_name AS pizza_name,
    max(rating) OVER (
        PARTITION BY rating
        ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS k
FROM menu m
    INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,
    2;
CREATE INDEX idx_1 ON pizzeria (rating);
EXPLAIN ANALYZE
SELECT m.pizza_name AS pizza_name,
    max(rating) OVER (
        PARTITION BY rating
        ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS k
FROM menu m
    INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,
    2;