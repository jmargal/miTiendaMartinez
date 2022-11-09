CREATE DATABASE tienda;

CREATE USER 'javier'@'%' IDENTIFIED BY 'martinez';
GRANT ALL PRIVILEGES ON tienda.* to 'javier'@'%';

CREATE TABLE tienda.USER (
user_name	varchar(50),
password	varchar(50),
complete_name	varchar(50),
birthday	date,
gender		varchar(50),
admin		varchar(50)
);

ALTER TABLE tienda.USER ADD PRIMARY KEY (user_name);

CREATE TABLE tienda.CATEGORY (
id_cat		int,
name		varchar(30), 
description 	varchar(255)
);

ALTER TABLE tienda.CATEGORY ADD PRIMARY KEY (id_cat);


CREATE TABLE tienda.ARTICLE (
id 		int,
name 		varchar(40),
description 	varchar(255), 
price 		double,
id_cat 		int 
);

ALTER TABLE tienda.ARTICLE ADD PRIMARY KEY (id);
ALTER TABLE tienda.ARTICLE ADD FOREIGN KEY (id_cat) REFERENCES tienda.CATEGORY(id_cat);


CREATE TABLE tienda.BUY(
id_article	int,
user_name	varchar(50),
price 		double,
tienda.buy_date	date 
);

alter table tienda.BUY add constraint pk_tienda.BUY primary key (id_article,user_name);
alter table tienda.BUY add constraint fk_tienda.BUY foreign key (id_article) references tienda.ARTICLE(id);
alter table tienda.BUY add constraint fk_tienda.BUY2 foreign key (user_name) references tienda.USER(user_name);


insert into tienda.USER (user_name, password, complete_name, birthday, gender, admin) values ('ugammon0', MD5('RhPSyNNCwU'), 'Ulises','2022-04-05', 'M', false);
insert into tienda.USER (user_name, password, complete_name, birthday, gender, admin) values ('sandrichuk1', MD5('WVWId7Q'), 'Staci','2022-08-02', 'F', false);
insert into tienda.USER (user_name, password, complete_name, birthday, gender, admin) values ('bstrickett2', MD5('GImdMnQ5If1q'), 'Basilius','2022-07-26', 'M', true);
insert into tienda.USER (user_name, password, complete_name, birthday, gender, admin) values ('smckerlie3', MD5('lBLcrsVD1c'), 'Starlene','2021-12-21', 'F', false);
insert into tienda.USER (user_name, password, complete_name, birthday, gender, admin) values ('ssmithyman4', MD5('H2tJbE'), 'Skipper','2021-12-25', 'M', false);
insert into tienda.USER (user_name, password, complete_name, birthday, gender, admin) values ('lhaukey5', MD5('nMnklCiT'), 'Leonard','2021-12-14', 'M', true);
insert into tienda.USER (user_name, password, complete_name, birthday, gender, admin) values ('gmorratt6', MD5('w85TlGHp'), 'Gaye','2022-03-13', 'F', false);
insert into tienda.USER (user_name, password, complete_name, birthday, gender, admin) values ('gguyonnet7', MD5('OAmJToS'), 'Gale','2022-08-10', 'F', false);
insert into tienda.USER (user_name, password, complete_name, birthday, gender, admin) values ('cfensome8', MD5('pQoh5U36Zy'), 'Concettina','2022-06-18', 'F', true);
insert into tienda.USER (user_name, password, complete_name, birthday, gender, admin) values ('bgilliatt9', MD5('Tq5CMukj'), 'Babara','2022-03-09', 'F', true);
insert into tienda.USER (user_name, password, complete_name, birthday, gender, admin) values ('lstoadea', MD5('iTkrNyEy1PSN'), 'Leshia','2022-06-25', 'F', true);
insert into tienda.USER (user_name, password, complete_name, birthday, gender, admin) values ('kbrameltb', MD5('pCeLS1iNG0Yv'), 'Kacie', '2022-01-19', 'F', false);
insert into tienda.USER (user_name, password, complete_name, birthday, gender, admin) values ('rtreanorc', MD5('6orZIjyye'), 'Roland', '2022-06-26', 'M', false);
insert into tienda.USER (user_name, password, complete_name, birthday, gender, admin) values ('ajeandilloud', MD5('e7BUfD4Y'), 'Ailina',  '2022-02-14', 'F', true);


