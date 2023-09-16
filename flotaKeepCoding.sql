create schema Practicaflota ;

--creacion de tablas + inserts 

create table Practicaflota.grupoempresarial(
id_grupo varchar(10) primary key not null,
grupo varchar(50)not null
);

insert into Practicaflota.grupoempresarial(id_grupo, grupo) values ('grnm1', 'Grupo Renault-Nissan-Mitsubishi');
insert into Practicaflota.grupoempresarial(id_grupo, grupo) values ('tmc2', 'Toyota motor corporation');
insert into Practicaflota.grupoempresarial(id_grupo, grupo) values ('psa3', 'PSA Peugeot S.A.');
insert into Practicaflota.grupoempresarial(id_grupo, grupo) values ('gm4', 'General Motors');
insert into Practicaflota.grupoempresarial(id_grupo, grupo) values ('fd5', 'Ford');
insert into Practicaflota.grupoempresarial(id_grupo, grupo) values ('bmG6', 'BMW Group');

create table Practicaflota.modelo(
id_modelo varchar(10) primary key not null,
marca varchar(15)not null,
modelo varchar(15)not null,
id_grupo varchar(10) not null,
constraint id_grupo_fk foreign key (id_grupo) references practicaflota.grupoempresarial(id_grupo)
);

insert into Practicaflota.modelo(id_modelo, marca, modelo, id_grupo) values ('m1', 'Nissan', 'micra','grnm1');
insert into Practicaflota.modelo(id_modelo, marca, modelo, id_grupo) values ('c1', 'Toyota','corolla','tmc2');
insert into Practicaflota.modelo(id_modelo, marca, modelo, id_grupo) values ('p3', 'Peugeot','206','psa3');
insert into Practicaflota.modelo(id_modelo, marca, modelo, id_grupo) values ('fs3', 'Ford','Escort','fd5');
insert into Practicaflota.modelo(id_modelo, marca, modelo, id_grupo) values ('rt1', 'Renault', 'Twingo','grnm1');

create table practicaflota.aseguradora(
id_aseguradora varchar(10) primary key not null,
aseguradora varchar(20) not null
);

insert into practicaflota.aseguradora(id_aseguradora, aseguradora)values ('map','Mapfre');
insert into practicaflota.aseguradora(id_aseguradora, aseguradora) values ('mut','Mutua madrileña');
insert into practicaflota.aseguradora(id_aseguradora, aseguradora)values ('all','Allianz');

create table Practicaflota.poliza(
n_poliza INT primary key not null,
id_aseguradora varchar(10) not null,
constraint id_aseguradora_fk foreign key (id_aseguradora) references practicaflota.aseguradora(id_aseguradora),
fecha_alta_seguro DATE not null
);

insert into practicaflota.poliza(id_aseguradora, n_poliza, fecha_alta_seguro) values ('map',123456,'2016-05-05');
insert into practicaflota.poliza(id_aseguradora, n_poliza, fecha_alta_seguro) values ('mut', 654321987,'2014-04-04');
insert into practicaflota.poliza(id_aseguradora, n_poliza, fecha_alta_seguro) values ('mut', 158769987,'2014-04-04');
insert into practicaflota.poliza(id_aseguradora, n_poliza, fecha_alta_seguro) values ('all', 3245,'2014-04-04');
insert into practicaflota.poliza(id_aseguradora, n_poliza, fecha_alta_seguro) values ('map', 987654,'2014-04-04');
insert into practicaflota.poliza(id_aseguradora, n_poliza, fecha_alta_seguro) values ('all', 3985,'2014-04-04');
insert into practicaflota.poliza(id_aseguradora, n_poliza, fecha_alta_seguro) values ('map', 9123454,'2014-04-04');

create table practicaflota.moneda (
id_moneda varchar(3) primary key not null,
moneda varchar(15) not null
);

insert into practicaflota.moneda(id_moneda, moneda) values ('EUR', 'Euro');
insert into practicaflota.moneda(id_moneda, moneda) values ('USD', 'Dolar americano');

create table practicaflota.revision (
id_revision varchar(3) primary key not null,
kms INT not null,
fecha_revision Date not null,
importe INT not null,
id_moneda varchar(3) not null,
constraint moneda_fk foreign KEY(id_moneda) references practicaflota.moneda(id_moneda)
);

