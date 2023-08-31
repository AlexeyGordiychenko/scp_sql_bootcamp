-- check “Non-Repeatable Reads” database pattern under SERIALIZABLE isolation
-- level. Check a rating for “Pizza Hut” in a transaction mode for session #1
-- and after that make UPDATE of rating to 3.0 value in session #2
-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Session #1
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- Session #2
UPDATE pizzeria
SET rating = 3.0
WHERE name = 'Pizza Hut';
-- Session #2
COMMIT;
-- Session #1
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- Session #1
COMMIT;
-- Session #1
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- Session #2
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';