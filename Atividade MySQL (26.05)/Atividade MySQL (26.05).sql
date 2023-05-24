-- 1. Crie, no seu banco de dados, a tabela abaixo, insira os valores apresentados e em seguida escreva as consultas solicitadas abaixo.
CREATE DATABASE Aula_2605;
USE Aula_2605;

CREATE TABLE Tabela_1 (
ID_NF int(255),
ID_ITEM int(255),
COD_PROD int(255),
VALOR_UNIT float(255, 2),
QUANTIDADE int(255),
DESCONTO float(255, 2)
);

INSERT INTO Tabela_1 VALUES (1, 1, 1, 25, 10, 0.05);
INSERT INTO Tabela_1 VALUES (1, 2, 2, 13.50, 3, 0);
INSERT INTO Tabela_1 VALUES (1, 3, 3, 15, 2, 0);
INSERT INTO Tabela_1 VALUES (1, 4, 4, 10, 1, 0);
INSERT INTO Tabela_1 VALUES (1, 5, 5, 30, 1, 0);
INSERT INTO Tabela_1 VALUES (2, 1, 3, 15, 4, 0);
INSERT INTO Tabela_1 VALUES (2, 2, 4, 10, 5, 0);
INSERT INTO Tabela_1 VALUES (2, 3, 5, 30, 7, 0);
INSERT INTO Tabela_1 VALUES (3, 1, 1, 25, 5, 0);
INSERT INTO Tabela_1 VALUES (3, 2, 4, 10, 4, 0);
INSERT INTO Tabela_1 VALUES (3, 3, 5, 30, 5, 0);
INSERT INTO Tabela_1 VALUES (3, 4, 2, 13.50, 7, 0);
INSERT INTO Tabela_1 VALUES (4, 1 , 5, 30, 10, 0.15);
INSERT INTO Tabela_1 VALUES (4, 2, 4, 10, 12, 5, 0);
INSERT INTO Tabela_1 VALUES (4, 3, 1, 25,  13, 0.05);
INSERT INTO Tabela_1 VALUES (4, 4, 2, 13.50, 15, 0.05);
INSERT INTO Tabela_1 VALUES (5, 1, 3, 15, 3, 0);
INSERT INTO Tabela_1 VALUES (5, 2, 5, 30, 6, 0);
INSERT INTO Tabela_1 VALUES (6, 1, 1, 25, 22, 0.15);
INSERT INTO Tabela_1 VALUES (6, 2, 3, 15, 25, 0.2);
INSERT INTO Tabela_1 VALUES (7, 1, 1, 25, 10, 0.03);
INSERT INTO Tabela_1 VALUES (7, 2, 2, 13.50, 10, 0.04);
INSERT INTO Tabela_1 VALUES (7, 3, 3, 15, 10, 0.04);
INSERT INTO Tabela_1 VALUES (7, 4 , 5, 30, 10, 0.01);

-- a)Pesquise   os   itens   que   foram   vendidos   sem   desconto.   As colunas   presentes   no resultado da consulta são: ID_NF, ID_ITEM, COD_PROD E VALOR_UNIT
SELECT ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT FROM Tabela_1 WHERE DESCONTO = 0;

-- b)Pesquise  os   itens   que   foram  vendidos  com   desconto.   As   colunas   presentes   no resultado  da  consulta  são:  ID_NF,  ID_ITEM,  COD_PROD,  VALOR_UNIT  E  O  VALOR VENDIDO. OBS: O valor vendido é igual ao VALOR_UNIT -(VALOR_UNIT*(DESCONTO/100)).
SELECT ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, (VALOR_UNIT - (VALOR_UNIT * (DESCONTO / 100))) AS VALOR_VENDIDO FROM Tabela_1 WHERE DESCONTO > 0;

-- c) Altere o valor do desconto (para zero) de todos os registros onde este campo é nulo.
UPDATE Tabela_1 SET DESCONTO = 0 WHERE DESCONTO IS NULL;

-- d) Pesquise os itens que  foram vendidos. As colunas presentes no resultado da consulta são:    ID_NF,    ID_ITEM,    COD_PROD,    VALOR_UNIT,    VALOR_TOTAL,    DESCONTO, VALOR_VENDIDO.  OBS:    O  VALOR_TOTAL  é  obtido  pela  fórmula:  QUANTIDADE  * VALOR_UNIT. O VALOR_VENDIDO é igual a VALOR_UNIT -(VALOR_UNIT*(DESCONTO/100))
SELECT ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, (QUANTIDADE * VALOR_UNIT) AS VALOR_TOTAL, DESCONTO, (VALOR_UNIT - (VALOR_UNIT * (DESCONTO / 100))) AS VALOR_VENDIDO FROM Tabela_1;

