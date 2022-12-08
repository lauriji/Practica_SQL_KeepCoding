---Práctica SQL Laura Jiménez. KC
--------------------------------------------


----Creo un esquema de trabajo

create schema laurajimenez authorization lggmgpev;


---- Car fleet ----


--- Creo car_manufacturer---

create table laurajimenez.car_manufacturer(
	model_id varchar(20) not null, --PK
	manufacturer varchar(100) not null, 
	brand_name varchar(50) not null,
	model_name varchar(100) not null,
	description varchar(512) null
);

alter table laurajimenez.car_manufacturer
add constraint car_manufacturer_PK primary key (model_id);

--- Color codes --- Codificamos colores

create table laurajimenez.color_codes(
	color_id varchar(20) not null, --PK
	name varchar(50) not null, 
	description varchar(512) null
);

alter table laurajimenez.color_codes
add constraint color_codes_PK primary key (color_id);


--- Creo tabla car_fleet ---

create table laurajimenez.car_fleet(
	car_id varchar(10) not null, --PK
	plate_number varchar(10) not null, 
	color_id varchar(20) not null, --FK --  es una FK de la tabla laurajimenez.color_codes de la columna (color_id) 
	model_id varchar(20) not null, --FK --  es una FK de la tabla laurajimenez.car_manufacturer de la columna (model_id) 
	total_km varchar(10) not null, 
	purchase_dt date not null,
	description varchar(512) null
	
);

alter table laurajimenez.car_fleet
add constraint car_fleet_PK primary key (car_id);

alter table laurajimenez.car_fleet
add constraint car_fleet_FK_color_codes foreign key (color_id)
references laurajimenez.color_codes(color_id);

alter table laurajimenez.car_fleet
add constraint car_fleet_FK_car_manufacturer foreign key (model_id)
references laurajimenez.car_manufacturer(model_id);


--- Cargo los datos de la tabla car_manufacturer --- 

insert into laurajimenez.car_manufacturer (model_id, manufacturer, brand_name, model_name, description) values('vga1','Volkswagen group','audi','a1','');
insert into laurajimenez.car_manufacturer (model_id, manufacturer, brand_name, model_name, description) values('tmcty','Toyota motor corporation','Toyota','Yaris','');
insert into laurajimenez.car_manufacturer (model_id, manufacturer, brand_name, model_name, description) values('dmbcls','Daimler','Mercedes-Benz','CLS','');
insert into laurajimenez.car_manufacturer (model_id, manufacturer, brand_name, model_name, description) values('bmwgs1','BMW Group','BMW','Serie 1','');
insert into laurajimenez.car_manufacturer (model_id, manufacturer, brand_name, model_name, description) values('vga3','Volkswagen group','audi','a3','');
insert into laurajimenez.car_manufacturer (model_id, manufacturer, brand_name, model_name, description) values('tmcta','Toyota motor corporation','Toyota','Auris','');
insert into laurajimenez.car_manufacturer (model_id, manufacturer, brand_name, model_name, description) values('dmbcla','Daimler','Mercedes-Benz','CLA','');
insert into laurajimenez.car_manufacturer (model_id, manufacturer, brand_name, model_name, description) values('bmbgs3','BMW Group','BMW','Serie 3','');


select*from laurajimenez.car_manufacturer cm 

--- Cargo datos de la tabla color_codes ---

insert into laurajimenez.color_codes (color_id, name, description) values('001','blanco','');
insert into laurajimenez.color_codes (color_id, name, description) values('002','rojo','');
insert into laurajimenez.color_codes (color_id, name, description) values('003','negro','');
insert into laurajimenez.color_codes (color_id, name, description) values('004','azul','');
insert into laurajimenez.color_codes (color_id, name, description) values('005','gris','');

select*from laurajimenez.color_codes cc 




---- Creo tabla insurance_details ---

create table laurajimenez.insurance_details(
	policy_id varchar(10) not null, --PK
	policy_number varchar (20) not null, 
	insurance_provider varchar(50) not null, 
	start_dt date not null,
	termination_dt date not null,
	description varchar(512) null
	
);

alter table laurajimenez.insurance_details
add constraint insurance_details_PK primary key (policy_id);


---- Creo tabla checkups ----

create table laurajimenez.checkups(
	checkup_id varchar(10) not null, --PK
	checkup_provider varchar (50) not null, 
	description varchar(512) null
	
);

alter table laurajimenez.checkups
add constraint checkups_PK primary key (checkup_id);



---- Creo la tabla currency ---

create table laurajimenez.currency(
	currency_id varchar(20) not null, --PK
	name varchar (50) not null, 
	description varchar(512) null
	
);

alter table laurajimenez.currency
add constraint currency_PK primary key (currency_id);

----- cargo datos tabla car_fleet

