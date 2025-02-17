-- Universidade Municipal de São Caetano do Sul
-- Ciência da Computação - 2o semestre
-- Produto Final - Banco de Dados II
-- Professora: Samaris Ramiro Pereira


-- 1. O nome dos componentes do grupo como comentário.
-- Giovanna Lanzi
-- Giovanna Rafaela
-- Pedro Nicolas Costa
-- Sophia Tiene
 
 
-- 2. Criação das tabelas e banco de dados.

-- CRIAÇÃO DO BANCO
CREATE DATABASE MartorelliTattoo;
USE MartorelliTattoo;
 
-- CRIAÇÃO TABELA CLIENTE
CREATE TABLE Cliente(
	nome VARCHAR(60) NOT NULL,
	codigoCliente INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY(codigoCliente),
	email  VARCHAR(45) NOT NULL,
	senha VARCHAR(45) NOT NULL,
	cpf VARCHAR(14) NOT NULL,
	dataNascimento DATE NOT NULL,
	telefone VARCHAR(15),
	whatsapp VARCHAR(15) NOT NULL
);
 
-- CRIAÇÃO DA TABELA ESTILO
CREATE TABLE Estilo (
	codigoEstilo INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (codigoEstilo),
    	opcaoCor VARCHAR(30) NOT NULL,
    	tipoEstilo VARCHAR(30) NOT NULL,
	tamanho INT NOT NULL
);
 
-- CRIAÇÃO DA TABELA CLIENTE/ESTILO
CREATE TABLE Cliente_Estilo (
	codigoEstilo INT NOT NULL,
	codigoCliente INT NOT NULL,
	FOREIGN KEY (codigoEstilo) REFERENCES Estilo(codigoEstilo),
	FOREIGN KEY (codigoCliente) REFERENCES Cliente(codigoCliente),
	PRIMARY KEY (codigoEstilo, codigoCliente)
);
 
-- CRIAÇÃO DA TABELA TIPOESTILO
CREATE TABLE TipoEstilo (
        	idEstilo INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY(idEstilo),
	nomeEstilo VARCHAR(45) NOT NULL
 );
 
-- CRIAÇÃO DA TABELA CORES
CREATE TABLE Cores(
	idCor INT NOT NULL AUTO_INCREMENT ,
	nomeCor VARCHAR(20) NOT NULL,
	PRIMARY KEY (idCor)
);
 
-- CRIAÇÃO DA TABELA ESTILO/COR
CREATE TABLE Estilo_Cor (
	codigoEstilo INT NOT NULL ,
	idCor INT NOT NULL,
	FOREIGN KEY (codigoEstilo) REFERENCES Estilo(codigoEstilo),
	FOREIGN KEY (idCor) REFERENCES Cores(idCor),
	PRIMARY KEY (codigoEstilo, idCor)
);
 
-- CRIAÇÃO DA TABELA FICHA ANAMNESE
CREATE TABLE FichaAnamnese (
	codigoAnamnese INT PRIMARY KEY AUTO_INCREMENT,
	codigoCliente INT NOT NULL,
	fumante BOOLEAN,
	gravida BOOLEAN,
    doencaTransmissivel BOOLEAN,
	epilepsia BOOLEAN,
	diabete BOOLEAN,
    problemaPeleCicatrizacao BOOLEAN,
	tratamentoMedico BOOLEAN,
	tomaRemedio BOOLEAN,
	FOREIGN KEY (codigoCliente) REFERENCES Cliente(codigoCliente)
);
 
-- CRIAÇÃO DA TABELA DOENCAS
CREATE TABLE Doencas (
	codigoDoenca INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nomeDoenca VARCHAR(255) NOT NULL
);
 
-- CRIAÇÃO DA TABELA PREFERENCIAAGENDAMENTO
CREATE TABLE preferenciaAgendamento (
	codigoAgendamento INT,
	codigoCliente INT,
	data DATE,
	hora TIME,
	PRIMARY KEY (codigoAgendamento, codigoCliente)
);
 