-- e) Pesquise  o  valor  total  das  NF  e  ordene  o  resultado  do  maior  valor  para  o  menor.  As colunas  presentes  no  resultado  da  consulta  são:  ID_NF,  VALOR_TOTAL.  OBS: O VALOR_TOTAL  é  obtido  pela  fórmula:  ∑  QUANTIDADE  *  VALOR_UNIT.Agrupe  o resultado da consulta por ID_NF
SELECT ID_NF, SUM(QUANTIDADE * VALOR_UNIT) AS VALOR_TOTAL FROM Tabela_1 GROUP BY ID_NF ORDER BY VALOR_TOTAL DESC;

-- f) Pesquise o valor vendido das NF e ordene o resultado do maior valor para o menor. As colunas  presentes  no  resultado  da  consulta  são:  ID_NF,  VALOR_VENDIDO.  OBS:    O VALOR_TOTAL    é    obtido    pela    fórmula:    ∑    QUANTIDADE    *    VALOR_UNIT.    O VALOR_VENDIDO  é  igual  a  ∑  VALOR_UNIT -(VALOR_UNIT*(DESCONTO/100)).Agrupe o resultado da consulta por ID_NF.
SELECT ID_NF, SUM(VALOR_UNIT - (VALOR_UNIT * (DESCONTO/100))) AS VALOR_VENDIDO FROM Tabela_1 GROUP BY ID_NF ORDER BY VALOR_VENDIDO DESC;

-- g) Consulte  o  produto  que  mais  vendeu  no  geral.  As  colunas  presentes  no  resultado  da consulta   são: COD_PROD,   QUANTIDADE.Agrupe   o   resultado   da   consulta   por COD_PROD.
SELECT COD_PROD, SUM(QUANTIDADE) AS QUANTIDADE FROM Tabela_1 GROUP BY COD_PROD ORDER BY QUANTIDADE DESC LIMIT 1;

-- h) Consulte as NF que  foram vendidas mais de  10 unidades  de  pelo menos um produto. As colunas presentes no resultado da consulta são: ID_NF, COD_PROD, QUANTIDADE.Agrupe o resultado da consulta por ID_NF, COD_PROD.
SELECT ID_NF, COD_PROD, SUM(QUANTIDADE) AS QUANTIDADE FROM Tabela_1 GROUP BY ID_NF, COD_PROD HAVING SUM(QUANTIDADE) > 10;

-- i) Pesquise  o  valor  total  das  NF,  onde  esse  valor  seja  maior  que  500,  e  ordene  o resultado do maior valor para o menor. As colunas presentes no resultado da consulta são: ID_NF, VALOR_TOT. OBS: O VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT.Agrupe o resultado da consulta por ID_NF.
SELECT ID_NF, SUM(QUANTIDADE * VALOR_UNIT) AS VALOR_TOT FROM Tabela_1 GROUP BY ID_NF HAVING VALOR_TOT > 500 ORDER BY VALOR_TOT DESC;

-- j) Qual  o  valor  médio  dos  descontos  dados  por  produto?  As  colunas  presentes  no resultado  da  consulta  são: COD_PROD,  MEDIA.Agrupe  o  resultado  da  consulta  por COD_PROD.
SELECT COD_PROD, AVG(DESCONTO) AS MEDIA FROM Tabela_1 GROUP BY COD_PROD;

-- k) Qual  o  menor,  maior  e  o  valor  médio  dos  descontos  dados  por  produto.  As  colunas presentes no resultado da consulta são: COD_PROD, MENOR, MAIOR, MEDIA.Agrupe o resultado da consulta por COD_PROD.
SELECT COD_PROD, MIN(DESCONTO) AS MENOR, MAX(DESCONTO) AS MAIOR, AVG(DESCONTO) AS MEDIA FROM Tabela_1 GROUP BY COD_PROD;

-- l) Quais as NF que possuem mais de 3 itens vendidos. As colunas presentes no resultado da  consulta  são:  ID_NF,  QTD_ITENS.  OBS::  NÃO  ESTÁ  RELACIONADO  A  QUANTIDADE VENDIDA  DO  ITEM  E  SIM  A  QUANTIDADE  DE  ITENS  POR  NOTA  FISCAL.Agrupe  o resultado da consulta por ID_NF.
SELECT ID_NF, COUNT(*) AS QTD_ITENS FROM Tabela_1 GROUP BY ID_NF HAVING COUNT(*) > 3;


-- EXERCÍCIO 2 


-- Criação do BD e inserção de informações.
-- Criação da base de dados
CREATE DATABASE Universidade;

-- Utilização da base de dados
USE Universidade;

-- Criação da tabela Alunos
CREATE TABLE Alunos (
  MAT int(255),
  nome varchar(255),
  endereco varchar(255),
  cidade varchar(255),
  PRIMARY KEY (MAT)
);

