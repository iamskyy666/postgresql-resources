-- like -> case sensitive pattern-matching
-- ilike -> case insensitive pattern-matching
-- % -> any no. of chars.
-- _ -> exactly 1 char.

-- SELECT * FROM products;

SELECT name,price
FROM products
-- % - anything can come after it
WHERE name LIKE 'iPhone%';

SELECT name,category,price
FROM products
WHERE name ILIKE '%mouse';

SELECT name, category, description
FROM products
WHERE name ILIKE '%chair'
OR description ILIKE '%chair%';