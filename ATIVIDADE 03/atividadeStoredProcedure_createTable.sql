/*---exercício 01:
criar a tabela*/
CREATE DATABASE atividadeStoredProcedure;
USE atividadeStoredProcedure;

CREATE TABLE Depto(
	cod_depto INT PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE Empregado(
    cod_empregado INT PRIMARY KEY,
    cod_depto INT,
    FOREIGN KEY (cod_depto) REFERENCES Depto(cod_depto),
    nome VARCHAR(50),
    dt_nascimento DATE,
    sexo char(1),
    dt_admissao DATE,
    est_civil CHAR(1),
    salario NUMERIC(10,2)
);

CREATE TABLE Dependente(
   cod_dependente INT,
   cod_empregado INT,
   PRIMARY KEY (cod_dependente, cod_empregado), 
   FOREIGN KEY (cod_empregado) REFERENCES Empregado(cod_empregado),
   nome varchar(50),
   dt_nascimento DATE,
   sexo CHAR(1)
);

/*---exercício 02:
inserindo dados*/
INSERT INTO Depto (cod_depto, nome)
VALUES
(01, 'Tecnologia'),
(02, 'Recursos Humanos');

INSERT INTO Empregado (cod_empregado, cod_depto, nome, dt_nascimento, sexo, dt_admissao, est_civil, salario)
VALUES
(01, 01, 'Pedro Nicolas Costa', '2005-08-28', 'M', '2023-10-01', 'S', 3500.00),
(02, 01, 'Julia Soares', '2002-07-08', 'F', '2023-10-01', 'S', 4000.00),
(03, 02, 'Samaris Professora', '1990-10-03', 'F', '2022-01-01', 'S', 5000.00),
(04, 02, 'Renato Carioca', '2000-05-10', 'M', '2023-10-01', 'S', 3200.00);