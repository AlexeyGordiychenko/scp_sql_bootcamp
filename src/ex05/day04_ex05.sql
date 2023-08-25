-- create a Database View v_price_with_discount that returns a person's orders
-- with person names, pizza names, real price and calculated column
-- discount_price (with applied 10% discount and satisfies formula price -
-- price*0.1). The result please sort by person name and pizza name and make a
-- round for discount_price column to integer type
CREATE VIEW v_price_with_discount AS
SELECT person.name AS name,
    menu.pizza_name AS pizza_name,
    menu.price AS price,
    ROUND(menu.price * 0.9, 0) AS discount_price
FROM person_order AS po
    JOIN person ON po.person_id = person.id
    JOIN menu ON po.menu_id = menu.id
ORDER BY name,
    pizza_name;