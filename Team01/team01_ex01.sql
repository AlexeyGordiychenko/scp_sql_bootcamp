-- apply INSERT statements below:
-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');
-- Write a SQL statement that returns all Users , all Balance transactions (in
-- this task please ignore currencies that do not have a key in the Currency
-- table ) with currency name and calculated value of currency in USD for the
-- nearest day.
-- Below presented a table of result columns and corresponding calculation formula.
-- name             source: user.name if user.name is NULL then return not
--                  defined value
-- lastname         source: user.lastname if user.lastname is NULL then return
--                  not defined value
-- currency_name	source: currency.name
-- currency_in_usd  involved sources: currency.rate_to_usd, currency.updated,
--                  balance.updated.Take a look at a graphical interpretation of
--                  the formula (picture Formula.png).
--   need to find a nearest rate_to_usd of currency at the past (t1)
--   if t1 is empty (means no any rates at the past) then find a nearest
--   rate_to_usd of currency at the future (t2)
--   use t1 OR t2 rate to calculate a currency in USD format
-- Sort the result by user name in descending mode and then by user lastname and
-- currency name in ascending mode.
INSERT INTO currency
VALUES (100, 'EUR', 0.85, '2022-01-01 13:29');
INSERT INTO currency
VALUES (100, 'EUR', 0.79, '2022-01-08 13:29');
WITH closest_update AS (
    SELECT b.currency_id,
        b.updated,
        CASE
            WHEN MAX(past.updated) IS NULL THEN MIN(future.updated)
            ELSE MAX(past.updated)
        END AS nearest_curr_update
    FROM balance AS b
        LEFT JOIN currency AS past ON b.currency_id = past.id
        AND b.updated >= past.updated
        LEFT JOIN currency AS future ON b.currency_id = future.id
        AND b.updated < future.updated
    GROUP BY b.currency_id,
        b.updated
)
SELECT COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    c.name AS currency_name,
    b.money * c.rate_to_usd AS currency_in_usd
FROM balance AS b
    LEFT JOIN "user" AS u ON b.user_id = u.id
    LEFT JOIN closest_update AS cu ON b.currency_id = cu.currency_id
    AND b.updated = cu.updated
    JOIN currency AS c ON b.currency_id = c.id
    AND c.updated = cu.nearest_curr_update
ORDER BY COALESCE(u.name, 'not defined') DESC,
    COALESCE(u.lastname, 'not defined'),
    COALESCE(c.name, 'not defined')