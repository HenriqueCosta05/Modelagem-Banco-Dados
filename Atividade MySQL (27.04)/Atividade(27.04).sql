-- Exercício 1

-- Passo 1: Criação do Banco de Dados e suas tabelas, de acordo com o modelo conceitual apresentado.
CREATE DATABASE assinaturas;
USE assinaturas;
-- Passo 1.1: Criação da tabela assinante.
CREATE TABLE Assinante (
cd_assinante int(5),
nm_assinante varchar(50) NOT NULL,
PRIMARY KEY(cd_assinante)
);
-- Passo 1.2: Criação da tabela ramo.
CREATE TABLE Ramo_Atividade (
cd_ramo int(50),
ds_ramo varchar(50),
PRIMARY KEY(cd_ramo)
);

-- Passo 1.3: Criação da tabela tipo assinante.
CREATE TABLE Tipo_Assinante (
cd_tipo int(50),
ds_tipo varchar(50),
PRIMARY KEY(cd_tipo)
);

-- Passo 1.4: Criação da tabela endereço
CREATE TABLE Endereco (
cd_endereco int(10),
ds_endereco varchar(50),
complemento varchar(50),
bairro varchar(30),
CEP int(8) NOT NULL,
PRIMARY KEY(cd_endereco)
);

-- Passo 1.5: Criação da tabela município.
CREATE TABLE Municipio (
cd_municipio int(10),
ds_municipio varchar(50) NOT NULL,
PRIMARY KEY(cd_municipio)
);

-- Passo 1.6: Criação da tabela telefone.
CREATE TABLE Telefone (
cd_fone int(5),
nm_fone int(9) NOT NULL,
ddd int(3) NOT NULL,
PRIMARY KEY(cd_fone)
);
-- Passo 2: Inserção de dados nas tabelas.

INSERT INTO Assinante (cd_assinante, nm_assinante) VALUES
(001, 'John Doe'),
(002, 'Jane Smith'),
(003,'Bob Johnson');

INSERT INTO Ramo_Atividade(cd_ramo, ds_ramo) VALUES
(001, 'IT'),
(002, 'Finance'),
(003, 'Healthcare');

INSERT INTO Tipo_Assinante(cd_tipo, ds_tipo) VALUES
(001, 'Individual'),
(002, 'Corporate'),
(003, 'Government');

INSERT INTO Endereco(cd_endereco, ds_endereco, complemento, bairro, CEP) VALUES
(001, '123 Main St', 'Apt 4B,', 'Downtown', '10001'),
(002, '456 Park Ave', 'Suite 100', 'Midtown', '10022'),
(003, '789 Broadway','Floor 5','SoHo', '10003');

INSERT INTO Municipio(cd_municipio, ds_municipio) VALUES
(001,'New York'),
(002, 'Los Angeles'),
(003, 'Chicago');

INSERT INTO Telefone(cd_fone, nm_fone, ddd) VALUES
(001, 555-1234, 212),
(002, 555-5678, 310),
(003, 555-9012, 312);

-- a) Listar os nomes dos assinantes, seguido dos dados do endereço e os telefones correspondentes.
SELECT Assinante.nm_assinante, Endereco.ds_endereco, Endereco.complemento, Endereco.bairro, Endereco.CEP, Telefone.nm_fone, Telefone.ddd FROM Assinante
INNER JOIN Endereco ON Assinante.cd_assinante = Endereco.cd_endereco
INNER JOIN Telefone ON Assinante.cd_assinante = Telefone.cd_fone;

-- b) Listar os nomes dos assinantes, seguido do seu ramo, ordenados por ramo e posteriormente por nome. 
SELECT Assinante.nm_assinante, Ramo_Atividade.ds_ramo FROM Assinante
INNER JOIN Ramo_Atividade ON Assinante.cd_assinante = Ramo_Atividade.cd_ramo
ORDER BY Ramo_Atividade.ds_ramo, Assinante.nm_assinante;

