-- Criação do Banco de Dados e suas tabelas.
CREATE DATABASE Formula1;
USE Formula1;

CREATE TABLE EQUIPE (
cd_eq INT PRIMARY KEY,
nm_eq VARCHAR(255)
);

CREATE TABLE PAIS (
cd_pais INT PRIMARY KEY,
nm_pais VARCHAR(255)
);

CREATE TABLE CIRCUITO (
cd_cir INT PRIMARY KEY,
nm_cir VARCHAR(255)
);

CREATE TABLE PILOTO (
cd_pil INT PRIMARY KEY,
nm_eq VARCHAR(255),
posicao VARCHAR(255)
);

CREATE TABLE PROVA (
cd_pro INT PRIMARY KEY,
tp_pro VARCHAR(255),
dt_pro DATE
);

-- Inserção de exemplos na tabela.
INSERT INTO EQUIPE (cd_eq, nm_eq)
VALUES (1, 'Mercedes'), (2, 'Red Bull Racing'), (3, 'Scuderia Ferrari'), (4, 'McLaren'), (5, 'Alpine F1 Team');

INSERT INTO PAIS (cd_pais, nm_pais)
VALUES (1, 'Alemanha'), (2, 'Áustria'), (3, 'Itália'), (4, 'Reino Unido'), (5, 'França');

INSERT INTO CIRCUITO (cd_cir, nm_cir)
VALUES (1, 'Autódromo José Carlos Pace'), (2, 'Circuito de Barcelona-Catalunha'), (3, 'Circuito de Mônaco'), (4, 'Silverstone Circuit'), (5, 'Spa-Francorchamps');

INSERT INTO PILOTO (cd_pil, nm_eq, posicao)
VALUES (1, 'Mercedes', 'Piloto'), (2, 'Red Bull Racing', 'Piloto'), (3, 'Scuderia Ferrari', 'Piloto'), (4, 'McLaren', 'Piloto'), (5, 'Alpine F1 Team', 'Piloto de teste');

INSERT INTO PROVA (cd_pro, tp_pro, dt_pro)
VALUES (1, 'Treino Livre 1', '2023-05-12'), (2, 'Treino Livre 2', '2023-05-13'), (3, 'Treino Livre 3', '2023-05-14'), (4, 'Classificação', '2023-05-27'), (5, 'Corrida', '2023-05-28');

-- Listar o nome de cada equipe seguida do nome do país que ela representa, mas listar também os demais países que não tem representação.
SELECT EQUIPE.nm_eq, PAIS.nm_pais
FROM EQUIPE
FULL JOIN PAIS ON EQUIPE.cd_eq = PAIS.cd_pais
ORDER BY EQUIPE.nm_eq;

-- Listar o nome de cada equipe seguida do nome do país que ela representa.
SELECT EQUIPE.nm_eq, PAIS.nm_pais
FROM EQUIPE
INNER JOIN PAIS ON EQUIPE.cd_eq = PAIS.cd_pais
ORDER BY EQUIPE.nm_eq;

-- Listar o nome dos pilotos que obtiveram 1º lugar em alguma prova (posiçao=1). Não é necessário repetir o nome do piloto caso ele tenha obtido o 1º lugar em mais de uma prova. 
SELECT DISTINCT PILOTO.nm_pil
FROM PILOTO
INNER JOIN PROVA ON PILOTO.cd_pil = PROVA.cd_pro
WHERE PILOTO.posicao = '1'
ORDER BY PILOTO.nm_pil;

-- Listar o nome dos pilotose a posição de cada um obtidano GP do Brasil.
SELECT PILOTO.nm_pil, PILOTO.posicao
FROM PILOTO
INNER JOIN PROVA ON PILOTO.cd_pil = PROVA.cd_pro
WHERE PROVA.tp_pro = 'GP do Brasil'
ORDER BY PILOTO.posicao;

-- Listar o nome da equipe, seguida do número de pilotos da equipe. 
SELECT EQUIPE.nm_eq, COUNT(PILOTO.cd_pil) as num_pilotos
FROM EQUIPE
LEFT JOIN PILOTO ON EQUIPE.cd_eq = PILOTO.nm_eq
GROUP BY EQUIPE.nm_eq;

-- Listar o nome da equipe, seguida do número de pilotos da equipe, somente quando o número de pilotos por equipe for maior do que 2. 
SELECT EQUIPE.nm_eq, COUNT(PILOTO.cd_pil) as num_pilotos
FROM EQUIPE
LEFT JOIN PILOTO ON EQUIPE.cd_eq = PILOTO.nm_eq
GROUP BY EQUIPE.nm_eq
HAVING COUNT(PILOTO.cd_pil) > 2;
