-- create a Database View (with name v_generated_dates) which should be “store”
-- generated dates from 1st to 31th of January 2022 in DATE type. Order the
-- generated_date column
CREATE VIEW v_generated_dates AS
SELECT generate_series(
        TIMESTAMP '2022-01-01',
        TIMESTAMP '2022-01-31',
        INTERVAL '1 day'
    )::date AS generated_date
ORDER BY generated_date;