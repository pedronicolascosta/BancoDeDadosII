CREATE DATABASE exercicio11;
USE exercicio11;

CREATE TABLE prices (
  id numeric PRIMARY KEY,
  categorie varchar(50),
  value numeric(10, 2) 
);

CREATE TABLE movies (
  id numeric PRIMARY KEY,
  name varchar(50),
  id_prices numeric REFERENCES prices (id)
);

INSERT INTO prices (id, categorie, value)
VALUES
  (1, 'Releases', 3.50),
  (2, 'Bronze Seal', 2.00),
  (3, 'Silver Seal', 2.50),
  (4, 'Gold Seal', 3.00),
  (5, 'Promotion', 1.50);
  
INSERT INTO movies (id, name, id_prices)
VALUES
  (1, 'Batman', 3),
  (2, 'The Battle of the Dark River', 3),
  (3, 'White Duck', 5),
  (4, 'Breaking Barriers', 4),
  (5, 'The Two Hours', 2);

SELECT m.id, m.name
FROM movies m
JOIN prices p ON m.id_prices = p.id
WHERE p.value < 2.00;