insert into laurajimenez.car_fleet(car_id,plate_number,color_id,model_id,total_km,purchase_dt,description) values('101','4910JKL','001','vga1','20102','2022-01-23','Audi a1 del 2022');
insert into laurajimenez.car_fleet(car_id,plate_number,color_id,model_id,total_km,purchase_dt,description) values('102','4927MSP','002','tmcty','35929','2022-04-03','Toyota yaris del 2022');
insert into laurajimenez.car_fleet(car_id,plate_number,color_id,model_id,total_km,purchase_dt,description) values('103','4924FNG','003','dmbcls','12495','2022-05-23','Mercedes-Benz del 2022');
insert into laurajimenez.car_fleet(car_id,plate_number,color_id,model_id,total_km,purchase_dt,description) values('104','2048HWQ','001','bmwgs1','2345','2022-05-23','BMW serie 1 del 2022');
insert into laurajimenez.car_fleet(car_id,plate_number,color_id,model_id,total_km,purchase_dt,description) values('105','0294PWL','002','vga3','9882','2021-12-12','Audi a3 del 2021');
insert into laurajimenez.car_fleet(car_id,plate_number,color_id,model_id,total_km,purchase_dt,description) values('106','4729TYH','003','tmcta','989','2022-10-09','Toyota auris del 2022');
insert into laurajimenez.car_fleet(car_id,plate_number,color_id,model_id,total_km,purchase_dt,description) values('107','8293NHH','004','dmbcla','89391','2020-08-14','CLA Mercedes-Benz del 2020');
insert into laurajimenez.car_fleet(car_id,plate_number,color_id,model_id,total_km,purchase_dt,description) values('108','4029JRT','005','bmbgs3','12125','2022-11-01','Serie 3 del 2022');


---- Creo tablas históricos----

---Histórico insurance--

create table laurajimenez.hist_car_insurance(
	car_id varchar(10) not null, --PK FK
	policy_id varchar(10) not null, --PK FK
	description varchar (512) null 
);

alter table laurajimenez.hist_car_insurance
add constraint hist_car_insurance_PK primary key(car_id,policy_id);


-- FK from car_fleet

alter table laurajimenez.hist_car_insurance
add constraint hist_car_insurance_FK1 foreign key (car_id)
references laurajimenez.car_fleet(car_id);


-- FK from insurance details

alter table laurajimenez.hist_car_insurance
add constraint hist_car_insurance_FK2 foreign key (policy_id)
references laurajimenez.insurance_details(policy_id);


--- Histórico checkups---

create table laurajimenez.hist_car_checkups(
	car_id varchar(10) not null, --PK FK
	checkup_id varchar(10) not null, --PK FK
	checkup_dt date not null,
	checkup_km varchar(10) not null,
	description varchar (512) null 
);

alter table laurajimenez.hist_car_checkups
add constraint hist_car_checkups_PK primary key(car_id,checkup_id);

-- FK from car_fleet

alter table laurajimenez.hist_car_checkups
add constraint hist_car_checkups_FK1 foreign key (car_id)
references laurajimenez.car_fleet(car_id);


-- FK from checkups

alter table laurajimenez.hist_car_checkups
add constraint hist_car_checkups_FK2 foreign key (checkup_id)
references laurajimenez.checkups(checkup_id);




--- Creo histórico cost_checkups

create table laurajimenez.hist_cost_checkups(
	car_id varchar(10) not null, --PK FK
	checkup_id varchar(10) not null, --PK FK
	checkup_cost varchar(10) not null,
	currency_id varchar(20) not null, -- FK
	description varchar (512) null 
);


alter table laurajimenez.hist_cost_checkups
add constraint hist_cost_checkups_PK primary key(car_id,checkup_id);


-- FK from car_fleet

alter table laurajimenez.hist_cost_checkups
add constraint hist_cost_checkups_FK1 foreign key (car_id)
references laurajimenez.car_fleet(car_id);


-- FK from checkups

alter table laurajimenez.hist_cost_checkups
add constraint hist_cost_checkups_FK2 foreign key (checkup_id)
references laurajimenez.checkups(checkup_id);

-- FK from currency

alter table laurajimenez.hist_cost_checkups
add constraint hist_cost_checkups_FK3 foreign key (currency_id)
references laurajimenez.currency(currency_id);


--- Inserto datos en insurance_details ---

