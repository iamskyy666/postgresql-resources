 -- AND, OR, NOT

 SELECT name, category, price
 FROM products
 WHERE category = 'Accessories' AND price > 1000;

 SELECT name, category, price
 FROM products
 WHERE category = 'Accessories' OR category = 'Electronics';

 SELECT name, category
 FROM products
 WHERE NOT category = 'Accessories';

 SELECT name, category, price, stock
 FROM products
 WHERE (category='Electronics' OR category='Furniture') AND stock>0;

 SELECT name, category, price, stock
 FROM products
 WHERE is_active = true AND (price<8000 OR stock>10)