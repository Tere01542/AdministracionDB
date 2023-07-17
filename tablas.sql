
create database sales;
create table product (id int ,product_name varchar(30),price decimal(10,2));
create table client (id_client int, first_name varchar(30), last_name varchar(30), adreess varchar(30), country varchar(50), email varchar(50),
 cellphone varchar(20), telephone varchar(20), job_title varchar(100), gender varchar(30), college varchar(100));
 
 CREATE TABLE product_part1 (CHECK (price >=1.00 and price <=3000)) INHERITS (product);
 CREATE TABLE product_part2 (CHECK (price >=3001 and price <=6000)) INHERITS (product);
 CREATE TABLE product_part3 (CHECK (price >=6001 and price <=9000)) INHERITS (product);
 
 CREATE OR REPLACE RULE insert_product_part1
 AS ON INSERT TO product where (price >=1.00 and price <=3000)
 DO INSTEAD 
 INSERT INTO product_part1 VALUES (NEW.id, NEW.product_name, NEW.price);
 
 CREATE OR REPLACE RULE insert_product_part2
 AS ON INSERT TO product where (price >=3001 and price <=6000)
 DO INSTEAD 
 INSERT INTO product_part2 VALUES (NEW.id, NEW.product_name, NEW.price);
 
 CREATE OR REPLACE RULE insert_product_part3
 AS ON INSERT TO product where (price >=6001 and price <=9000)
 DO INSTEAD 
 INSERT INTO product_part3 VALUES (NEW.id, NEW.product_name, NEW.price);
 
 
 CREATE TABLE client_part1 (CHECK (gender = 'Female')) INHERITS (client);
 CREATE TABLE client_part2 (CHECK (gender = 'Male')) INHERITS (client);
 
 CREATE OR REPLACE RULE insert_client_part1
 AS ON INSERT TO client WHERE (gender = 'Female')
 DO INSTEAD 
 INSERT INTO client_part1 VALUES (NEW.id_client, NEW.first_name, NEW.last_name, NEW.adreess, NEW.country, NEW.email,
 NEW.cellphone, NEW.telephone, NEW.job_title, NEW.gender, NEW.college);
 
 
  CREATE OR REPLACE RULE insert_client_part2
 AS ON INSERT TO client WHERE (gender = 'Male')
 DO INSTEAD 
 INSERT INTO client_part2 VALUES (NEW.id_client, NEW.first_name, NEW.last_name, NEW.adreess, NEW.country, NEW.email,
 NEW.cellphone, NEW.telephone, NEW.job_title, NEW.gender, NEW.college);
 
 
 
