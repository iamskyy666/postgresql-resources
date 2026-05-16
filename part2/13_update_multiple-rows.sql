SELECT name,price,stock,sku FROM products
WHERE category = 'Accessories';

UPDATE products
SET price  = ROUND(price * 1.10, 2) -- 2 decimal places
WHERE category = 'Accessories';

SELECT name,price,stock,sku FROM products
WHERE category = 'Accessories';

UPDATE products
SET is_active = FALSE
WHERE stock = 0;

SELECT name,price,stock,sku FROM products
WHERE is_active = FALSE;


