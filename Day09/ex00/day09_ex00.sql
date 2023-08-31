-- create a table person_audit, create a database trigger function with the name
-- fnc_trg_person_insert_audit that should process INSERT DML traffic and make a
-- copy of a new row to the person_audit table.
CREATE TABLE person_audit (
    created TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    type_event CHAR(1) NOT NULL DEFAULT 'I',
    row_id BIGINT NOT NULL,
    name VARCHAR,
    age INTEGER,
    gender VARCHAR,
    address VARCHAR,
    CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'U', 'D'))
);
CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS $$ BEGIN
INSERT INTO person_audit
VALUES (
        NOW(),
        'I',
        NEW.id,
        NEW.name,
        NEW.age,
        NEW.gender,
        NEW.address
    );
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trg_person_insert_audit
AFTER
INSERT ON person FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();
INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');