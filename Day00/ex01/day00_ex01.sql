-- Make a select statement which returns names, ages for all women from the city
-- ‘Kazan’. Sort result by name.
SELECT name,
    age
FROM person
WHERE address = 'Kazan'
    and gender = 'female'
ORDER BY name;