-- CRIAÇÃO DA TABELA ESCOLHE
CREATE TABLE Escolhe (
	codigoAgendamento INT NOT NULL PRIMARY KEY,
	codigoCliente INT NOT NULL,
	FOREIGN KEY (codigoAgendamento) REFERENCES PreferenciaAgendamento(codigoAgendamento),
	FOREIGN KEY (codigoCliente) REFERENCES Cliente(codigoCliente)
);
 
 
-- 3. Inserção de no mínimo 5 registros em cada tabela.
-- Inserindo clientes na tabela Cliente
INSERT INTO Cliente (nome, email, senha, cpf, dataNascimento, telefone, whatsapp) VALUES
('Giovanna Léo', 'giovanna.leo@example.com', 'senha123', '123.456.789-10', '1998-04-15', '(11) 91234-5678', '(11) 98765-4321'),
('Giovana Lanzi', 'giovana.lanzi@example.com', 'senha456', '234.567.890-11', '1995-07-22', '(21) 91234-5678', '(21) 98765-4321'),
('Sophia Tiene', 'sophia.tiene@example.com', 'senha789', '345.678.901-22', '2000-03-10', '(31) 91234-5678', '(31) 98765-4321'),
('Pedro Nicolas', 'pedro.nicolas@example.com', 'senha987', '456.789.012-33', '1999-08-30', '(41) 91234-5678', '(41) 98765-4321'),
('Marcos Vinicius', 'marcos.vinicius@example.com', 'senha321', '567.890.123-44', '1997-12-05', '(51) 91234-5678', '(51) 98765-4321');
 
-- Inserindo estilos na tabela Estilo
INSERT INTO Estilo (opcaoCor, tipoEstilo, tamanho) VALUES
('Preto', 'Realismo', 15),
('Colorido', 'Tradicional', 10),
('Cinza', 'Tribal', 12),
('Preto e Branco', 'Minimalista', 8),
('Colorido', 'Old School', 20);
 
-- Inserindo clientes e seus estilos na tabela Cliente_Estilo
INSERT INTO Cliente_Estilo (codigoEstilo, codigoCliente) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4), 
(5, 5); 
 
-- Inserindo tipos de estilo na tabela TipoEstilo
INSERT INTO TipoEstilo (nomeEstilo) VALUES
('Realismo'),
('Tradicional'),
('Tribal'),
('Minimalista'),
('Old School');
 
-- Inserindo cores na tabela Cores
INSERT INTO Cores (nomeCor) VALUES
('Preto'),
('Cinza'),
('Branco'),
('Vermelho'),
('Azul');
 
-- Inserindo estilos e suas cores na tabela Estilo_Cor
INSERT INTO Estilo_Cor (codigoEstilo, idCor) VALUES
(1, 1), 
(2, 5),
(3, 2), 
(4, 1), 
(5, 4); 
 
-- Inserindo fichas de anamnese na tabela FichaAnamnese
INSERT INTO FichaAnamnese (codigoCliente, fumante, gravida, doencaTransmissivel, epilepsia, diabete, problemaPeleCicatrizacao, tratamentoMedico, tomaRemedio) VALUES
(1, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE), 
(2, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE),
(3, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, TRUE), 
(4, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE),
(5, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, TRUE);	
 
-- Inserindo doenças na tabela Doencas
INSERT INTO Doencas (nomeDoenca) VALUES
('Diabetes'),
('Epilepsia'),
('Doença Cardíaca'),
('Hepatite'),
('HIV');
 
-- Inserindo preferências de agendamento na tabela PreferenciaAgendamento
INSERT INTO PreferenciaAgendamento (codigoAgendamento, codigoCliente, data, hora) VALUES
(1, 1, '2024-09-15', '14:00:00'),
(2, 2, '2024-09-16', '10:00:00'),
(3, 3, '2024-09-17', '11:30:00'),
(4, 4, '2024-09-18', '16:00:00'),
(5, 5, '2024-09-19', '09:00:00');
 
-- Inserindo escolha de agendamento na tabela Escolhe
INSERT INTO Escolhe (codigoAgendamento, codigoCliente) VALUES
(1, 1), 
(2, 2), 
(3, 3),
(4, 4),  
(5, 5);
 
 
-- 4. Uma alteração de registro em cada tabela.
-- Alteração na tabela Cliente
UPDATE Cliente
SET nome = "Renato Carioca"
WHERE codigoCliente = 5;

-- Alteração na tabela Cliente_Estilo
UPDATE Cliente_Estilo
SET codigoEstilo = 3
WHERE codigoCliente = 1;

-- Alteração na tabela Estilo
UPDATE Estilo 
SET tamanho = 18 
WHERE codigoEstilo = 1;

