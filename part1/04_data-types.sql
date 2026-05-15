CREATE SCHEMA IF NOT EXISTS basics;

DROP TABLE IF EXISTS basics.products_basic;

CREATE TABLE basics.products_basic(
    id SERIAL PRIMARY KEY,

    -- string->max-length of 100 chars.
    name VARCHAR(100) NOT NULL,

    description TEXT,

    stock INTEGER DEFAULT 0,

    -- store larger whole number than INTEGER
    total_views BIGINT DEFAULT 0,

    -- exact decimal vals.
    -- 10 -> total digits
    -- 2 -> digits after decimal point
    price NUMERIC(10,2),

    is_active BOOLEAN DEFAULT true
);

-- queries

INSERT INTO basics.products_basic
(name, description, stock, total_views, price, is_active)
VALUES(
    'product 1',
    'product desc 1',
    100,
    1200,
    2465.65,
    true
),
(
    'product 2',
    'product desc 2',
    88,
    800,
    1245.77,
    false
);

SELECT * FROM basics.products_basic;

SELECT id, name, price, is_active
FROM basics.products_basic
WHERE is_active;