insert into practicaflota.revision (id_revision, kms, fecha_revision ,importe, id_moneda) values ('mi1', 45000, '2018-06-06', 180, 'EUR');
insert into practicaflota.revision (id_revision, kms, fecha_revision ,importe, id_moneda) values ('co1', 60000, '2020-09-02', 320, 'USD');
insert into practicaflota.revision (id_revision, kms, fecha_revision ,importe, id_moneda) values ('pt1', 32000, '2021-11-09', 98, 'USD');
insert into practicaflota.revision (id_revision, kms, fecha_revision ,importe, id_moneda) values ('cd1', 100000, '2016-08-27', 1600, 'USD');
insert into practicaflota.revision (id_revision, kms, fecha_revision ,importe, id_moneda) values ('om1', 60000, '2020-09-09', 120, 'EUR');
insert into practicaflota.revision (id_revision, kms, fecha_revision ,importe, id_moneda) values ('pt4', 32000, '2022-11-09', 298, 'EUR');
insert into practicaflota.revision (id_revision, kms, fecha_revision ,importe, id_moneda) values ('cp9', 100000, '2009-08-27', 800, 'USD');


create table practicaflota.vehiculo(
	Matricula VARCHAR(20) primary key not null,
	color VARCHAR(20) not null,
	kms_totales INT not null,
	fecha_compra DATE not null,
	id_modelo varchar(15) not null,
	constraint id_modelo_fk foreign key(id_modelo) references practicaflota.modelo(id_modelo),
	n_poliza INT not null,
	constraint n_poliza_fk foreign key(n_poliza) references practicaflota.poliza(n_poliza),
	id_revision varchar(3) not null,
	constraint id_revision_fk foreign key(id_revision) references practicaflota.revision(id_revision)
);

insert into  practicaflota.vehiculo (matricula, color,kms_totales,fecha_compra,id_modelo,n_poliza,id_revision) values ('7343frt', 'rojo', 120000, '2016-05-03', 'm1', 123456, 'mi1' );
insert into  practicaflota.vehiculo (matricula, color,kms_totales,fecha_compra,id_modelo,n_poliza,id_revision) values ('2438GSV', 'verde', 96000, '2016-05-03', 'c1', 654321987, 'co1' );
insert into  practicaflota.vehiculo (matricula, color,kms_totales,fecha_compra,id_modelo,n_poliza,id_revision) values ('9666FZC', 'azul', 40000, '2016-05-03', 'p3',  158769987, 'pt1' );
insert into  practicaflota.vehiculo (matricula, color,kms_totales,fecha_compra,id_modelo,n_poliza,id_revision) values ('7221BJG', 'negro', 56000, '2016-05-03', 'm1',  3245, 'cd1' );
insert into  practicaflota.vehiculo (matricula, color,kms_totales,fecha_compra,id_modelo,n_poliza,id_revision) values ('6756GXW', 'rojo', 32000, '2016-05-03', 'fs3',  987654, 'om1' );
insert into  practicaflota.vehiculo (matricula, color,kms_totales,fecha_compra,id_modelo,n_poliza,id_revision) values ('7987FXL', 'verde', 40000, '2016-05-03', 'rt1', 3985, 'pt4' );
insert into  practicaflota.vehiculo (matricula, color,kms_totales,fecha_compra,id_modelo,n_poliza,id_revision) values ('3242GQG', 'amarillo', 36984, '2016-05-03', 'm1',  9123454, 'cp9' );


-- QUERY obtener vehiculos activos 

select practicaflota.modelo.modelo, practicaflota.modelo.marca, practicaflota.grupoempresarial.grupo, 
practicaflota.vehiculo.fecha_compra, practicaflota.vehiculo.matricula, practicaflota.vehiculo.color, practicaflota.vehiculo.kms_totales, 
practicaflota.aseguradora.aseguradora, practicaflota.vehiculo.n_poliza  
from practicaflota.vehiculo 
join practicaflota.modelo 
on practicaflota.modelo.id_modelo = practicaflota.vehiculo.id_modelo
join practicaflota.grupoempresarial 
on practicaflota.grupoempresarial.id_grupo = practicaflota.modelo.id_grupo 
join  practicaflota.poliza 
on practicaflota.vehiculo.n_poliza = practicaflota.poliza.n_poliza 
join practicaflota.aseguradora 
on practicaflota.poliza.id_aseguradora = practicaflota.aseguradora.id_aseguradora 
join  practicaflota.revision 
on practicaflota.vehiculo.id_revision  = practicaflota.revision.id_revision


