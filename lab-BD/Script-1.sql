CREATE TABLE DEPARTAMENTS
         (	NUM_DPT INTEGER,
	NOM_DPT CHAR(20),
	PLANTA INTEGER,
	EDIFICI CHAR(30),
	CIUTAT_DPT CHAR(20),
	PRIMARY KEY (NUM_DPT));


CREATE TABLE PROJECTES
         (	NUM_PROJ INTEGER,
	NOM_PROJ CHAR(10),
	PRODUCTE CHAR(20),
	PRESSUPOST INTEGER,
	PRIMARY KEY (NUM_PROJ));

CREATE TABLE EMPLEATS
         (	NUM_EMPL INTEGER,
	NOM_EMPL CHAR(30),
	SOU INTEGER,
	CIUTAT_EMPL CHAR(20),
	NUM_DPT INTEGER,
	NUM_PROJ INTEGER,
	PRIMARY KEY (NUM_EMPL),
	FOREIGN KEY (NUM_DPT) REFERENCES DEPARTAMENTS (NUM_DPT),
	FOREIGN KEY (NUM_PROJ) REFERENCES PROJECTES (NUM_PROJ));

INSERT INTO  DEPARTAMENTS VALUES (5,'VENDES',3,'MUNTANER','MADRID');


INSERT INTO  EMPLEATS VALUES (3,'MANEL',250000,'MADRID',5,null);

select *
from empleats 

select distinct d.NUM_DPT, d.NOM_DPT
from DEPARTAMENTS d, EMPLEATS e
where CIUTAT_DPT = 'MADRID' and e.NUM_DPT = d.NUM_DPT and e.SOU > 200000

INSERT INTO  DEPARTAMENTS VALUES (3,'MARKETING',3,'RIOS ROSAS','BARCELONA');
INSERT INTO PROJECTES VALUEs (
2,'IBDVID','VIDEO',500000);
INSERT INTO  EMPLEATS VALUES (2,'ROBERTO',25000,'BARCELONA',3,2);
select *
from empleats

select *
from departaments

select distinct d.nom_dpt, p.nom_proj
from departaments d, projectes p, empleats e
where e.num_empl = 2 and e.num_dpt = d.num_dpt and e.num_proj = p.num_proj

INSERT INTO  DEPARTAMENTS VALUES (5,'VENDES',3,'MUNTANER','MADRID');

delete from empleats 

select *
from empleats 

delete from departaments 

delete from projectes 

select *
from departaments

INSERT INTO  DEPARTAMENTS VALUES (5,'VENDES',3,'MUNTANER','MADRID');

INSERT INTO  EMPLEATS VALUES (3,'MANEL',250000,'MADRID',5,null);

select *
from empleats

select *
from departaments 

select *
from projectes

select distinct d.num_dpt, d.nom_dpt, AVG(e.sou) as SOU 
from departaments d, empleats e
where d.num_dpt = e.num_dpt
group by d.num_dpt, d.nom_dpt

INSERT INTO  DEPARTAMENTS VALUES (4,'VENDES',3,'MUNTANER','MADRID');

INSERT INTO  EMPLEATS VALUES (2,'fe',220000,'MADRID',5,null);

select distinct d.num_dpt, d.nom_dpt, AVG(e.sou) as SOU 
from departaments d, empleats e
where d.num_dpt = e.num_dpt
group by d.num_dpt, d.nom_dpt

INSERT INTO  DEPARTAMENTS VALUES (4,'VENDES',3,'MUNTANER','MADRID');


delete from empleats

delete from departaments 

INSERT INTO  DEPARTAMENTS VALUES (5,'VENDES',3,'MUNTANER','MADRID');

INSERT INTO  EMPLEATS VALUES (3,'MANEL',250000,'MADRID',5,null);


select distinct d.num_dpt, d.nom_dpt, AVG(e.sou) as SOU 
from departaments d, empleats e
where d.num_dpt = e.num_dpt
group by d.num_dpt, d.nom_dpt
having d.CIUTAT_DPT = 'MADRID'

