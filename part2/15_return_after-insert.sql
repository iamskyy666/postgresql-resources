-- returning the affected rows immediately (insert,update etc.)

-- INSERT INTO products(
--     name,
--     category,
--     price,
--     stock,
--     is_active,
--     sku,
--     description
-- )
-- VALUES(
--     'ASUS TUF Gaming Laptop',
--     'Electronics',
--     74999.00,
--     0,
--     false,
--     'ASUS-TUF-014',
--     'Gaming laptop with Ryzen 7 processor and RTX graphics'
-- )
-- RETURNING id, name, category, price, stock, created_at;

UPDATE products
SET stock=stock+10
WHERE sku = 'ASUS-TUF-014'
RETURNING id,name,price,stock;

DELETE FROM products
WHERE sku='ASUS-TUF-014'
RETURNING id,name,price,stock;


