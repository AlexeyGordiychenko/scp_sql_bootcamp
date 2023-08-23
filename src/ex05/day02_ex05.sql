-- Find names of all female persons older than 25 and order the result by name.
SELECT name
FROM person
WHERE age > 25
    AND gender = 'female'
ORDER BY name