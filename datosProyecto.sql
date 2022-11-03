CREATE DATABASE tienda;

CREATE USER 'javier'@'%' IDENTIFIED BY 'martinez';
GRANT ALL PRIVILEGES ON tienda.* to 'javier'@'%';

CREATE TABLE USER (
user_name	varchar(50),
description	varchar(50),
complete_name	varchar(50),
birthday	date,
gender		varchar(50),
admin		varchar(50)
);

ALTER TABLE USER ADD PRIMARY KEY (user_name);

CREATE TABLE CATEGORY (
id_cat		int,
name		varchar(30), 
description varchar(255)
);

ALTER TABLE CATEGORY ADD PRIMARY KEY (id_cat);


CREATE TABLE ARTICLE (
id 		int,
name 		varchar(40),
description 	varchar(255), 
price 		double,
id_cat 		int 
);

ALTER TABLE ARTICLE ADD PRIMARY KEY (id);
ALTER TABLE ARTICLE ADD FOREIGN KEY (id_cat) REFERENCES CATEGORY(id_cat);



