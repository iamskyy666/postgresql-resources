DROP TABLE IF EXISTS basics.sales;

CREATE TABLE basics.sales(
     id SERIAL PRIMARY KEY,
     title TEXT NOT NULL,
     price NUMERIC(10,5) NOT NULL DEFAULT 0,
     created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO basics.sales(title,price)
VALUES
('sale 1',200),
('sale 2',600);

SELECT * FROM basics.sales;

SELECT * FROM basics.sales WHERE id=2;
