-- All tables in DWH inherit all anomalies from source tables.
--   Tables are not in data consistency
--   Possible NULL values for name and lastname in User table 
-- Write a SQL statement that returns the total volume (sum of all money) of
-- transactions from user balance aggregated by user and balance type. Be aware,
-- all data should be processed including data with anomalies. Below presented a
-- table of result columns and corresponding calculation formula.
--   name                 source: user.name if user.name is NULL then return not
--                        defined value
--   lastname             source: user.lastname if user.lastname is NULL then
--                        return not defined value
--   type                 source: balance.type
--   volume               source: balance.money need to summarize all money
--                        “movements”
--   currency_name        source: currency.name if currency.name is NULL then
--                        return not defined value
--   last_rate_to_usd     source: currency.rate_to_usd. take a last
--                        currency.rate_to_usd for corresponding currency if
--                        currency.rate_to_usd is NULL then return 1
--   total_volume_in_usd  source: volume , last_rate_to_usd. make a multiplication
--                        between volume and last_rate_to_usd
-- Sort the result by user name in descending mode and then by user lastname and
-- balance type in ascending mode.
WITH last_curr_data AS (
    SELECT currency.id,
        currency.name,
        currency.rate_to_usd
    FROM (
            SELECT id,
                max(updated) AS updated
            FROM currency
            GROUP BY id
        ) AS last_updated
        JOIN currency ON last_updated.id = currency.id
        AND last_updated.updated = currency.updated
)
SELECT COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    balance_grouped.type,
    balance_grouped.volume,
    COALESCE(last_curr_data.name, 'not defined') AS currency_name,
    COALESCE(last_curr_data.rate_to_usd, 1) AS last_rate_to_usd,
    balance_grouped.volume * COALESCE(last_curr_data.rate_to_usd, 1) AS total_volume_in_usd
FROM (
        SELECT balance.user_id,
            balance.type,
            balance.currency_id,
            SUM(balance.money) AS volume
        FROM balance
        GROUP BY balance.user_id,
            balance.type,
            balance.currency_id
    ) AS balance_grouped
    LEFT JOIN "user" AS u ON balance_grouped.user_id = u.id
    LEFT JOIN last_curr_data ON balance_grouped.currency_id = last_curr_data.id
ORDER BY COALESCE(u.name, 'not defined') DESC,
    COALESCE(u.lastname, 'not defined'),
    balance_grouped.type