-- c) Listar os assinantes do município de Pelotasque são do tipo residencial.
SELECT Assinante.nm_assinante, Tipo_Assinante.ds_tipo, Municipio.ds_municipio FROM Assinante
INNER JOIN Tipo_Assinante ON Assinante.cd_assinante = Tipo_Assinante.cd_tipo
INNER JOIN Endereco ON Assinante.cd_assinante = Endereco.cd_endereco
INNER JOIN Municipio ON Endereco.cd_endereco = Municipio.cd_municipio
WHERE Tipo_Assinante.ds_tipo = 'residencial' AND Municipio.ds_municipio = 'Pelotas';

-- d) Listar os nomes dos assinantes que possuem mais de um telefone.
SELECT Assinante.nm_assinante FROM Assinante
INNER JOIN Telefone ON Assinante.cd_assinante = Telefone.cd_fone
GROUP BY Assinante.nm_assinante
HAVING COUNT(*) > 1;

-- e) Listar os nomes dos assinantes seguido do número do telefone, tipo de assinante comercial, com endereço em Natalou João Câmara.
SELECT Assinante.nm_assinante, Telefone.nm_fone, Tipo_Assinante.ds_tipo, Endereco.ds_endereco, Endereco.complemento, Endereco.bairro, Municipio.ds_municipio FROM Assinante
INNER JOIN Telefone ON Assinante.cd_assinante = Telefone.cd_fone
INNER JOIN Tipo_Assinante ON Assinante.cd_assinante = Tipo_Assinante.cd_tipo
INNER JOIN Endereco ON Assinante.cd_assinante = Endereco.cd_endereco
INNER JOIN Municipio ON Endereco.cd_endereco = Municipio.cd_municipio
WHERE Tipo_Assinante.ds_tipo = 'comercial' AND (Municipio.ds_municipio = 'Natal' OR Municipio.ds_municipio = 'João Câmara');

-- Exercício 2

-- Passo 1: Criação do Banco de Dados e suas tabelas, de acordo com o modelo conceitual apresentado.
CREATE DATABASE Estacionamento_Veiculos;
USE Estacionamento_Veiculos;

CREATE TABLE Cliente (
CPF varchar(11) NOT NULL PRIMARY KEY,
Nome varchar(60),
dtNasc date
);

CREATE TABLE Modelo (
codMod int(30) NOT NULL PRIMARY KEY,
Desc_2 varchar(40) NOT NULL
);

CREATE TABLE Veiculo (
placa varchar(8) PRIMARY KEY,
cor varchar(20),
Modelo_codMod int,
Cliente_CPF int,
FOREIGN KEY(Modelo_codMod) REFERENCES Modelo(codMod),
FOREIGN KEY(Cliente_CPF) REFERENCES Cliente(CPF)
);

CREATE TABLE Patio (
num int PRIMARY KEY,
ender varchar(40),
capacidade int
);

CREATE TABLE Estaciona (
cod int,
Patio_num int,
Veiculo_placa varchar(8),
dtEntrada varchar(10),
dtSaida varchar(10),
hsEntrada varchar(10),
hsSaida varchar(10),
FOREIGN KEY(Patio_num) REFERENCES Patio(num),
FOREIGN KEY(Veiculo_placa) REFERENCES Veiculo(placa)
);

-- a) Listar os nomes dos assinantes, seguido dos dados do endereço e os telefones correspondentes:
SELECT Cliente.Nome, Endereco, Telefone FROM Cliente
LEFT OUTER JOIN Endereco ON Cliente.CPF = Endereco.CPF
LEFT OUTER JOIN Telefone ON Cliente.CPF = Telefone.CPF;

-- b) Exiba o CPF e o nome do cliente que possui o veículo de placa “JJJ-2020”:
SELECT Cliente.CPF, Cliente.Nome
FROM Cliente
INNER JOIN Veiculo ON Cliente.CPF = Veiculo.Cliente_CPF
WHERE Veiculo.placa = 'JJJ-2020';

-- c) Exiba a placa e a cor do veículo que possui o código de estacionamento 1:

