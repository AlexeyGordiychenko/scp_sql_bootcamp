-- use two active sessions on psql, provide a proof that your parallel session
-- can’t see your changes until you will make a COMMIT
-- Session #1
BEGIN;
UPDATE pizzeria
SET rating = 5
WHERE name = 'Pizza Hut';
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- Session #2
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- Session #1
COMMIT;
-- Session #2
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';