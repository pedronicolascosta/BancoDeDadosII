CREATE DATABASE exercicio8;
USE exercicio8;

CREATE TABLE categories (
  id INT PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE products (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  amount INT,
  price DECIMAL(7,2),
  id_categories INT,
  FOREIGN KEY (id_categories) REFERENCES categories (id)
);

INSERT INTO categories (id, name)
VALUES 
  (1,	'wood'),
  (2,	'luxury'),
  (3,	'vintage'),
  (4,	'modern'),
  (5,	'super luxury');
  
INSERT INTO products (id, name, amount, price, id_categories)
VALUES 
  (1,	'Two-doors wardrobe', 100,	800,	1),
  (2,	'Dining table',	1000,	560,	3),
  (3,	'Towel holder',	10000,	25.50,	4),
  (4,	'Computer desk',	350,	320.50,	2),
  (5,	'Chair',	3000,	210.64,	4),
  (6,	'Single bed',	750,	460,	1);

SELECT c.name AS category_name,
SUM(p.amount) AS total_amount
FROM categories c
LEFT JOIN products p ON c.id = p.id_categories
GROUP BY c.name;