-- Alteração na tabela TipoEstilo
UPDATE TipoEstilo 
SET nomeEstilo = 'Surrealismo' 
WHERE idEstilo = 1;

-- Alteração na tabela Cores
UPDATE Cores 
SET nomeCor = 'Verde' 
WHERE idCor = 5; 

-- Alteração na tabela Estilo_Cor 
UPDATE Estilo_Cor 
SET idCor = 3
WHERE codigoEstilo = 2 AND idCor = 5;
 
-- Alteração na tabela Escolhe
UPDATE Escolhe 
SET codigoCliente = 2 
WHERE codigoAgendamento = 3;

-- Alteração na tabela preferenciaAgendamento
UPDATE preferenciaAgendamento
SET hora = '15:00:00'
WHERE codigoCliente = 3;

-- Alteração na tabela fichaAnamnese
UPDATE FichaAnamnese
SET fumante = FALSE
WHERE codigoCliente = 1;

-- Alteração na tabela doencas
UPDATE Doencas
SET nomeDoenca = 'Epilepsia Grave'
WHERE codigoDoenca = 2;


-- 5. Uma exclusão de registro em cada tabela.
-- Exclusão de um registro na tabela Cliente_Estilo
DELETE FROM Cliente_Estilo
WHERE codigoCliente = 5;

-- Exclusão de um registro na tabela Estilo_Cor 
DELETE FROM Estilo_Cor 
WHERE codigoEstilo = 5 AND idCor = 4;

-- Exclusão de um registro na tabela Estilo 
DELETE FROM Estilo
WHERE codigoEstilo = 5; 

-- Exclusão de um registro na tabela TipoEstilo
DELETE FROM TipoEstilo 
WHERE idEstilo = 4; 

-- Exclusão de um registro na tabela Cores
DELETE FROM Cores 
WHERE idCor = 4; 

-- Exclusão de um registro na tabela Escolhe
DELETE FROM Escolhe
WHERE codigoAgendamento = 5;

-- Exclusão de um registro na tabela preferenciaAgendamento
DELETE FROM preferenciaAgendamento
WHERE codigoAgendamento = 5 AND codigoCliente = 5;

-- Exclusão de um registro na tabela fichaAnamnese
DELETE FROM FichaAnamnese
WHERE codigoCliente = 5;

-- Exclusão de um registro na tabela doencas
DELETE FROM Doencas
WHERE codigoDoenca = 3;

-- Exclusão de um registro na tabela Cliente
DELETE FROM Cliente
WHERE codigoCliente = 5;


-- 6. Uma alteração da estrutura de uma das tabelas.
ALTER TABLE Estilo
ADD COLUMN descricao VARCHAR(100);
 
 
-- 7. A conversão dos dados da tabela alterada, se necessário.
UPDATE Estilo 
SET descricao = 'Estilo de tatuagem em preto e realista' 
WHERE codigoEstilo = 1; 

UPDATE Estilo 
SET descricao = 'Estilo de tatuagem colorida e tradicional' 
WHERE codigoEstilo = 2; 

UPDATE Estilo 
SET descricao = 'Estilo de tatuagem tribal em tons de cinza' 
WHERE codigoEstilo = 3; 

UPDATE Estilo 
SET descricao = 'Estilo minimalista em preto e branco' 
WHERE codigoEstilo = 4; 
 

-- 8. 5 consultas, cada consulta deve possuir parâmetros diferentes e envolver apenas uma tabela por consulta.
-- Consulta para selecionar todos os estilos que têm a cor "Preto"
SELECT *
FROM Estilo 
WHERE opcaoCor = 'Preto';

-- Consulta para exibir as cores disponíveis com ID maior que 2 (na tabela Cores)
SELECT *
FROM Cores 
WHERE idCor > 2;
 
-- Consulta para contar agendamentos para um dia específico:
SELECT COUNT(*) AS quantidade_agendamentos
FROM preferenciaAgendamento
WHERE data = '2024-11-15'; 

-- Seleciona os 3 clientes com mais preferências de agendamento
SELECT codigoCliente, COUNT(*) AS quantidade_agendamentos
FROM preferenciaAgendamento
GROUP BY codigoCliente
ORDER BY quantidade_agendamentos DESC
LIMIT 3;

