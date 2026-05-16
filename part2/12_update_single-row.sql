-- SELECT sku FROM products;

SELECT name, price, stock, category, sku
FROM products
WHERE sku = 'WTB-008';

UPDATE products
SET price = 599.55,
    stock = 25
WHERE sku = 'WTB-008';

SELECT name, price, stock, category, sku
FROM products
WHERE sku = 'WTB-008';