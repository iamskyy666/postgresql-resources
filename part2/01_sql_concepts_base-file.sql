CREATE EXTENSION IF NOT EXISTS pgcrypto; DROP TABLE IF EXISTS products; CREATE TABLE products( id UUID PRIMARY KEY DEFAULT gen_random_uuid(), name TEXT NOT NULL, category TEXT NOT NULL, price NUMERIC(10,2) NOT NULL CHECK(price >= 0), stock INTEGER NOT NULL DEFAULT 0 CHECK(stock >= 0), is_active BOOLEAN NOT NULL DEFAULT true, sku TEXT UNIQUE, description TEXT, created_at TIMESTAMP NOT NULL DEFAULT NOW() ); 

INSERT INTO products (name,category,price,stock,is_active,sku,description)
VALUES
(
    'iPhone 15',
    'Electronics',
    79999.99,
    15,
    true,
    'APL-IP15-001',
    'Apple iPhone 15 with A16 Bionic chip'
),
(
    'Gaming Mouse',
    'Accessories',
    2499.50,
    40,
    true,
    'LOG-GM-002',
    'RGB wired gaming mouse with 12000 DPI'
),
(
    'Office Chair',
    'Furniture',
    8999.00,
    10,
    true,
    'CHR-OFC-003',
    'Ergonomic office chair with lumbar support'
),
(
    'Mechanical Keyboard',
    'Accessories',
    5499.99,
    25,
    true,
    'KEY-MECH-004',
    'Hot-swappable mechanical keyboard with blue switches'
),
(
    'Samsung Monitor 27',
    'Electronics',
    18999.00,
    8,
    true,
    'SAM-MON-005',
    '27-inch IPS monitor with 144Hz refresh rate'
),
(
    'USB-C Cable',
    'Accessories',
    499.00,
    100,
    true,
    'CBL-USBC-006',
    '1 meter fast charging USB-C cable'
),
(
    'Dell Laptop',
    'Electronics',
    65999.00,
    5,
    true,
    'DLL-LTP-007',
    'Dell Inspiron laptop with Intel i7 processor'
),
(
    'Water Bottle',
    'Lifestyle',
    799.00,
    60,
    false,
    'WTB-008',
    '1L stainless steel insulated water bottle'
);

SELECT * FROM products;