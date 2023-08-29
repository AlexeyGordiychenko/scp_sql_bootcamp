-- create a new relational table person_discounts with:
--   id attribute like a Primary Key
--   attributes person_id and pizzeria_id as foreign keys for corresponding
--   tables with explicit names for foreign keys constraints by pattern
--     fk_{table_name}_{column_name}
--   discount attribute to store a value of discount in percent
CREATE TABLE IF NOT EXISTS person_discounts (
    id BIGINT PRIMARY KEY,
    person_id BIGINT,
    pizzeria_id BIGINT,
    discount NUMERIC,
    CONSTRAINT fk_person_discounts_person_id FOREIGN KEY (person_id) REFERENCES person(id),
    CONSTRAINT fk_person_discounts_pizzeria_id FOREIGN KEY (pizzeria_id) REFERENCES pizzeria(id)
);