-- write a SQL or pl/pgsql function fnc_fibonacci (it’s up to you) that has an
-- input parameter pstop with type integer (by default is 10) and the function
-- output is a table with all Fibonacci numbers less than pstop
CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10) RETURNS TABLE (fibonacci integer) AS $$ WITH RECURSIVE f(a, b) AS (
        SELECT 0,
            1
        UNION ALL
        SELECT b,
            a + b
        FROM f
        WHERE b < pstop
    )
SELECT a
FROM f;
$$ LANGUAGE SQL;
SELECT *
FROM fnc_fibonacci(100);
SELECT *
FROM fnc_fibonacci();