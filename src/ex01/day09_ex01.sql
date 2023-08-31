-- define a trigger trg_person_update_audit and corresponding trigger function
-- fnc_trg_person_update_audit to handle all UPDATE traffic on the person table.
-- We should save OLD states of all attribute’s values.
CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit() RETURNS TRIGGER AS $$ BEGIN
INSERT INTO person_audit
VALUES (
        NOW(),
        'U',
        OLD.id,
        OLD.name,
        OLD.age,
        OLD.gender,
        OLD.address
    );
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trg_person_update_audit
AFTER
UPDATE ON person FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_update_audit();
UPDATE person
SET name = 'Bulat'
WHERE id = 10;
UPDATE person
SET name = 'Damir'
WHERE id = 10;