-- write a SQL statement that returns aggregated information by person’s
-- address, the result of “Maximal Age - (Minimal Age / Maximal Age)” that is
-- presented as a formula column, next one is average age per address and the
-- result of comparison between formula and average columns (other words, if
-- formula is greater than average then True, otherwise False value). The result
-- should be sorted by address column.
SELECT d.address,
  d.formula,
  d.average,
  d.formula > d.average AS comparison
FROM (
    SELECT address,
      ROUND(MAX(age) - MIN(age)::numeric / MAX(age), 2) AS formula,
      ROUND(AVG(age), 2) AS average
    FROM person
    GROUP BY address
  ) AS d
ORDER BY address;