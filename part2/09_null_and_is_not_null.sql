-- null - missing/unknown vals.
-- we shouldn't check null uisng = null
-- Rather do IS NULL, IS NOT NULL

SELECT name, description FROM products
WHERE description IS NOT NULL;

SELECT name,category,is_active, description
FROM products
WHERE is_active = TRUE AND description IS NULL;
