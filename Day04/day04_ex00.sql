-- create 2 Database Views (with similar attributes like the original table)
-- based on simple filtering of gender of persons. Set the corresponding names
-- for the database views: v_persons_female and v_persons_male.
CREATE VIEW v_persons_female AS
SELECT *
FROM person
WHERE gender = 'female';
CREATE VIEW v_persons_male AS
SELECT *
FROM person
WHERE gender = 'male';