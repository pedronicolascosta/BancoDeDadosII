CREATE DATABASE exercicio9;
USE exercicio9;

CREATE TABLE products (
    id NUMERIC PRIMARY KEY,
    name VARCHAR(255),
    amount NUMERIC(10, 2),
    price NUMERIC(10, 2)
);

INSERT INTO products (id, name, amount, price)
VALUES
    (1, 'Two-doors wardrobe', 100, 800),
    (2, 'Dining table', 1000, 560),
    (3, 'Towel holder', 10000, 25.50),
    (4, 'Computer desk', 350, 320.50),
    (5, 'Chair', 3000, 210.64),
    (6, 'Single bed', 750, 460);

SELECT ROUND(AVG(price), 2) AS average_price
FROM products;