SELECT Veiculo.placa, Veiculo.cor
FROM Veiculo
INNER JOIN Estaciona ON Veiculo.placa = Estaciona.Veiculo_placa
WHERE Estaciona.cod = 1;

-- d) Exiba a placa e o ano do veículo que possui o código de estacionamento 1:
SELECT Veiculo.placa, Modelo.ano
FROM Veiculo
INNER JOIN Modelo ON Veiculo.Modelo_codMod = Modelo.codMod
INNER JOIN Estaciona ON Veiculo.placa = Estaciona.Veiculo_placa
WHERE Estaciona.cod = 1;

-- e)  Exiba a placa, o ano do veículo e a descrição de seu modelo, se ele possuir ano a partir de 2000:
SELECT Veiculo.placa, Modelo.ano, Modelo.desc;

-- f) Exiba a placa, o ano do veículo e a descrição de seu modelo, se ele possuir ano a partir de 2000.
SELECT Veiculo.placa, Modelo.Desc_2, Veiculo.ano 
FROM Veiculo
INNER JOIN Modelo ON Veiculo.Modelo_codMod = Modelo.codMod 
WHERE Veiculo.ano >= 2000;

-- g) Exiba a quantidade de vezes que os veículos de cor verde estacionaram
SELECT COUNT(*) as num_estacionamentos 
FROM Estaciona
INNER JOIN Veiculo ON Estaciona.Veiculo_placa = Veiculo.placa
WHERE Veiculo.cor = 'verde';

-- h) Liste todos os clientes que possuem carro de modelo1.
SELECT Cliente.Nome 
FROM Cliente 
INNER JOIN Veiculo ON Cliente.CPF = Veiculo.Cliente_CPF 
INNER JOIN Modelo ON Veiculo.Modelo_codMod = Modelo.codMod 
WHERE Modelo.Desc_2 = 'modelo1';

-- i) Liste as placas, os horários de entrada e saída dos veículos de cor verde.
SELECT Veiculo.placa, Estaciona.hsEntrada, Estaciona.hsSaida 
FROM Estaciona
INNER JOIN Veiculo ON Estaciona.Veiculo_placa = Veiculo.placa
WHERE Veiculo.cor = 'verde';

-- j) Liste todos os estacionamentos do veículo de placa “JJJ-2020”.
SELECT * 
FROM Estaciona 
WHERE Veiculo_placa = 'JJJ-2020';

-- k) Exiba o nome do cliente que possui o veículo cujo código do estacionamento é 2.
SELECT Cliente.Nome 
FROM Cliente 
INNER JOIN Veiculo ON Cliente.CPF = Veiculo.Cliente_CPF 
INNER JOIN Estaciona ON Veiculo.placa = Estaciona.Veiculo_placa 
WHERE Estaciona.cod = 2;

-- l) Exiba o CPF do cliente que possui o veículo cujo código do estacionamento é 3.
SELECT Cliente.CPF 
FROM Cliente 
INNER JOIN Veiculo ON Cliente.CPF = Veiculo.Cliente_CPF 
INNER JOIN Estaciona ON Veiculo.placa = Estaciona.Veiculo_placa 
WHERE Estaciona.cod = 3;

-- m) Exiba a descrição do modelo do veículo cujo código do estacionamento é 2.
SELECT Modelo.Desc_2 
FROM Modelo 
INNER JOIN Veiculo ON Modelo.codMod = Veiculo.Modelo_codMod 
INNER JOIN Estaciona ON Veiculo.placa = Estaciona.Veiculo_placa 
WHERE Estaciona.cod = 2;

-- n) Exiba a placa, o nome dos donos e a descrição dos modelos de todos os veículos.
SELECT Veiculo.placa, Cliente.Nome, Modelo.Desc_2 
FROM Veiculo
INNER JOIN Cliente ON Veiculo.Cliente_CPF = Cliente.CPF 
INNER JOIN Modelo ON Veiculo.Modelo_codMod = Modelo.codMod;