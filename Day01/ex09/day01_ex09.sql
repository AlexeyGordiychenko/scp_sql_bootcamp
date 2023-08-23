-- write 2 SQL statements which return a list of pizzerias names which have not
-- been visited by persons by using IN for 1st one and EXISTS for the 2nd one.
SELECT name
FROM pizzeria
WHERE id NOT IN (
        SELECT pizzeria_id
        FROM person_visits
    );
SELECT name
FROM pizzeria
WHERE NOT EXISTS (
        SELECT pizzeria_id
        FROM person_visits
        WHERE pizzeria_id = pizzeria.id
    );