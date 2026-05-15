INSERT INTO products(
    name,
    category,
    price,
    stock,
    sku,
    description
)
VALUES
(
    'JBL Bluetooth Speaker',
    'Electronics',
    4599.00,
    30,
    'JBL-SPK-011',
    'Portable waterproof Bluetooth speaker with deep bass'
),
(
    'HP Wireless Mouse',
    'Accessories',
    1299.00,
    50,
    'HP-MSE-012',
    'Ergonomic wireless mouse with USB receiver'
),
(
    'Canon DSLR Camera',
    'Electronics',
    54999.00,
    6,
    'CAN-DSLR-013',
    '24MP DSLR camera with 18-55mm kit lens'
);

SELECT name,category,price,stock,sku FROM products
WHERE sku IN ('JBL-SPK-011', 'HP-MSE-012', 'CAN-DSLR-013');