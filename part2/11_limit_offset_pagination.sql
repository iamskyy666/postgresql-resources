-- limit - how many rows do we wanna return?
-- offset - how many rows do we wanna skip?

SELECT name, price
FROM products
ORDER BY name ASC
LIMIT 5;

SELECT price
FROM products
ORDER BY price DESC
LIMIT 7;

-- page 1
SELECT name, price
FROM products
ORDER BY name ASC
LIMIT 5 OFFSET 0;

-- page 2
SELECT name, price
FROM products
ORDER BY name ASC
LIMIT 5 OFFSET 5;

-- PRACTICAL EXAMPLES : (page - 1) * limit
-- (2-1) * 5 = 5 products
-- (3-1) * 5 = 10 products
-- (4-1) * 5 = 15 products