INSERT INTO  DEPARTAMENTS VALUES (4,'VENDES',3,'MUNTANER','BARCELONA');

INSERT INTO  EMPLEATS VALUES (1,'MANEL',250000,'MADRID',4,null);

select p.num_proj, p.nom_proj
from empleats e, projectes p
where p.num_proj = e.num_proj 
group by p.num_proj 
having count(*) > 1
order by p.num_proj desc

delete 
from projectes


select *
from projectes

INSERT INTO  DEPARTAMENTS VALUES (3,'MARKETING',2,'PAU CLARIS','BARCELONA');

INSERT INTO  EMPLEATS VALUES (3,'ROBERTO',25000,'MADRID',3,null);
INSERT INTO  EMPLEATS VALUES (4,'JOAN',30000,'BARCELONA',3,null);

select distinct nom_empl
from empleats 
where sou >= (select max(sou) from empleats e)
order by nom_empl desc 

INSERT INTO  PROJECTES VALUES (3,'PR1123','TELEVISIO',600000);

INSERT INTO  DEPARTAMENTS VALUES (4,'MARKETING',3,'RIOS ROSAS','BARCELONA');

INSERT INTO  EMPLEATS VALUES (3,'ROBERTO',25000,'MATARO',4,3);

update projectes 
set pressupost = pressupost + 500000
where (select count(*) 
from departaments d, empleats e
where projectes.num_proj = e.num_proj and e.num_dpt = d.num_dpt and d.ciutat_dpt = 'BARCELONA') >= 1

select e.ciutat_empl 
from empleats e, projectes 
where projectes.num_proj = e.num_proj

delete 
from projectes

drop table departaments 

CREATE TABLE DEPARTAMENTS
         (	NUM_DPT INTEGER,
	NOM_DPT CHAR(20),
	PLANTA INTEGER,
	EDIFICI CHAR(30),
	CIUTAT_DPT CHAR(20),
	PRIMARY KEY (NUM_DPT));

CREATE TABLE PROJECTES
         (	NUM_PROJ INTEGER,
	NOM_PROJ CHAR(10),
	PRODUCTE CHAR(20),
	PRESSUPOST INTEGER,
	PRIMARY KEY (NUM_PROJ));

CREATE TABLE EMPLEATS
         (	NUM_EMPL INTEGER,
	NOM_EMPL CHAR(30),
	SOU INTEGER,
	CIUTAT_EMPL CHAR(20),
	NUM_DPT INTEGER,
	NUM_PROJ INTEGER,
	PRIMARY KEY (NUM_EMPL),
	FOREIGN KEY (NUM_DPT) REFERENCES DEPARTAMENTS (NUM_DPT),
	FOREIGN KEY (NUM_PROJ) REFERENCES PROJECTES (NUM_PROJ));

INSERT INTO  DEPARTAMENTS VALUES (3,'MARKETING',3,'RIOS ROSAS','MADRID');

INSERT INTO  PROJECTES VALUES (1,'IBDTEL','TELEVISIO',1000000);

select *
from empleats

select d.num_dpt, d.nom_dpt
from departaments d
where not exists (select * 
 				  from empleats e
 				  where e.num_dpt = d.num_dpt and e.ciutat_empl = 'MADRID')
 				  
 DELETE FROM empleats;
DELETE FROM Projectes;
DELETE FROM departaments;

INSERT INTO  DEPARTAMENTS VALUES (
5,'VENDES',3,'CASTELLANA','MADRID');

INSERT INTO  EMPLEATS VALUES (1,'MANEL',250000,'MADRID',5,null);

INSERT INTO  EMPLEATS VALUES (3,'JOAN',25000,'GIRONA',5,null);

select distinct e.ciutat_empl
from empleats e
where not exists (select *
                  from departaments d
                  where e.ciutat_empl = d.ciutat_dpt);

