-- create a multicolumn unique index (with name idx_person_discounts_unique)
-- that prevents duplicates of pair values person and pizzeria identifiers.
-- After creation of a new index, provide any simple SQL statement that shows
-- proof of index usage
CREATE UNIQUE INDEX IF NOT EXISTS idx_person_discounts_unique ON person_discounts(person_id, pizzeria_id);
SET enable_seqscan = off;
EXPLAIN ANALYZE
SELECT person_id,
    pizzeria_id,
    discount
FROM person_discounts
WHERE person_id = 1
    AND pizzeria_id = 1;