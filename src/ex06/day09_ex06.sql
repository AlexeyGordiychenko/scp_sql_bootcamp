-- create a pl/pgsql function fnc_person_visits_and_eats_on_date based on SQL
-- statement that finds the names of pizzerias which person (IN pperson
-- parameter with default value is ‘Dmitriy’) visited and in which he could buy
-- pizza for less than the given sum in rubles (IN pprice parameter with default
-- value is 500) on the specific date (IN pdate parameter with default value is
-- 8th of January 2022).
CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
        pperson varchar DEFAULT 'Dmitriy',
        pprice numeric DEFAULT 500,
        pdate date DEFAULT '2022-01-08'
    ) RETURNS TABLE (pizzeria_name varchar) AS $$ BEGIN RETURN QUERY
SELECT DISTINCT pizzeria.name AS pizzeria_name
FROM person_visits AS pv
    JOIN person ON pv.person_id = person.id
    JOIN menu ON pv.pizzeria_id = menu.pizzeria_id
    JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
WHERE pv.visit_date = pdate
    AND person.name = pperson
    AND menu.price < pprice;
END;
$$ LANGUAGE plpgsql;
SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);
SELECT *
FROM fnc_person_visits_and_eats_on_date(
        pperson := 'Anna',
        pprice := 1300,
        pdate := '2022-01-01'
    );