-- define 2 SQL-functions (not pl/pgsql-functions) with names fnc_persons_female
-- (should return female persons), fnc_persons_male (should return male persons)
CREATE OR REPLACE FUNCTION fnc_persons_female() RETURNS TABLE (LIKE person) AS $$
SELECT *
FROM person
WHERE gender = 'female';
$$ LANGUAGE SQL;
CREATE OR REPLACE FUNCTION fnc_persons_male() RETURNS TABLE (LIKE person) AS $$
SELECT *
FROM person
WHERE gender = 'male';
$$ LANGUAGE SQL;
SELECT *
FROM fnc_persons_male();
SELECT *
FROM fnc_persons_female();