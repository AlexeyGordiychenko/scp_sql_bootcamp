-- write 2 SQL (DML) statements that delete all new orders from exercise
-- #12 based on order date. Then delete “greek pizza” from the menu.
DELETE FROM person_order
WHERE order_date = '2022-02-25';
DELETE FROM menu
WHERE pizza_name = 'greek pizza';