-- change the price for “greek pizza” on -10% from the current value.
UPDATE menu
SET price = price * 0.9
WHERE pizza_name = 'greek pizza';