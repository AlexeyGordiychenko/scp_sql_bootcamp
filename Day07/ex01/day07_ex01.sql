-- change a SQL statement from Exercise 00 and return a person name (not
-- identifier). Additional clause is we need to see only top-4 persons with
-- maximal visits in any pizzerias and sorted by a person name
SELECT person.name,
    COUNT(*) AS count_of_visits
FROM person_visits AS pv
    JOIN person ON pv.person_id = person.id
GROUP BY person.name
ORDER BY count_of_visits DESC,
    person.name
LIMIT 4;