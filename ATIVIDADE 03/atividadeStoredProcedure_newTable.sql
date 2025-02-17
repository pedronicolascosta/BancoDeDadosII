/*---exercício 08 e 09:*/
CREATE DATABASE atividadeStoredProcedure2;
USE atividadeStoredProcedure2;

CREATE TABLE Depto(
    cod_depto INT PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE Sexo(
    cod_sexo INT PRIMARY KEY,
    sexo VARCHAR(50)
);

CREATE TABLE EstadoCivil(
    cod_est_civil INT PRIMARY KEY,
    est_civil VARCHAR(50)
);

CREATE TABLE Empregado(
    cod_empregado INT PRIMARY KEY,
    cod_depto INT,
    FOREIGN KEY (cod_depto) REFERENCES Depto(cod_depto),
    nome VARCHAR(50),
    dt_nascimento DATE,
    cod_sexo INT,
    FOREIGN KEY (cod_sexo) REFERENCES Sexo(cod_sexo),
    dt_admissao DATE,
    cod_est_civil INT,
    FOREIGN KEY (cod_est_civil) REFERENCES EstadoCivil(cod_est_civil),
    salario NUMERIC(10,2)
);

CREATE TABLE Dependente(
   cod_dependente INT,
   cod_empregado INT,
   PRIMARY KEY (cod_dependente, cod_empregado), 
   FOREIGN KEY (cod_empregado) REFERENCES Empregado(cod_empregado),
   nome varchar(50),
   dt_nascimento DATE,
   cod_sexo INT,
   FOREIGN KEY (cod_sexo) REFERENCES Sexo(cod_sexo)
);

INSERT INTO Depto (cod_depto, nome)
VALUES
(01, 'Tecnologia'),
(02, 'Recursos Humanos');

INSERT INTO Sexo (cod_sexo, sexo)
VALUES
(01, 'Masculino'),
(02, 'Feminino');

INSERT INTO EstadoCivil (cod_est_civil, est_civil)
VALUES
(01, 'Solteiro'),
(02, 'Casado'),
(03, 'Viúvo');

INSERT INTO Empregado (cod_empregado, cod_depto, nome, dt_nascimento, cod_sexo, dt_admissao, cod_est_civil, salario)
VALUES
(01, 01, 'Pedro Nicolas Costa', '2005-08-28', 1, '2023-10-01', 1, 3500.00),
(02, 01, 'Julia Soares', '2002-07-08', 2, '2023-10-01', 1, 4000.00),
(03, 02, 'Samaris Professora', '1990-10-03', 2, '2022-01-01', 2, 5000.00),
(04, 02, 'Renato Carioca', '2000-05-10', 1, '2023-10-01', 3, 3200.00);