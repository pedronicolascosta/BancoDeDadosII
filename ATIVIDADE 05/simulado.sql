CREATE DATABASE exercicio;
USE exercicio;

CREATE TABLE novelas(
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    nome varchar(40) not null,
    horario_exibicao TIME
);

CREATE TABLE capitulos(
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    nome varchar(100) NOT NULL,
    data_exibicao DATE,
    cod_novela INT NOT NULL REFERENCES novelas(codigo)
);

-- Inserindo dados na tabela de novelas
INSERT INTO novelas (nome, horario_exibicao) VALUES
('Novela A', '20:00:00'),
('Novela B', '21:00:00'),
('Novela C', '19:30:00');

-- Inserindo dados na tabela de capitulos para "Novela A"
INSERT INTO capitulos (nome, data_exibicao, cod_novela) VALUES
('Capítulo 1', '2024-01-01', 1),
('Capítulo 2', '2024-01-02', 1),
('Capítulo 3', '2024-01-03', 1);

-- Inserindo dados na tabela de capitulos para "Novela B"
INSERT INTO capitulos (nome, data_exibicao, cod_novela) VALUES
('Capítulo 1', '2024-01-01', 2),
('Capítulo 2', '2024-01-02', 2);

-- Inserindo dados na tabela de capitulos para "Novela C"
INSERT INTO capitulos (nome, data_exibicao, cod_novela) VALUES
('Capítulo 1', '2024-01-01', 3);

select max(data_exibicao) from capitulos 
where cod_novela in (select codigo from novelas where nome = 'Novela A');

select max(data_exibicao) from capitulos 
left outer join novelas on (capitulos.cod_novela = novelas.codigo) where novelas.nome = 'Novela A';

select max(data_exibicao) from capitulos, novelas 
where novelas.nome = 'Novela A';

select max(data_exibicao) from capitulos 
inner join novelas on (capitulos.cod_novela = novelas.codigo) where 
novelas.nome = 'Novela A';

select max(data_exibicao) from novelas 
right outer join capitulos on (capitulos.cod_novela = novelas.codigo) where novelas.nome = 'Novela A';