-- add comments for the table person_discounts that explain what is a business
-- goal of the table and all included attributes.
COMMENT ON TABLE person_discounts IS 'This table stores information about discounts offered to people at different pizzerias.';
COMMENT ON COLUMN person_discounts.id IS 'The unique identifier for each discount for a person in a pizzeria.';
COMMENT ON COLUMN person_discounts.person_id IS 'The identifier for the person receiving the discount.';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'The identifier for the pizzeria offering the discount.';
COMMENT ON COLUMN person_discounts.discount IS 'The discount amount, represented as a percentage.';