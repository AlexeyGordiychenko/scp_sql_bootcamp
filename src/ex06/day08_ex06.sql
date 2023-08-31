-- check “Phantom Reads” database pattern under REPEATABLE READ isolation level.
-- summarize all ratings for all pizzerias in a transaction mode for session #1
-- and after that make UPDATE of rating to 5 value for “Pizza Hut” restaurant in
-- session #2
-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Session #1
SELECT SUM(rating)
FROM pizzeria;
-- Session #2
UPDATE pizzeria
SET rating = 5
WHERE name = 'Pizza Hut';
-- Session #2
COMMIT;
-- Session #1
SELECT SUM(rating)
FROM pizzeria;
-- Session #1
COMMIT;
-- Session #1
SELECT SUM(rating)
FROM pizzeria;
-- Session #2
SELECT SUM(rating)
FROM pizzeria;