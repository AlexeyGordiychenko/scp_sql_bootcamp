-- check “Lost Update Anomaly” database pattern under a default isolation level
-- READ COMMITTED. Check a rating for “Pizza Hut” in a transaction mode for both
-- Sessions and after that make UPDATE of rating to 4 value in session #1 and
-- make UPDATE of rating to 3.6 value in session #2
-- Session #1
BEGIN;
-- Session #2
BEGIN;
-- Session #1
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- Session #2
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- Session #1
UPDATE pizzeria
SET rating = 4
WHERE name = 'Pizza Hut';
-- Session #2
UPDATE pizzeria
SET rating = 3.6
WHERE name = 'Pizza Hut';
-- Session #1
COMMIT;
-- Session #2
COMMIT;
-- Session #1
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- Session #2
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';