-- Inserção dos registros na tabela Alunos
INSERT INTO Alunos VALUES (2015010101, 'JOSE DE ALENCAR', 'RUA DAS ALMAS', 'NATAL');
INSERT INTO Alunos VALUES (2015010102, 'JOÃO JOSÉ', 'AVENIDA RUY CARNEIRO', 'JOÃO PESSOA');
INSERT INTO Alunos VALUES (2015010103, 'MARIA JOAQUINA', 'RUA CARROSSEL', 'RECIFE');
INSERT INTO Alunos VALUES (2015010104, 'MARIA DAS DORES', 'RUA DAS LADEIRAS', 'FORTALEZA');
INSERT INTO Alunos VALUES (2015010105, 'JOSUÉ CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL');
INSERT INTO Alunos VALUES (2015010106, 'JOSUÉLISSON CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL');

-- Criação da tabela Disciplinas
CREATE TABLE Disciplinas (
  COD_DISC varchar(255),
  nome_disc varchar(255),
  carga_hor int(255),
  PRIMARY KEY (COD_DISC)
);
-- Inserção dos registros na tabela Disciplinas
INSERT INTO Disciplinas VALUES ('BD', 'BANCO DE DADOS', 100);
INSERT INTO Disciplinas VALUES ('POO', 'PROGRAMAÇÃO COM ACESSO A BANCO DE DADOS', 100);
INSERT INTO Disciplinas VALUES ('WEB', 'AUTORIA WEB', 50);
INSERT INTO Disciplinas VALUES ('ENG', 'ENGENHARIA DE SOFTWARE', 80);

-- Criação da tabela Professores
CREATE TABLE Professores (
  COD_PROF int(255),
  nome varchar(255),
  endereco varchar(255),
  cidade varchar(255),
  PRIMARY KEY (COD_PROF)
);

-- Inserção dos registros na tabela Professores
INSERT INTO Professores VALUES (212131, 'NICKERSON FERREIRA', 'RUA MANAÍRA', 'JOÃO PESSOA');
INSERT INTO Professores VALUES (122135, 'ADORILSON BEZERRA', 'AVENIDA SALGADO FILHO', 'NATAL');
INSERT INTO Professores VALUES (192011, 'DIEGO OLIVEIRA', 'AVENIDA ROBERTO FREIRE', 'NATAL');

-- Criação da tabela Turma
CREATE TABLE Turma (
  COD_DISC int(255),
  COD_TURMA int(255),
  COD_PROF int(255),
  ANO int(255),
  horario varchar(255),
  PRIMARY KEY (COD_TURMA)
);
alter table Turma add foreign key(COD_DISC) references Disciplinas(COD_DISC);
alter table Turma add foreign key(COD_PROF) references Professores (COD_PROF);
-- Inserção dos registros na tabela Turma
INSERT INTO Turma VALUES ('BD', 1, 212131, 2015, '11H-12H');
INSERT INTO Turma VALUES ('BD', 2, 212131, 2015, '13H-14H');
INSERT INTO Turma VALUES ('POO', 1, 192011, 2015, '08H-09H');
INSERT INTO Turma VALUES ('WEB', 1, 192011, 2015, '07H-08H');
INSERT INTO Turma VALUES ('ENG', 1, 122135, 2015, '10H-11H');

-- Criação da tabela Histórico
CREATE TABLE Historico (
  MAT int(255),
  COD_DISC int(255),
  COD_TURMA int(255),
  COD_PROF int(255),
  ANO int(255),
  frequencia int(255),
  nota float(255, 2),
  PRIMARY KEY (MAT, COD_DISC, COD_TURMA, COD_PROF, ANO),
  FOREIGN KEY (MAT) REFERENCES Alunos (MAT),
  FOREIGN KEY (COD_DISC, COD_TURMA, COD_PROF, ANO) REFERENCES Turma (COD_DISC, COD_TURMA, COD_PROF, ANO)
);

-- a) Encontre a MAT dos alunos com nota em BD em 2015 menor que 5 (obs: BD = código da disciplinas).
SELECT H.MAT FROM Historico H WHERE H.COD_DISC = 'BD' AND H.ANO = 2015 AND H.nota < 5;

-- b) Encontre a MAT e calcule a média das notas dos alunos na disciplina de POO em 2015.
SELECT H.MAT, AVG(H.nota) AS media_notas FROM Historico H WHERE H.COD_DISC = 'POO' AND H.ANO = 2015 GROUP BY H.MAT;

-- c) Encontre a MAT e calcule a média das notas dos alunos na disciplina de POO em 2015 e que esta média seja superior a 6
SELECT H.MAT, AVG(H.nota) AS media_notas FROM Historico H WHERE H.COD_DISC = 'POO' AND H.ANO = 2015 GROUP BY H.MAT HAVING AVG(H.nota) > 6;

-- d) Encontre quantos alunos não são de Natal.
SELECT COUNT(*) AS quantidade_alunos FROM Alunos WHERE cidade <> 'NATAL';