insert into laurajimenez.insurance_details (policy_id,policy_number,insurance_provider,start_dt,termination_dt,description) values('234','56432','Allianz','2022-07-22','2023-07-22','');
insert into laurajimenez.insurance_details (policy_id,policy_number,insurance_provider,start_dt,termination_dt,description) values('235','75364','Mapfre','2022-05-02','2023-05-02','');
insert into laurajimenez.insurance_details (policy_id,policy_number,insurance_provider,start_dt,termination_dt,description) values('325','675645','AXA','2022-08-03','2023-08-03','');
insert into laurajimenez.insurance_details (policy_id,policy_number,insurance_provider,start_dt,termination_dt,description) values('534','569878','Génesis','2022-11-02','2023-11-02','');
insert into laurajimenez.insurance_details (policy_id,policy_number,insurance_provider,start_dt,termination_dt,description) values('278','64754','Mutua Madrileña','2021-09-29','2022-09-29','');
insert into laurajimenez.insurance_details (policy_id,policy_number,insurance_provider,start_dt,termination_dt,description) values('523','756345','AXA','2022-11-04','2023-11-04','');
insert into laurajimenez.insurance_details (policy_id,policy_number,insurance_provider,start_dt,termination_dt,description) values('543','45678','Génesis','2020-12-05','2021-12-05','');
insert into laurajimenez.insurance_details (policy_id,policy_number,insurance_provider,start_dt,termination_dt,description) values('421','455678','Mutua Madrileña','2022-04-20','2023-04-20','');
insert into laurajimenez.insurance_details (policy_id,policy_number,insurance_provider,start_dt,termination_dt,description) values('698','568798','Allianz','2021-12-05','2022-12-05','');

select * from laurajimenez.insurance_details

--- Inserto datos en checkups ---

insert into laurajimenez.checkups(checkup_id,checkup_provider,description)values('1000','sala hermanos','APTO');
insert into laurajimenez.checkups(checkup_id,checkup_provider,description)values('1001','grupo marcos','APTO');
insert into laurajimenez.checkups(checkup_id,checkup_provider,description)values('1002','automoviles sl','APTO');
insert into laurajimenez.checkups(checkup_id,checkup_provider,description)values('1003','sala hermanos','APTO');
insert into laurajimenez.checkups(checkup_id,checkup_provider,description)values('1004','grupo marcos','APTO');
insert into laurajimenez.checkups(checkup_id,checkup_provider,description)values('1005','sala hermanos','APTO');
insert into laurajimenez.checkups(checkup_id,checkup_provider,description)values('1006','sala hermanos','APTO');
insert into laurajimenez.checkups(checkup_id,checkup_provider,description)values('1007','sala hermanos','APTO');
insert into laurajimenez.checkups(checkup_id,checkup_provider,description)values('1008','grupo marcos','APTO');
insert into laurajimenez.checkups(checkup_id,checkup_provider,description)values('1009','automoviles sl','APTO');
insert into laurajimenez.checkups(checkup_id,checkup_provider,description)values('1010','automoviles sl','APTO');
insert into laurajimenez.checkups(checkup_id,checkup_provider,description)values('1011','automoviles sl','APTO');
insert into laurajimenez.checkups(checkup_id,checkup_provider,description)values('1012','sala hermanos','APTO');
insert into laurajimenez.checkups(checkup_id,checkup_provider,description)values('1013','sala hermanos','APTO');
insert into laurajimenez.checkups(checkup_id,checkup_provider,description)values('1014','grupo marcos','APTO');
insert into laurajimenez.checkups(checkup_id,checkup_provider,description)values('1015','automoviles sl','APTO');


select * from laurajimenez.checkups c 


--- Inserto datos en currency ---

insert into laurajimenez.currency(currency_id,name,description) values('1','EUR','EURO');
insert into laurajimenez.currency(currency_id,name,description) values('2','USD','American Dólar');
insert into laurajimenez.currency(currency_id,name,description) values('3','GBP','Libra Esterlina');

select * from laurajimenez.currency cu 

--- Inserto datos históricos car_insurance ----

insert into laurajimenez.hist_car_insurance (car_id, policy_id, description) values('101','234','');
insert into laurajimenez.hist_car_insurance (car_id, policy_id, description) values('102','235','');
insert into laurajimenez.hist_car_insurance (car_id, policy_id, description) values('103','325','');
insert into laurajimenez.hist_car_insurance (car_id, policy_id, description) values('104','534','');
insert into laurajimenez.hist_car_insurance (car_id, policy_id, description) values('105','278','');
insert into laurajimenez.hist_car_insurance (car_id, policy_id, description) values('106','523','');
insert into laurajimenez.hist_car_insurance (car_id, policy_id, description) values('107','543','');
insert into laurajimenez.hist_car_insurance (car_id, policy_id, description) values('108','421','');

---Inserto datos histórico checkups ---

