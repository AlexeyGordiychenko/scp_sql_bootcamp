-- check “Phantom Reads” database pattern under READ COMMITTED isolation level.
-- Summarize all ratings for all pizzerias in a transaction mode for session #1
-- and after that make UPDATE of rating to 1 value for “Pizza Hut” restaurant in
-- session #2
-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- Session #1
SELECT SUM(rating)
FROM pizzeria;
-- Session #2
UPDATE pizzeria
SET rating = 1
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