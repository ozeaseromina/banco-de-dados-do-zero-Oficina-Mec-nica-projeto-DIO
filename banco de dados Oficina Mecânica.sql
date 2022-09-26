-- criando um banco de dados do zero, cenário de oficina mecânica
create database Mecânica;
use Mecânica;

-- criar tabela Cliente
drop table client;
create table client(
	idClient int auto_increment primary key,
    Nome varchar(300) not null,
    CPF char(11) not null,
    telephone varchar(11) not null,
    Address varchar(300) not null,
    vehicle varchar(8),
    constraint unique_CPF unique (CPF)
);

desc client;

-- criar tabela Veículo

create table vehicle(
	idVehicle int auto_increment primary key,
    identification_vehicle varchar(20)not null,
    idClient int,
    brand varchar(15),
    model varchar(15),
    vehicle_color integer not null,
    constraint fk_vehicle_client foreign key (idClient) references client(idClient)
);

desc vehicle;

-- criar tabela Mecânicos
drop table mechanics;
create table Mechanics(
	idMechanics int,
    Mechanical_Code int not null,
    Nome varchar(45)not null,
    Address varchar(45)not null,
    Specialty varchar(45),
    mechanics_team int
);

desc Mechanics;

drop table Mechanics_team;
-- equipe de mecânicos
create table Mechanics_team(
	mechanics_team int auto_increment primary key,
    services varchar(45) not null,
    constraint fk_mechanics_mechanics_team foreign key (mechanics) references Mechanics_team(idmechanics_team)
);

desc mechanics_team;

-- Tabela de peças
create table Pieces(
	idPieces int auto_increment primary key,
    foreign key (Mechanics_team) references Mechanics_team(idMechanics_team),
    constraint fk_repair_vericle foreign key (idVericle) references vericle(idVericle),
    constraint fk_repair_mao foreign key (idLabor) references labor(idLabor),
    constraint fk_repair_parts foreign key (idvalueParts) references valueParts(idValueParts)
);

create table authorizeDeny(
idAuthorizeDeny int auto_increment primary key,
    authorization varchar(45),
    negation varchar(45),
    dateResponse date not null,
    customerid int,
    idVehicle int,
    idMechanicsTeam int,
    constraint fk_authorizenegar_cliente foreign key (idClient) references client(idClient),
    constraint fk_authorizarnegar_veiculo foreign key (idVehicle) references vehicle(idVehiculo),
    constraint fk_authorizarnegar_equipe foreign key (idMechanics_Team) references Mechanics_Team(idMechanics_Team)
);


create table autorizado(
	idAutorizado int auto_increment primary key,
    dataconclusao varchar(45) not null,
    osautorizada int not null,
    dataosautorizada varchar(45) not null,
    statusosautorizada varchar(45) not null,
    idEquipeMecanicos int,
    idAutorizarNegar int,
    idCliente int,
    idVeiculo int,
    constraint fk_autorizado_equipe foreign key (idEquipeMecanicos) references equipeMecanicos(idEquipeMecanicos),
    constraint fk_autorizado_id foreign key (idAutorizarNegar) references autorizarNegar(idAutorizarNegar),
    constraint fk_autorizado_cliente foreign key (idCliente) references cliente(idCliente),
    constraint fk_autorizado_veiculo foreign key (idVeiculo) references veiculo(idVeiculo)
);


insert into cliente(Nome, CPF, Telefone, Endereco) values,
insert into cliente values (0001,'Marcelo Cruz','Rua Brasil, 35','Jundiaí',13124579,'SP','7464563762','53425364');
insert into cliente values (0002,'Jose da Silva'       ,'Rua Argentina, 23'             ,'Buenos Aires'   ,45876548,'TY','4587412637','452145285');
insert into cliente values (0003,'Mia Bini'            ,'Alameda cavalcante, 12'        ,'Pindamonhangaba',45269887,'SP','1542845798','687286464');
insert into cliente values (0004,'Nelson Nerd'         ,'Rua das Torres, 750'           ,'Araraquara'     ,25412563,'SP','654987985','984651698');
insert into cliente values (0005,'Rogério Silva'       ,'Avenida Castro Alves, 5500'    ,'Queluz'         ,68416845,'ES','0654987878','984165494');
insert into veiculo(Identificacao_veiculo, idCliente) values
	('0123456789','1'),
    ('1234567890','2'),
    ('2345678901','3');

insert into equipeMecanicos(servico) values
	('servico1'),
    ('servico2'),
    ('servico3');

insert into mecanico(CodigoMecanico, Nome, Endereco, Especialidade, EquipeMecanico) values
	('1','mecanico1','Rua a','especialidade1','1'),
    ('2','mecanico2','Rua b','especialidade2','2'),
    ('3','mecanico3','Rua c','especialidade3','3');

insert into valuesParts(valuesParts) values
	('100,00');

    insert into handWork(ValuesHandWork) values('150.00');
    
insert into fixRevision (os, dateOs, valueOs, statusOs, daysExecution) values
('999',20220101,'250.00','In progress','5 days');

insert into authorizedostodeny(authorizedos, denial, dateanswer) values
	('yes',null,'20220102'),
    (null,'yes','20220103');
    
insert into authorized(completiondate, authorizedos, osauthorizeddate, authorizedstatus) values
('20220104','0147','20220105','Completed');

-- queries
select * from client;
select count(*) from client;

select * from client c,vehicle v where c.idClient=v.idClient;

select Nome,Telephone,idVehicle from client c,vehicle v where c.idClient=v.idClient group by idVehicle;