/*Nome dos integrantes:
Victor Vinicius G. barbosa RA 1700642
Bruno C. Zaccariello RA 1700604
Gabriel Aubert Costa RA 1700382
Leonardo de Melo RA 1700579 
Eduardo Marinho RA 1700158
SI 2B - NOITE
 */

create database locacao;
go
use locacao;
go
create schema aluguel ;
go
create table cliente (
cod_cliente int identity (1,1),
cpf char (14) not null, -- Campo CPF não pode ser nulo, todo cliente deve possuir.
rg char (8) not null, -- Campo RG não pode ser nulo, todo cliente deve possuir.
nome varchar(255) not null, -- Campo Nome não pode ser nulo, todo cliente deve possuir.
data_nasc date not null, -- Campo de data de nascimento não pode ser nulo, todo cliente deve possuir.
email varchar(100) not null, -- Campo email não pode ser nulo, todo cliente deve possuir.
numero_cnh char (11) not null,-- Campo CNH não pode ser nulo, todo cliente deve possuir.
uf char(2) not null, -- Campo UF não pode ser nulo, todo cliente deve informar.
constraint pkcliente primary key (cod_cliente),
constraint uqclientecpf unique (cpf),
constraint uqclienterg unique (rg,uf), 
);

create table tipo_veiculo (
cod_tip_veiculo smallint identity (5,5), 
descricao varchar(75) not null, -- deve ser informada a descrição do veiculo.
constraint pktipo_veiculo primary key (cod_tip_veiculo),

);

create table veiculo (
placa char(7) not null, -- todo veiculo deve possuir o numero da placa.
num_chassi varchar (50) not null, -- todo veiculo deve possuir o numero do chassi.
ano smallint not null, -- todo veiculo deve possuir o ano.
km int not null, -- todo veiculo deve possuir a kilometragem.
data_aqui date not null, -- todo veiculo deve possuir a data de aquisição.
constraint uqveiculonum_chassi unique (num_chassi),
constraint pkveiculo primary key (placa),
constraint fkveiculo foreign key (ano) references tipo_veiculo(cod_tip_veiculo),
);

create table aluga (
num_veiculo char(7) not null, -- todo veiculo tera uma numeração ligada a placa.
data_inicio date not null, -- deve ser informada a data em que o veiculo foi alugado.
data_fim date not null,-- deve ser informada a data em que o veiculo foi devolvido.
Km_inicio int not null, -- deve ser informada a kilometragem inicial.
Km_fim int not null, -- deve ser informada a kilometragem em que o veiculo foi devolvido.

constraint fkaluga foreign key(num_veiculo) 
references veiculo(placa),
);