-- Seleciona o nome do cliente que tem o código igual a 3
SELECT nome
FROM Cliente
WHERE codigoCliente = 3;
 
 
-- 9. 5 consultas, cada consulta deve possuir parâmetros diferentes e envolver no mínimo duas tabelas.
-- Seleciona os 5 estilos de tatuagem mais frequentes
SELECT E.tipoEstilo, COUNT(*) AS frequencia
FROM Cliente_Estilo CE
JOIN Estilo E ON CE.codigoEstilo = E.codigoEstilo
GROUP BY E.tipoEstilo
ORDER BY frequencia DESC
LIMIT 5;

-- Retorna os três estilos de tatuagem menos frequentes
SELECT E.tipoEstilo, COUNT(*) AS frequencia
FROM Cliente_Estilo CE
JOIN Estilo E ON CE.codigoEstilo = E.codigoEstilo
GROUP BY E.tipoEstilo
ORDER BY frequencia ASC
LIMIT 3;

-- Consulta para selecionar agendamentos para um cliente específico:
SELECT PA.data, C.nome
FROM preferenciaAgendamento PA
JOIN Cliente C ON PA.codigoCliente = C.codigoCliente
WHERE C.codigoCliente = 2; 

-- Seleciona todos os clientes e seus agendamentos:
SELECT C.nome, A.data, A.hora
FROM Cliente C
JOIN PreferenciaAgendamento A ON C.codigoCliente = A.codigoCliente;

-- Exibe todos os estilos e os clientes que escolheram esses estilos:
SELECT E.tipoEstilo, C.nome
FROM Estilo E
JOIN Cliente_Estilo CE ON E.codigoEstilo = CE.codigoEstilo
JOIN Cliente C ON CE.codigoCliente = C.codigoCliente;
 
 
-- 10. Criação de uma função.
-- Essa função conta quantos agendamentos existem para um cliente em específico
DELIMITER //
CREATE FUNCTION ContarAgendamentos(codigoCliente INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE totalAgendamentos INT;
    
    SELECT COUNT(*) INTO totalAgendamentos
    FROM Escolhe
    WHERE Escolhe.codigoCliente = codigoCliente;
    
    RETURN totalAgendamentos;
END //
DELIMITER ;

-- Teste da função
SELECT ContarAgendamentos(3);
 
-- 11. Criação e execução de uma procedure.
DELIMITER $$
CREATE PROCEDURE GetEstilosPorFrequencia(IN limite INT) 
BEGIN 
SELECT E.tipoEstilo, COUNT(*) AS frequencia 
FROM Cliente_Estilo CE
JOIN Estilo E ON CE.codigoEstilo = E.codigoEstilo 
GROUP BY E.tipoEstilo 
ORDER BY frequencia DESC
LIMIT limite; 
END $$
DELIMITER ;
 
CALL GetEstilosPorFrequencia(5);
 

-- 12. Criação de um gatilho.
-- Este gatilho bloqueia a inserção de um novo cliente com CPF que já está cadastrado
DELIMITER $$
CREATE TRIGGER BloquearCPFRepetido
BEFORE INSERT ON cliente
FOR EACH ROW
BEGIN
    -- Verifica se já existe um cliente com o mesmo CPF
    IF (SELECT COUNT(*) FROM cliente WHERE cpf = NEW.cpf) > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro!: Já existe um cliente com este CPF.';
    END IF;
END $$
DELIMITER ;

-- Teste do gatilho, que DEVE emitir um erro pois tenta inserir um novo cliente com CPF já cadastrado no banco de dados
INSERT INTO Cliente (nome, email, senha, cpf, dataNascimento, telefone, whatsapp) VALUES
('Cliente Novo', 'cliente.novo@example.com', 'senha1234', '123.456.789-10', '1998-04-15', '(11) 94321-8765', '(11) 1234-9876');


-- 13. Deleção das tabelas e banco de dados.
-- Deleta todas as tabelas
DROP TABLE IF EXISTS Escolhe;
DROP TABLE IF EXISTS PreferenciaAgendamento;
DROP TABLE IF EXISTS FichaAnamnese;
DROP TABLE IF EXISTS Estilo_Cor;
DROP TABLE IF EXISTS Cores;
DROP TABLE IF EXISTS TipoEstilo;
DROP TABLE IF EXISTS Cliente_Estilo;
DROP TABLE IF EXISTS Estilo;
DROP TABLE IF EXISTS Doencas;
DROP TABLE IF EXISTS Cliente;

-- Deleta o banco de dados
DROP DATABASE IF EXISTS MartorelliTattoo;