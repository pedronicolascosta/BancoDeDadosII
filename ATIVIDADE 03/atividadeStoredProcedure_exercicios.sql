/*---exercício 03:*/
DELIMITER $$
CREATE PROCEDURE SalariosDepartamento(IN cod_depto INT, OUT quantidadeSalarios INT, OUT somaSalarios DECIMAL(10, 2), OUT mediaSalarios DECIMAL(10, 2), OUT maximoSalario DECIMAL(10,2), OUT minimoSalario DECIMAL(10,2))
BEGIN
    SELECT COUNT(*)
    INTO quantidadeSalarios
    FROM empregado 
    WHERE empregado.cod_depto = cod_depto;

    SELECT SUM(salario)
    INTO somaSalarios
    FROM empregado
    WHERE empregado.cod_depto = cod_depto;

    SELECT somaSalarios / quantidadeSalarios
    INTO mediaSalarios;
    
    SELECT MAX(salario)
    INTO maximoSalario
    FROM empregado
    WHERE empregado.cod_depto = cod_depto;
    
    SELECT MIN(salario)
    INTO minimoSalario
    FROM empregado
    WHERE empregado.cod_depto = cod_depto;

    SELECT quantidadeSalarios AS QuantidadeSalarios, somaSalarios AS SomaSalarios, mediaSalarios AS MediaSalarios, maximoSalario AS MaiorSalario, minimoSalario AS MenorSalario;
END $$
DELIMITER ;

SET @quantidadeSalarios = 0;
SET @somaSalarios = 0.0;
SET @mediaSalarios = 0.0;
SET @maximoSalario = 0.00;
SET @minimoSalario = 0.00;

CALL SalariosDepartamento(1, @quantidadeSalarios, @somaSalarios, @mediaSalarios, @maximoSalario, @minimoSalario);

/*---exercício 04:*/
DELIMITER $$
CREATE PROCEDURE SexoDepartamento(IN nome VARCHAR(50), OUT quantidadeMasculino INT, OUT quantidadeFeminino INT)
BEGIN
    SELECT COUNT(*)
    INTO quantidadeMasculino
    FROM empregado INNER JOIN depto ON empregado.cod_depto = depto.cod_depto
    WHERE empregado.sexo = 'M' AND depto.nome = nome;

    SELECT COUNT(*)
    INTO quantidadeFeminino
    FROM empregado INNER JOIN depto ON empregado.cod_depto = depto.cod_depto
    WHERE empregado.sexo = 'F' AND depto.nome = nome;

    SELECT quantidadeMasculino AS QuantidadeMasculinos, quantidadeFeminino AS QuantidadeFemininos;
END $$
DELIMITER ;

SET @quantidadeMasculino = 0;
SET @quantidadeFeminino = 0;

CALL SexoDepartamento('Tecnologia', @quantidadeMasculino, @quantidadeFeminino);

/*---exercício 05:*/
DELIMITER $$
CREATE PROCEDURE InserirDepartamento(IN cod_depto INT, IN nome VARCHAR(50))
BEGIN
    INSERT INTO Depto (cod_depto, nome)
    VALUES (cod_deptO, nome);
END $$
DELIMITER ;

SET @cod_depto = 3;
SET @nome = 'Administração';

CALL InserirDepartamento(@cod_depto, @nome);

/*---exercício 06:*/
DELIMITER $$
CREATE PROCEDURE AumentoSalarioFeminino()
BEGIN
    UPDATE empregado
    SET salario = salario + ((salario/100)*5)
    WHERE empregado.sexo = 'F';
END $$
DELIMITER ;

CALL AumentoSalarioFeminino();

/*---exercício 07:*/
DELIMITER $$
CREATE PROCEDURE AumentoSalarioMasculino(IN porcentagem INT)
BEGIN
    UPDATE empregado
    SET salario = salario + ((salario/100)*porcentagem)
    WHERE empregado.sexo = 'M';
END $$
DELIMITER ;

CALL AumentoSalarioMasculino(50);

/*---exercício 10:
uma procedure que cadastra um dependente referente a algum empregado*/
DELIMITER $$
CREATE PROCEDURE AdicionarDependente(IN cod_dependente INT, cod_empregado INT, nome VARCHAR(50), dt_nascimento DATE, sexo CHAR(1))
BEGIN
    INSERT INTO Dependente (cod_dependente, cod_empregado, nome, dt_nascimento, sexo)
    VALUES (cod_dependente, cod_empregado, nome, dt_nascimento, sexo);
END $$
DELIMITER ;

CALL AdicionarDependente(1, 4, 'Nome do Dependente', '2023-12-06', 'M');