select e.ciutat_empl
from empleats e
where e.ciutat_empl not in (select d.ciutat_dpt from departaments d)
                 
DELETE FROM empleats;
DELETE FROM departaments;
DELETE FROM projectes;

delete departaments


INSERT INTO DEPARTAMENTS VALUES(3,'MARKETING',1,'EDIFICI1','SABADELL');

INSERT INTO  EMPLEATS VALUES (4,'JOAN',30000,'BARCELONA',3,null);

INSERT INTO  EMPLEATS VALUES (5,'PERE',25000,'BARCELONA',3,null);

select d.num_dpt, d.nom_dpt
from departaments d, empleats e
where d.num_dpt = e.num_dpt
group by d.num_dpt, d.nom_dpt
having count(distinct e.ciutat_empl) > 1


create table VENDES
	(NUM_VENDA INTEGER,
	 NUM_EMPL INTEGER,
	 CLIENT CHAR(30), 
unique(NUM_VENDA, NUM_EMPL),
primary key (NUM_VENDA),
foreign key (NUM_EMPL) references EMPLEATS (NUM_EMPL));
	 
create table PRODUCTES_VENUTS
    (NUM_VENDA INTEGER,
     PRODUCTE CHAR(20) NOTNULL,
     QUANTITAT INTEGER notnull default 1,
     import INTEGER,
primary key (PRODUCTES, NUM_VENDA),
foreign key (NUM_VENDA) references VENDES (NUM_VENDA));

select p.num_proj, p.nom_proj
from projecte p, empleats e
where p.num_proj = e.num_proj 
group by num_proj 
having count(*) > 1
order by p.num_proj desc 

select distinct e.nom_empl
from empleats e
where e.sou = (select MAX(sou)
			   from empleats )
order by nom_empl desc

update projectes 
set pressupost += 500000
where (select count(*)
	   from empleats e, departaments d
	   where projectes.num_proj = e.num_proj and e.num_dpt = d.num_dpt and d.ciutat_dpt = 'BARCELONA')>= 1

select d.num_dpt, d.nom_dpt
from departaments d
where not exists (select * from empleats e
				  where e.num_dpt = d.num_dpt and e.ciutat_empl = 'MADRID')

select distinct e.ciutat_empl
from empleats e
where not exists (select * from departaments d
				  where d.ciutat_dpt = e.ciutat_empl)

select d.num_dpt, d.nom_dpt
from departaments d, empleats e
where d.num_dpt = e.num_dpt 
group by d.num_dpt, d.nom_dpt 
having count(distinct e.ciutat_empl) > 1

create table VENDES
	(NUM_VENDA integer,
	 NUM_EMPL integer not null,
	 CLIENT char(30),
	 primary key (NUM_VENDA)
	 foreign key (NUM_EMPL) references EMPLEATS(NUM_EMPL)
	 unique (NUM_EMPL, CLIENT));
	
create table PRODUCTES_VENUTS
	(NUM_VENDA integer not NULL,
	 PRODUCTE char(20),
	 QUANTITAT integer not null default 1,
	 import integer,
	 primary key (NUM_VENDA, PRODUCTE),
	 foreign key (NUM_VENDA) references VENDES(NUM_VENDA)
	 );
	
drop table projectes 

	create table professors
(dni char(50),
nomProf char(50) unique,
telefon char(15),
sou integer not null check(sou>0),
primary key (dni));

create table despatxos
(modul char(5), 
numero char(5), 
superficie integer not null check(superficie>12),
primary key (modul,numero));

create table assignacions
(dni char(50), 
modul char(5), 
numero char(5), 
instantInici integer, 
instantFi integer,
primary key (dni, modul, numero, instantInici),
foreign key (dni) references professors,
foreign key (modul,numero) references despatxos);

insert into professors values('111','toni','3111',3500);

insert into despatxos values('omega','120',20);

insert into assignacions values('111','omega','120',345,null);

