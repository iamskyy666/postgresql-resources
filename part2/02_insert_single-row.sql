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
    'Noise Smart Watch',
    'Wearables',
    3499.00,
    22,
    'NOS-SWT-0099',
    'Bluetooth smart watch with heart rate monitoring'
);

SELECT * FROM products WHERE sku = 'NOS-SWT-0099';