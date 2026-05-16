-- select * - returns every columns
-- select specific cols - returns the specific cols. that we want

SELECT * FROM products;

SELECT name,category,price
FROM products;

-- AS - alias
SELECT 
name AS product_name,
price AS selling_price,
stock AS available_qty
FROM products;