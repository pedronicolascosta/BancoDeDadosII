-- Banco de Dados II
-- Produto Final

-- 1. O nome dos componentes do grupo como comentário.
-- Giovanna Lanzi
-- Giovanna Rafaela
-- Pedro Nicolas Costa
-- Sophia

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
INSERT INTO Cliente (nome, email, senha, cpf, dataNascimento, telefone, whatsapp)
VALUES 
('Giovanna Léo', 'giovanna.leo@example.com', 'senha123', '123.456.789-10', '1998-04-15', '(11) 91234-5678', '(11) 98765-4321'),
('Giovana Lanzi', 'giovana.lanzi@example.com', 'senha456', '234.567.890-11', '1995-07-22', '(21) 91234-5678', '(21) 98765-4321'),
('Sophia Tiene', 'sophia.tiene@example.com', 'senha789', '345.678.901-22', '2000-03-10', '(31) 91234-5678', '(31) 98765-4321'),
('Pedro Nicolas', 'pedro.nicolas@example.com', 'senha987', '456.789.012-33', '1999-08-30', '(41) 91234-5678', '(41) 98765-4321'),
('Marcos Vinicius', 'marcos.vinicius@example.com', 'senha321', '567.890.123-44', '1997-12-05', '(51) 91234-5678', '(51) 98765-4321');

-- Inserindo estilos na tabela Estilo
INSERT INTO Estilo (opcaoCor, tipoEstilo, tamanho)
VALUES 
('Preto', 'Realismo', 15),
('Colorido', 'Tradicional', 10),
('Cinza', 'Tribal', 12),
('Preto e Branco', 'Minimalista', 8),
('Colorido', 'Old School', 20);

-- Inserindo clientes e seus estilos na tabela Cliente_Estilo
INSERT INTO Cliente_Estilo (codigoEstilo, codigoCliente)
VALUES 
(1, 1),
(2, 2), 
(3, 3), 
(4, 4),  
(5, 5);  

-- Inserindo tipos de estilo na tabela TipoEstilo
INSERT INTO TipoEstilo (nomeEstilo)
VALUES 
('Realismo'),
('Tradicional'),
('Tribal'),
('Minimalista'),
('Old School');

-- Inserindo cores na tabela Cores
INSERT INTO Cores (nomeCor)
VALUES 
('Preto'),
('Cinza'),
('Branco'),
('Vermelho'),
('Azul');

-- Inserindo estilos e suas cores na tabela Estilo_Cor
INSERT INTO Estilo_Cor (codigoEstilo, idCor)
VALUES 
(1, 1),  
(2, 5), 
(3, 2),  
(4, 1),  
(5, 4);  

-- Inserindo fichas de anamnese na tabela FichaAnamnese
INSERT INTO FichaAnamnese (codigoCliente, fumante, gravida, doencaTransmissivel, epilepsia, diabete, problemaPeleCicatrizacao, tratamentoMedico, tomaRemedio)
VALUES 
(1, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE),  
(2, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE),
(3, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, TRUE),  
(4, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE), 
(5, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, TRUE);     

-- Inserindo doenças na tabela Doencas
INSERT INTO Doencas (nomeDoenca)
VALUES 
('Diabetes'),
('Epilepsia'),
('Doença Cardíaca'),
('Hepatite'),
('HIV');

-- Inserindo preferências de agendamento na tabela PreferenciaAgendamento
INSERT INTO PreferenciaAgendamento (codigoAgendamento, codigoCliente, data, hora)
VALUES 
(1, 1, '2024-09-15', '14:00:00'), 
(2, 2, '2024-09-16', '10:00:00'), 
(3, 3, '2024-09-17', '11:30:00'), 
(4, 4, '2024-09-18', '16:00:00'), 
(5, 5, '2024-09-19', '09:00:00'); 

-- Inserindo escolha de agendamento na tabela Escolhe
INSERT INTO Escolhe (codigoAgendamento, codigoCliente)
VALUES 
(1, 1),  
(2, 2),  
(3, 3), 
(4, 4),  
(5, 5); 

-- 4. Uma alteração de registro em cada tabela.
-- 

-- 5. Uma exclusão de registro em cada tabela.
--

-- 6. Uma alteração da estrutura de uma das tabelas.
-- 

-- 7. A conversão dos dados da tabela alterada, se necessário.
--

-- 8. 5 consultas, cada consulta deve possuir parâmetros diferentes e envolver apenas uma tabela por consulta.
--

-- 9. 5 consultas, cada consulta deve possuir parâmetros diferentes e envolver no mínimo duas tabelas.
--

-- 10. Criação de uma função.
--

-- 11. Criação e execução de uma procedure.
--

-- 12. Criação de um gatilho.
--

-- 13. Deleção das tabelas e banco de dados.
--

-- Retorna a quantidade de inscrições de preferência de agendamento para o dia atual
SELECT COUNT(*) AS quantidade_agendamentos
FROM preferenciaAgendamento
WHERE data = CURDATE();

