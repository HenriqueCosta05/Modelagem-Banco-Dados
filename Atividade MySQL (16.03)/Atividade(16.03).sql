-- Criando um Banco de Dados: Etapa 1.
CREATE DATABASE bdVirtual;
USE bdvirtual;
-- 1. Crie no MySQL Workbench  tabela mostrada. 
CREATE TABLE Veiculo (
idVeiculo int(5) not null primary key,
placa varchar(45) not null,
modelo varchar(45) not null,
fabricante varchar(45) not null,
combustivel varchar(45) not null,
ano integer(4),
valor float,
quilometragem float (45, 2)
);
-- Preencha o banco de dados com pelo menos 10 registros antes de resolver a questão 3.
INSERT INTO Veiculo
VALUES ('10300', 'PSO-1832', 'C3', 'CITROEN', 'GASOLINA', '2013', '10000', '25000.00');
INSERT INTO Veiculo
VALUES('10301', 'SOS-2023', 'C4', 'CITROEN', 'GASOLINA', '2014', '15000', '30000.00');
INSERT INTO Veiculo
VALUES('10302', 'PSN-2096', 'C3', 'CITROEN', 'FLEX', '2015', '20000.00', '35000.00');
INSERT INTO Veiculo
VALUES('10303', 'WMS-9645', 'C4', 'CITROEN', 'FLEX', '2016', '25000.00', '40000.00');
INSERT INTO Veiculo
VALUES('10304', 'YDD-2084', 'JUMPY', 'CITROEN', 'GASOLINA', '2017', '80000.00', '45000.00');
INSERT INTO Veiculo
VALUES('10305', 'SHW-5983', 'JUMPER', 'CITROEN', 'FLEX', '2018', '80000.00', '50000.00');
INSERT INTO Veiculo
VALUES('10306', 'KST-2943', 'C3', 'CITROEN', 'FLEX', '2019', '80000.00', '55000.00');
INSERT INTO Veiculo
VALUES('10307', 'WNS-0458', 'C4', 'CITROEN', 'GASOLINA', '2020', '80000.00', '60000.00');
INSERT INTO Veiculo
VALUES('10308', 'NDJ-9732', 'C4', 'CITROEN', 'FLEX', '2021', '80000.00', '65000.00');
INSERT INTO Veiculo
VALUES('10309', 'YSN-2028', 'C3', 'CITROEN', 'FLEX', '2022', '80000.00', '70000.00');

-- Escreva os comandos SQL que retorne as seguintes consultas: 

-- a. Liste todos os dados de todos os veículos.
SELECT * FROM Veiculo;

-- b. Liste o fabricante, modelo e ano dos veículos fabricados a partir do ano 2000. 
SELECT fabricante, modelo, ano FROM Veiculo WHERE ano >= 2000;

-- c. Liste todos os carros movidos à gasolina, em ordem crescente de preço. 
SELECT combustivel, valor FROM veiculo WHERE combustivel = 'GASOLINA';

-- d. iste o fabricante, modelo, ano e valor dos carros que custam entre 15 e 25 mil, em ordem decrescente. 
SELECT fabricante, modelo, ano, valor FROM veiculo WHERE valor > '15000' AND valor < '25000' ORDER BY valor DESC;

-- e. Liste a placa e quilometragem dos carros cuja quilometragem seja menor que 30.000 km. 
SELECT placa, quilometragem FROM Veiculo WHERE quilometragem < '30000';

-- f. Liste todos os carros movidos à gasolina ou etanol. 
SELECT combustivel FROM veiculo WHERE combustivel = 'GASOLINA' OR combustivel = 'ETANOL';

-- g. Liste os carros da FIAT movidos à diesel. 
SELECT fabricante, combustivel FROM Veiculo WHERE combustivel = 'DIESEL' AND fabricante = 'FIAT'; 

-- 4. Escreva o comando que atualiza o preço de um veículo. 
UPDATE Veiculo SET valor = '25000' WHERE idVeiculo = '';

-- 5. Escreva o comando que exclui o registro de um veículo. 
DELETE FROM Veiculo WHERE idVeiculo = '10300';
