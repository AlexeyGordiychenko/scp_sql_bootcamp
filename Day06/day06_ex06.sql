-- create a database sequence with the name seq_person_discounts (starting from
-- 1 value) and set a default value for id attribute of person_discounts table
-- to take a value from seq_person_discounts each time automatically. Be aware
-- that your next sequence number is 1, in this case set an actual value for
-- database sequence based on formula:
--   “amount of rows in person_discounts table” + 1
-- It's now allowed to use hard-coded value for amount of rows to set a right
-- value for sequence
CREATE SEQUENCE IF NOT EXISTS seq_person_discounts START 1;
SELECT setval(
        'seq_person_discounts',
        (
            SELECT MAX(id)
            FROM person_discounts
        )
    );
ALTER TABLE person_discounts
ALTER COLUMN id
SET DEFAULT nextval('seq_person_discounts');
-- -- insert random values to test the auto-generation
INSERT INTO person_discounts (person_id, pizzeria_id, discount)
VALUES (8, 3, 0);