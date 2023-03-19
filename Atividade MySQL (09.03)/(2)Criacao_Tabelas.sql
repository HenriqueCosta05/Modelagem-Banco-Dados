show databases;
create database bdvirtual;
use bdvirtual;

create table CadFun (
CODFUN integer not null primary key,
NOME  varchar(40) not null,
DEPTO char(2),
FUNCAO char(20),
SALARIO decimal(10, 2)
);

show tables;
describe CadFun;
describe CadFun CODFUN;