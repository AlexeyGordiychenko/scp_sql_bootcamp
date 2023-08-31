-- write a SQL or pl/pgsql function func_minimum (it’s up to you) that has an
-- input parameter is an array of numbers and the function should return a
-- minimum value.
CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr numeric []) RETURNS numeric AS $$
SELECT MIN(val)
FROM UNNEST(arr) AS val;
$$ LANGUAGE SQL;
SELECT func_minimum(VARIADIC arr => ARRAY [10.0, -1.0, 5.0, 4.4]);