-- Retorna o nome das pacientes que estejam grávidas e que possuam problemas de pele
SELECT C.nome
FROM Cliente C JOIN FichaAnamnese F ON C.codigoCliente = F.codigoCliente
WHERE F.gravida = TRUE
AND F.problemaPeleCicatrizacao = TRUE;

-- Retorna uma lista de todos os nomes dos clientes ordenado por ordem alfabética 
SELECT nome
FROM Cliente
ORDER BY nome ASC;

-- Retorna a quantidade de tatuagens com preferência de agendamento para um dia específico que possuam mais de 10cm 
SELECT COUNT(*) AS quantidade_tatuagens
FROM preferenciaAgendamento PA
JOIN Cliente_Estilo CE ON PA.codigoCliente = CE.codigoCliente
JOIN Estilo E ON CE.codigoEstilo = E.codigoEstilo
WHERE PA.data = '2024-09-19' AND E.tamanho > 10;

-- Seleciona os 3 estilos de tatuagem mais frequentes
SELECT E.tipoEstilo, COUNT(*) AS frequencia
FROM Cliente_Estilo CE
JOIN Estilo E ON CE.codigoEstilo = E.codigoEstilo
GROUP BY E.tipoEstilo
ORDER BY frequencia DESC
LIMIT 3;

-- Seleciona quantas pessoas têm idade maior que 40 anos 
SELECT COUNT(*) AS quantidade
FROM Cliente
WHERE TIMESTAMPDIFF(YEAR, dataNascimento, CURDATE()) > 40;

-- Seleciona quantas pessoas têm idade maior que 20 anos 
SELECT COUNT(*) AS quantidade
FROM Cliente
WHERE TIMESTAMPDIFF(YEAR, dataNascimento, CURDATE()) > 20;

-- Seleciona quantas pessoas fazem tratamento médico ou tomam remédio.
SELECT COUNT(*) AS quantidade
FROM FichaAnamnese
WHERE tratamentoMedico = TRUE OR tomaRemedio = TRUE;

-- Retorna as 3 cores mais utilizadas 
SELECT C.nomeCor, COUNT(*) AS frequencia
FROM Estilo_Cor EC
JOIN Cores C ON EC.idCor = C.idCor
GROUP BY C.nomeCor
ORDER BY frequencia DESC
LIMIT 3;

-- Retorna os três estilos de tatuagem menos frequentes 
SELECT E.tipoEstilo, COUNT(*) AS frequencia
FROM Cliente_Estilo CE
JOIN Estilo E ON CE.codigoEstilo = E.codigoEstilo
GROUP BY E.tipoEstilo
ORDER BY frequencia ASC
LIMIT 3;

-- Retorna as cinco cores de tinta menos utilizadas nas tatuagens 
SELECT C.nomeCor, COUNT(*) AS frequencia
FROM Estilo_Cor EC
JOIN Cores C ON EC.idCor = C.idCor
GROUP BY C.nomeCor
ORDER BY frequencia ASC
LIMIT 5;

-- Retorna quantas mulheres grávidas estão cadastradas 
SELECT COUNT(*) AS quantidade
FROM FichaAnamnese
WHERE gravida = TRUE;

-- Retorna quantas pessoas preferem tatuar desenhos maiores que um certo tamanho (exemplo: 15 cm) 
SELECT COUNT(DISTINCT CE.codigoCliente) AS quantidade
FROM Cliente_Estilo CE
JOIN Estilo E ON CE.codigoEstilo = E.codigoEstilo
WHERE E.tamanho > 15; 

-- Retorna quantas pessoas preferem tatuar desenhos menores ou iguais a um certo tamanho (exemplo: 15 cm) 
SELECT COUNT(DISTINCT CE.codigoCliente) AS quantidade
FROM Cliente_Estilo CE
JOIN Estilo E ON CE.codigoEstilo = E.codigoEstilo
WHERE E.tamanho <= 15; -- ajuste o valor conforme necessário

-- Exibir todos os agendamentos com a data e o cliente associado 
SELECT PA.data, C.nome
FROM preferenciaAgendamento PA
JOIN Cliente C ON PA.codigoCliente = C.codigoCliente;

-- Listar o nome e o e-mail dos clientes cadastrados 
SELECT nome, email
FROM Cliente;

-- Listar os modelos de tatuagem que os clientes solicitaram 
SELECT C.nome, E.tipoEstilo
FROM Cliente C
JOIN Cliente_Estilo CE ON C.codigoCliente = CE.codigoCliente
JOIN Estilo E ON CE.codigoEstilo = E.codigoEstilo;

-- Listar os clientes que informaram doenças na ficha de anamnese 
SELECT C.nome
FROM Cliente C
JOIN FichaAnamnese F ON C.codigoCliente = F.codigoCliente
WHERE F.codigoCliente IS NOT NULL; 
