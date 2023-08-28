-- create a unique BTree index with the name idx_menu_unique on the menu table
-- for pizzeria_id and pizza_name columns. Please write and provide any SQL with
-- proof (EXPLAIN ANALYZE) that index idx_menu_unique is working.
SET enable_seqscan = off;
CREATE INDEX idx_menu_unique ON menu(pizzeria_id, pizza_name);
EXPLAIN ANALYZE
SELECT pizzeria_id,
    pizza_name
FROM menu
WHERE pizzeria_id = 2
    AND pizza_name = 'cheese pizza';