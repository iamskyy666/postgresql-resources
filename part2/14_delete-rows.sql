 -- SELECT * FROM products;

INSERT INTO products(
    name,
    category,
    price,
    stock,
    is_active,
    sku,
    description
)
VALUES
(
    'ASUS TUF Gaming Laptop',
    'Electronics',
    74999.00,
    0,
    false,
    'ASUS-TUF-014',
    'Gaming laptop with Ryzen 7 processor and RTX graphics'
),
(
    'Boat Rockerz Headphones',
    'Accessories',
    1999.00,
    35,
    true,
    'BOAT-HDP-015',
    'Wireless over-ear headphones with deep bass'
),
(
    'Nike Running Shoes',
    'Fashion',
    4999.00,
    0,
    false,
    'NIKE-RUN-016',
    'Lightweight running shoes for daily workouts'
),
(
    'LG Smart TV 43',
    'Electronics',
    32999.00,
    12,
    true,
    'LG-TV-017',
    '43-inch 4K UHD Smart Television with WebOS'
),
(
    'HP Pavilion Laptop',
    'Electronics',
    58999.00,
    0,
    false,
    'HP-PAV-018',
    'HP Pavilion laptop with Intel i5 and 16GB RAM'
),
(
    'Study Table',
    'Furniture',
    6999.00,
    7,
    true,
    'FUR-TBL-019',
    'Wooden study table with storage shelves'
);

SELECT name,price FROM products
WHERE sku = 'ASUS-TUF-014';

DELETE FROM products
WHERE sku = 'ASUS-TUF-014';

SELECT name,price FROM products
WHERE sku = 'ASUS-TUF-014';