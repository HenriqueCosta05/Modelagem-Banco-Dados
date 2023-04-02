-- Criação do Banco de Dados e tabela pizza.
create database produtos
default collate utf8_general_ci;
use produtos;

create table pizza (
id_pizza int(11) not null auto_increment,
sabor varchar(100),
quantidade int,
preço decimal(5, 2),
primary key (id_pizza)
) default charset utf8;

-- Inserção de dados na tabela e seleção geral.

insert into pizza values 

(null, 'Mussarela', '11', '22.99'),
(null, 'Calabresa', '10', '25.99'),
(null, 'Portuguesa', '9', '25.99'),
(null, 'Quatro Queijos', '17', '29.99'),
(null, 'Brasileira', '85', '28.99'),
(null, 'Bacon', '22', '28.99'),
(null, 'Frango com Cheddar', '8', '24.99'),
(null, 'Frango com Catupiry', '33', '24.99'),
(null, 'Atum', '45', '22.99'),
(null, 'Aliche', '10', '19.99'),
(null, 'Baiana', '42', '28.99');

select * from pizza;

-- Funções de Agregação:

-- 1. Para saber o valor da pizza mais cara.
select max(preço) from pizza;

-- 2. Para saber o valor da pizza mais barata.
select min(preço) from pizza;

-- 3. Para saber a média dos preços das pizzas.
select avg(preço) from pizza;

-- 4. Quantas pizzas estão cadastradas na tabela?
select count(*) from pizza;

-- 5. Qual a quantidade de pizzas que foi mais vendida no mês passado?
select max(quantidade) from pizza;

-- 6.  Qual a quantidade de pizzas menos vendidas no mês passado?
select min(quantidade) from pizza;