insert into tienda.CATEGORY (id_cat, name, description) values (1, 'video/x-mpeg', 'Etiam vel augue.');
insert into tienda.CATEGORY (id_cat, name, description) values (2, 'video/msvideo', 'Vestibulum sed magna at nunc commodo placerat.');
insert into tienda.CATEGORY (id_cat, name, description) values (3, 'application/pdf', 'Pellentesque at nulla.');
insert into tienda.CATEGORY (id_cat, name, description) values (4, 'video/x-mpeg', 'Integer tincidunt ante vel ipsum.');
insert into tienda.CATEGORY (id_cat, name, description) values (5, 'application/powerpoint', 'In hac habitasse platea dictumst.');
insert into tienda.CATEGORY (id_cat, name, description) values (6, 'application/powerpoint', 'Nunc rhoncus dui vel sem.');
insert into tienda.CATEGORY (id_cat, name, description) values (7, 'application/x-msexcel', 'Suspendisse ornare consequat lectus.');
insert into tienda.CATEGORY (id_cat, name, description) values (8, 'audio/mpeg3', 'In est risus, auctor sed, tristique in, tempus sit amet, sem.');
insert into tienda.CATEGORY (id_cat, name, description) values (9, 'video/mpeg', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.');
insert into tienda.CATEGORY (id_cat, name, description) values (10, 'application/pdf', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.');
insert into tienda.CATEGORY (id_cat, name, description) values (11, 'video/quicktime', 'Nullam sit amet turpis elementum ligula vehicula consequat.');
insert into tienda.CATEGORY (id_cat, name, description) values (12, 'image/png', 'Nulla justo.');
insert into tienda.CATEGORY (id_cat, name, description) values (13, 'application/mspowerpoint', 'Vestibulum sed magna at nunc commodo placerat.');
insert into tienda.CATEGORY (id_cat, name, description) values (14, 'application/excel', 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.');
insert into tienda.CATEGORY (id_cat, name, description) values (15, 'video/x-msvideo', 'Integer tincidunt ante vel ipsum.');





insert into tienda.ARTICLE (id, name, description, price, id_cat) values (1, 'Prodder', 'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.', 4675.81, 10);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (2, 'Job', 'Aliquam sit amet diam in magna bibendum imperdiet.', 1829.22, 2);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (3, 'Temp', 'Nulla nisl.', 2326.99, 3);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (4, 'Veribet', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', 2330.05, 15);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (5, 'Bytecard', 'Morbi non quam nec dui luctus rutrum.', 3978.58, 2);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (6, 'Asoka', 'Nullam varius.', 2346.95, 8);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (7, 'Home Ing', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', 4275.47, 3);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (8, 'Zoolab', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', 4856.8, 8);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (9, 'It', 'Nam tristique tortor eu pede.', 4643.96, 3);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (10, 'Zoolab', 'Cras pellentesque volutpat dui.', 2618.52, 12);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (11, 'Solarbreeze', 'Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 1429.57, 7);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (12, 'Sonsing', 'In congue.', 3356.68, 5);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (13, 'Domainer', 'Praesent id massa id nisl venenatis lacinia.', 1494.7, 5);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (14, 'Trippledex', 'Phasellus sit amet erat.', 1043.68, 7);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (15, 'Kanlam', 'Aliquam sit amet diam in magna bibendum imperdiet.', 4091.11, 6);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (16, 'Wrapsafe', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 4524.47, 2);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (17, 'Otcom', 'Sed ante.', 2947.82, 15);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (18, 'Flowdesk', 'Quisque porta volutpat erat.', 2395.03, 1);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (19, 'Cookley', 'Nulla ac enim.', 4686.58, 8);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (20, 'Zoolab', 'Mauris sit amet eros.', 1620.71, 6);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (21, 'Temp', 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 3725.9, 8);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (22, 'Treeflex', 'Integer ac leo.', 2020.45, 6);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (23, 'Fintone', 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 4275.08, 2);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (24, 'Cookley', 'Nulla facilisi.', 2557.84, 15);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (25, 'Treeflex', 'Donec posuere metus vitae ipsum.', 3926.46, 10);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (26, 'Hatity', 'Mauris ullamcorper purus sit amet nulla.', 2300.62, 3);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (27, 'Bytecard', 'In hac habitasse platea dictumst.', 1929.77, 8);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (28, 'Treeflex', 'Duis consequat dui nec nisi volutpat eleifend.', 2538.21, 13);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (29, 'Tresom', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.', 4247.6, 5);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (30, 'Ronstring', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', 1803.24, 7);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (31, 'Sub-Ex', 'Morbi ut odio.', 3664.69, 4);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (32, 'Redhold', 'Aliquam non mauris.', 4310.78, 11);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (33, 'Andalax', 'Quisque id justo sit amet sapien dignissim vestibulum.', 1709.17, 9);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (34, 'Zathin', 'Vivamus tortor.', 3680.46, 13);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (35, 'It', 'Ut tellus.', 2758.66, 10);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (36, 'Bamity', 'Morbi non quam nec dui luctus rutrum.', 2670.21, 1);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (37, 'Ventosanzap', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', 4377.12, 10);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (38, 'Matsoft', 'Sed vel enim sit amet nunc viverra dapibus.', 4516.73, 4);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (39, 'Trippledex', 'Sed ante.', 4107.09, 12);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (40, 'Zontrax', 'Mauris ullamcorper purus sit amet nulla.', 3329.91, 8);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (41, 'Zoolab', 'Vestibulum sed magna at nunc commodo placerat.', 3655.33, 6);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (42, 'Zontrax', 'Maecenas ut massa quis augue luctus tincidunt.', 3234.83, 10);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (43, 'Bigtax', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.', 1496.16, 14);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (44, 'Rank', 'Aliquam non mauris.', 2408.37, 7);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (45, 'Toughjoyfax', 'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 3305.7, 15);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (46, 'Fintone', 'In hac habitasse platea dictumst.', 3117.01, 10);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (47, 'Zaam-Dox', 'Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 4620.47, 2);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (48, 'Solarbreeze', 'Phasellus in felis.', 1983.36, 1);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (49, 'Keylex', 'Aliquam non mauris.', 4044.44, 10);
insert into tienda.ARTICLE (id, name, description, price, id_cat) values (50, 'Namfix', 'Aliquam erat volutpat.', 4329.5, 2);