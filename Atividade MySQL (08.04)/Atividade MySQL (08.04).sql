CREATE DATABASE empresa;

USE empresa;

CREATE TABLE Funcionários (
  Código INT PRIMARY KEY,
  PrimeiroNome VARCHAR(50),
  SegundoNome VARCHAR(50),
  UltimoNome VARCHAR(50),
  DataNasci DATE,
  CPF VARCHAR(14),
  RG VARCHAR(20),
  Endereco VARCHAR(100),
  CEP VARCHAR(10),
  Cidade VARCHAR(50),
  Fone VARCHAR(20),
  CodigoDepartamento INT,
  Funcao VARCHAR(50),
  Salario DECIMAL(10,2)
);

INSERT INTO Funcionários VALUES 
  (1, 'João', 'Carlos', 'Silva', '1990-01-01', '111.111.111-11', '111111111', 'Rua A, 123', '00000-000', 'São Paulo', '(11) 1111-1111', 1, 'Gerente', 5000.00),
  (2, 'Maria', 'Fernanda', 'Souza', '1985-02-15', '222.222.222-22', '222222222', 'Rua B, 456', '11111-111', 'Belo Horizonte', '(31) 2222-2222', 2, 'Analista', 3000.00),
  (3, 'Pedro', 'Henrique', 'Mendes', '1995-03-25', '333.333.333-33', '333333333', 'Rua C, 789', '22222-222', 'Rio de Janeiro', '(21) 3333-3333', 3, 'Assistente', 1500.00),
  (4, 'Fernanda', NULL, 'Santos', '1992-04-02', '444.444.444-44', '444444444', 'Rua D, 1010', '33333-333', 'Salvador', '(71) 4444-4444', 1, 'Vendedor', 2000.00),
  (5, 'Lucas', 'Henrique', 'Costa', '1991-05-03', '555.555.555-55', '555555555', 'Rua E, 1212', '44444-444', 'Fortaleza', '(85) 5555-5555', 2, 'Analista', 3500.00),
  (6, 'Aline', NULL, 'Gonçalves', '1997-06-04', '666.666.666-66', '666666666', 'Rua F, 1414', '55555-555', 'Recife', '(81) 6666-6666', 3, 'Assistente', 1600.00),
  (7, 'Rafael', 'Silva', 'Souza', '1988-07-05', '777.777.777-77', '777777777', 'Rua G, 1616', '66666-666', 'Curitiba', '(41) 7777-7777', 1, 'Vendedor', 2500.00),
  (8, 'Maria', 'Silva', 'Pereira', '1995-05-01', '234.567.890-11', '234567890', 'Rua B, 456', '23456-000', 'Rio de Janeiro', '(21) 88888-8888', 1, 'Analista', 3000.00),
  (9, 'Pedro', 'Santos', 'Silva', '1985-12-31', '345.678.901-22', '345678901', 'Rua C, 789', '34567-000', 'Belo Horizonte', '(31) 77777-7777', 2, 'Desenvolvedor', 2500.00),
  (10, 'Lucas', 'Souza', 'Oliveira', '1993-08-15', '456.789.012-33', '456789012', 'Rua D, 012', '45678-000', 'Porto Alegre', '(51) 66666-6666', 2, 'Desenvolvedor', 2800.00),
  (11, 'Ana', 'Lima', 'Rodrigues', '1988-02-28', '567.890.123-44', '567890123', 'Rua E, 345', '56789-000', 'Curitiba', '(41) 55555-5555', 2, 'Analista', 3200.00),
  (12, 'Carlos', 'Silveira', 'Costa', '1991-11-11', '678.901.234-55', '678901234', 'Rua F, 678', '67890-000', 'Fortaleza', '(85) 44444-4444', 3, 'Analista', 2800.00);

-- 1) Listar nome e sobrenome ordenado por sobrenome. 
SELECT PrimeiroNome, UltimoNome FROM Funcionários ORDER BY UltimoNome ASC;

-- 2) Listar todos os campos de funcionários ordenados por cidade.
SELECT * FROM Funcionários ORDER BY Cidade ASC;

-- 3) Listar os funcionários que têm um salário superior a R$1000,00 ordenados pelo nome completo.  
SELECT PrimeiroNome, SegundoNome, UltimoNome FROM Funcionários WHERE Salario >= 1000.00;

-- 4) Listar a data de nascimento e o primeiro nome dos funcionários ordenados do mais novo para o mais velho. 
SELECT DataNasci, PrimeiroNome FROM Funcionários ORDER BY DataNasci DESC;

-- 5) Liste os funcionários como uma lista telefônica, com endereço e cidade.  
SELECT Endereco, Fone, Cidade FROM Funcionários;

-- 6) Liste o nome completo de todos os funcionários que não tenham segundo nome.  
SELECT CONCAT(PrimeiroNome + ' ' + UltimoNome) AS NomeCompleto FROM Funcionários WHERE SegundoNome = NULL;

-- 7) Liste os nomes dos funcionários que moram em Ituiutaba e que exerçam a função de Telefonista.
SELECT PrimeiroNome, SegundoNome, UltimoNome FROM Funcionários WHERE Cidade = 'Ituiutaba' AND Funcao = 'Telefonista';

-- 8)  Liste os nomes dos funcionários que trabalham no departamento 2.  
SELECT PrimeiroNome, SegundoNome, UltimoNome FROM Funcionários AS NomeCompleto WHERE CodigoDepartamento = 2;

-- 9) Liste o nome e o código do departamento de todos os funcionários que ganham mais do que R$ 2000,00.  
SELECT PrimeiroNome, SegundoNome, UltimoNome, CodigoDepartamento FROM Funcionários WHERE Salario >= 2000.00;