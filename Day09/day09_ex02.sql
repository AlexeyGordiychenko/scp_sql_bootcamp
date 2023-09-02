-- create a trigger trg_person_delete_audit and corresponding trigger function
-- fnc_trg_person_delete_audit to handle DELETE statements and make a copy of
-- OLD states for all attribute’s values
CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit() RETURNS TRIGGER AS $$ BEGIN
INSERT INTO person_audit
VALUES (
        NOW(),
        'D',
        OLD.id,
        OLD.name,
        OLD.age,
        OLD.gender,
        OLD.address
    );
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trg_person_delete_audit
AFTER DELETE ON person FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_delete_audit();
DELETE FROM person
WHERE id = 10;