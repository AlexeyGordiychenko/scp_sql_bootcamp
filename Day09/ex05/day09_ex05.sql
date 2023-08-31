-- drop functions from exercise 04 and create a common SQL-function (not
-- pl/pgsql-function) with the name fnc_persons. This function should have an IN
-- parameter pgender with default value = ‘female’ and should replace the two
-- droped functions
DROP FUNCTION IF EXISTS fnc_persons_female,
fnc_persons_male;
CREATE OR REPLACE FUNCTION fnc_persons(IN pgender varchar DEFAULT 'female') RETURNS TABLE (LIKE person) AS $$
SELECT *
FROM person
WHERE gender = pgender;
$$ LANGUAGE SQL;
SELECT *
FROM fnc_persons(pgender := 'male');
SELECT *
FROM fnc_persons();