-- IN -> value must match one item from the list
-- NOT IN -> value must not match any item from the list
-- BETWEEN -> value must be in a range

SELECT name, category, price
FROM products
WHERE category IN ('Electronics', 'Furniture');

SELECT name,category
FROM products
WHERE category NOT IN ('Electronics', 'Furniture');

-- SELECT name,price,category
-- FROM products
-- WHERE price BETWEEN 1000 AND 10000

SELECT name,price,category,stock
FROM products
WHERE category IN ('Electronics', 'Furniture')
AND price BETWEEN 10000 AND 90000;