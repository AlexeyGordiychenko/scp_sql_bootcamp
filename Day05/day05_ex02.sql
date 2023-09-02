-- create a functional B-Tree index with name idx_person_name for the column
-- name of the person table. Index should contain person names in upper case.
-- Write and provide any SQL with proof (EXPLAIN ANALYZE) that index
-- idx_person_name is working.
SET enable_seqscan = off;
CREATE INDEX idx_person_name ON person(UPPER(name));
EXPLAIN ANALYZE
SELECT *
FROM person
WHERE UPPER(name) = 'KATE';