-- write a SQL statement that returns the person name and corresponding number
-- of visits in any pizzerias if the person has visited more than 3 times (> 3)
-- It's not allowed to use: WHERE
SELECT person.name,
    COUNT(*) AS count_of_visits
FROM person_visits AS pv
    JOIN person ON pv.person_id = person.id
GROUP BY person.name
HAVING COUNT(*) > 3;