insert into laurajimenez.hist_car_checkups (car_id,checkup_id, checkup_dt, checkup_km,description) values('101','1000','2022-07-22','0','');
insert into laurajimenez.hist_car_checkups (car_id,checkup_id, checkup_dt, checkup_km,description) values('102','1001','2022-05-02','0','');
insert into laurajimenez.hist_car_checkups (car_id,checkup_id, checkup_dt, checkup_km,description) values('103','1002','2022-08-03','0','');
insert into laurajimenez.hist_car_checkups (car_id,checkup_id, checkup_dt, checkup_km,description) values('104','1003','2022-11-02','0','');
insert into laurajimenez.hist_car_checkups (car_id,checkup_id, checkup_dt, checkup_km,description) values('105','1004','2021-09-29','0','');
insert into laurajimenez.hist_car_checkups (car_id,checkup_id, checkup_dt, checkup_km,description) values('106','1005','2022-11-04','0','');
insert into laurajimenez.hist_car_checkups (car_id,checkup_id, checkup_dt, checkup_km,description) values('107','1006','2020-12-05','0','');
insert into laurajimenez.hist_car_checkups (car_id,checkup_id, checkup_dt, checkup_km,description) values('108','1007','2022-04-20','0','');
insert into laurajimenez.hist_car_checkups (car_id,checkup_id, checkup_dt, checkup_km,description) values('107','1008','2022-12-08','89391','');
insert into laurajimenez.hist_car_checkups (car_id,checkup_id, checkup_dt, checkup_km,description) values('102','1009','2022-08-10','35929','');
insert into laurajimenez.hist_car_checkups (car_id,checkup_id, checkup_dt, checkup_km,description) values('103','1010','2022-11-11','12495','');
insert into laurajimenez.hist_car_checkups (car_id,checkup_id, checkup_dt, checkup_km,description) values('105','1011','2022-07-16','9882','');
insert into laurajimenez.hist_car_checkups (car_id,checkup_id, checkup_dt, checkup_km,description) values('105','1012','2022-01-07','4941','');
insert into laurajimenez.hist_car_checkups (car_id,checkup_id, checkup_dt, checkup_km,description) values('107','1013','2021-09-20','77391','');
insert into laurajimenez.hist_car_checkups (car_id,checkup_id, checkup_dt, checkup_km,description) values('107','1014','2021-03-15','47391','');
insert into laurajimenez.hist_car_checkups (car_id,checkup_id, checkup_dt, checkup_km,description) values('108','1015','2022-07-29','12125','');

select * from laurajimenez.hist_car_checkups hcc 



---Inserto datos histórico cost ---

insert into laurajimenez.hist_cost_checkups (car_id,checkup_id, checkup_cost,currency_id,description) values('101','1000','0','1','');
insert into laurajimenez.hist_cost_checkups (car_id,checkup_id, checkup_cost,currency_id,description) values('102','1001','0','1','');
insert into laurajimenez.hist_cost_checkups (car_id,checkup_id, checkup_cost,currency_id,description) values('103','1002','0','1','');
insert into laurajimenez.hist_cost_checkups (car_id,checkup_id, checkup_cost,currency_id,description) values('104','1003','0','1','');
insert into laurajimenez.hist_cost_checkups (car_id,checkup_id, checkup_cost,currency_id,description) values('105','1004','0','1','');
insert into laurajimenez.hist_cost_checkups (car_id,checkup_id, checkup_cost,currency_id,description) values('106','1005','0','1','');
insert into laurajimenez.hist_cost_checkups (car_id,checkup_id, checkup_cost,currency_id,description) values('107','1006','0','1','');
insert into laurajimenez.hist_cost_checkups (car_id,checkup_id, checkup_cost,currency_id,description) values('108','1007','0','1','');
insert into laurajimenez.hist_cost_checkups (car_id,checkup_id, checkup_cost,currency_id,description) values('107','1008','229,95','1','Cambio aceite');
insert into laurajimenez.hist_cost_checkups (car_id,checkup_id, checkup_cost,currency_id,description) values('102','1009','229,95','1','Cambio aceite');
insert into laurajimenez.hist_cost_checkups (car_id,checkup_id, checkup_cost,currency_id,description) values('103','1010','289,95','1','Cambio aceite + fitros');
insert into laurajimenez.hist_cost_checkups (car_id,checkup_id, checkup_cost,currency_id,description) values('105','1011','289,95','1','Cambio aceite + fitros');
insert into laurajimenez.hist_cost_checkups (car_id,checkup_id, checkup_cost,currency_id,description) values('105','1012','128,4','1','Patillas freno');
insert into laurajimenez.hist_cost_checkups (car_id,checkup_id, checkup_cost,currency_id,description) values('107','1013','229,95','1','Cambio aceite');
insert into laurajimenez.hist_cost_checkups (car_id,checkup_id, checkup_cost,currency_id,description) values('107','1014','185,43','1','');
insert into laurajimenez.hist_cost_checkups (car_id,checkup_id, checkup_cost,currency_id,description) values('108','1015','435,21','1','cambio radiador');




