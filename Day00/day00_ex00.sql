-- Make a select statement which returns all person's names and person's ages
-- from the city ‘Kazan’
SELECT name,
    age
FROM person
WHERE address = 'Kazan';