select distinct p.nomProf
from professors p
where ((p.telefon is not null) and (p.sou > 2500)) or ((p.telefon is null) and 
not exists (select *
				  from assignacions a, despatxos d
				  where a.numero = d.numero and a.modul = d.modul and a.dni = p.dni and d.superficie < 20))

DELETE FROM assignacions;
DELETE FROM despatxos;
DELETE FROM professors;

insert into professors values('111','toni','3111',100);

insert into despatxos values('omega','118',16);
insert into despatxos values('omega','120',20);

insert into assignacions values('111','omega','118',109,344);
insert into assignacions values('111','omega','120',345,null);
 
select p.dni as DNI, p.nomProf, max(a.instantFi) as Darrer_instant
from professors p, assignacions a, despatxos d
where p.dni = a.dni and a.numero = d.numero and a.modul = d.modul 
	 and (a.instantFi is not null and d.superficie > 15 and p.sou <= 
	 (select AVG(p.sou)
	  from professors p))
group by p.dni //millor where que having

select p.dni as DNI, p.nomProf, max(a.instantFi) as Darrer_instant
from professors p, assignacions a, despatxos d
where p.dni = a.dni and a.numero = d.numero and a.modul = d.modul 
	 and (a.instantFi is not null and d.superficie > 15)
group by p.dni, p.nomProf
having (p.sou <=(select AVG(p.sou)
	             from professors p))

drop table Assignacions;
drop table Despatxos;
drop table Professors;

create table professors
(dni char(50),
nomProf char(50) unique,
telefon char(15),
sou integer not null check(sou>0),
primary key (dni));

create table despatxos
(modul char(5), 
numero char(5), 
superficie integer not null check(superficie>12),
primary key (modul,numero));

create table assignacions
(dni char(50), 
modul char(5), 
numero char(5), 
instantInici integer, 
instantFi integer,
primary key (dni, modul, numero, instantInici),
foreign key (dni) references professors,
foreign key (modul,numero) references despatxos);

insert into professors values ('485', 'Jiabo', '280', 8000);

insert into despatxos values ('21', '20', 15);
insert into despatxos values ('19', '17', 18);

insert into assignacions values ('485', '21', '20', '51', '101');
insert into assignacions values ('485', '19', '17', '51', '101');
insert into assignacions values ('485', '21', '20', '55', '109');


Select count(*) as quant 
From assignacions ass 
Where ass.instantInici>50 
Group by ass.instantInici 
order by quant; 

delete 
from professors

insert into professors values('222', 'gigi', '828', 300);

insert into assignacions values ('222', '20', '22', 234, 567);


CREATE TABLE DEPARTAMENTS
         (	NUM_DPT INTEGER,
	NOM_DPT CHAR(20),
	PLANTA INTEGER,
	EDIFICI CHAR(30),
	CIUTAT_DPT CHAR(20),
	PRIMARY KEY (NUM_DPT));

CREATE TABLE PROJECTES
         (	NUM_PROJ INTEGER,
	NOM_PROJ CHAR(10),
	PRODUCTE CHAR(20),
	PRESSUPOST INTEGER,
	PRIMARY KEY (NUM_PROJ));

CREATE TABLE EMPLEATS
         (	NUM_EMPL INTEGER,
	NOM_EMPL CHAR(30),
	SOU INTEGER,
	CIUTAT_EMPL CHAR(20),
	NUM_DPT INTEGER,
	NUM_PROJ INTEGER,
	PRIMARY KEY (NUM_EMPL),
	FOREIGN KEY (NUM_DPT) REFERENCES DEPARTAMENTS (NUM_DPT),
	FOREIGN KEY (NUM_PROJ) REFERENCES PROJECTES (NUM_PROJ));

INSERT INTO  DEPARTAMENTS VALUES (5,'VENDES',3,'MUNTANER','MADRID');

INSERT INTO  EMPLEATS VALUES (3,'MANEL',250000,'MADRID',5,null);







