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