CREATE DATABASE QuestaoEnade;
USE QuestaoEnade;

CREATE TABLE Motorista(
    idMoto INT PRIMARY KEY,
    nome varchar(50),
    telefone varchar(15),
    idade INT
);

CREATE TABLE Carro(
    idCarro INT PRIMARY KEY,
    nomeCarro varchar(50),
    COR VARCHAR(50)
);

CREATE TABLE Reservas(
    idMoto INT,
    idCarro INT,
    dia DATE,
    FOREIGN KEY(idMoto) REFERENCES Motorista(idMoto),
    FOREIGN KEY(idCarro) REFERENCES Carro(idCarro),
    PRIMARY KEY(idMoto, idCarro)
);

INSERT INTO Motorista (idMoto, nome, telefone, idade)VALUES
(22, "José", "8888-0000", 45),
(29, "Maria", "9999-0000", 33),
(31, "Antônio", NULL, 35),
(32, "Carlos", "3333-9999", 16),
(58, "Josefina", "3333-0000", 60),
(64, "Marilda", "3333-1111", 26);

INSERT INTO Carro (idCarro, nomeCarro, cor) VALUES
(101, "Ônix", "Vermelho"),
(102, "Gol", "Vermelho"),
(103, "Civic", "Verde"),
(104, "Pálio", "Azul");

INSERT INTO Reservas(idMoto, idCarro, dia) VALUES
(22, 101, "2020-08-07"),
(22, 102, "2020-08-07"),
(22, 103, "2020-08-09"),
(22, 104, "2020-08-10"),
(31, 102, "2020-08-10"),
(31, 103, "2020-08-11"),
(64, 101, "2020-08-13");

SELECT M.nome
FROM Motorista M 
WHERE M.idMoto NOT IN
	(SELECT R.idMoto
     FROM Reservas R 
     WHERE R.idCarro NOT IN
     	(SELECT C.idCarro
         FROM Carro C 
         WHERE C.cor = 'vermelho'))

SELECT M.nome
FROM Marinheiros M 
WHERE M.idMari NOT IN
	(SELECT R.idMari
     FROM Reservas R 
     WHERE R.idBarco ANY
     (SELECT B.idBarco
      FROM Barco B 
      WHERE B.cor = "vermelho"))

SELECT M.nome
FROM Motorista M 
WHERE M.idMoto IN
	(SELECT R.idMoto
     FROM Reservas R 
     WHERE R.idCarro NOT IN
     (SELECT C.idCarro
      FROM Carro C 
      WHERE C.cor = "Vermelho"))

SELECT M.nome
FROM Motorista M 
WHERE M.idMoto IN
	(SELECT R.idMoto
     FROM Reservas R 
     WHERE R.idCarro IN
     (SELECT C.idCarro
      FROM Carro C 
      WHERE C.cor = "Vermelho"))

SELECT M.nome
FROM Motorista M 
WHERE M.idMoto IN
	(SELECT R.idMoto
     FROM Reservas R 
     WHERE R.idCarro NOT IN
     (SELECT C.idCarro
      FROM Carro C 
      WHERE C.cor = "Vermelho"))