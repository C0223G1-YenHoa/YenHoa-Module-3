create database quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customer(
c_id int primary key auto_increment,
c_name varchar(25),
c_age int
);

create table ordered(
o_id int primary key auto_increment,
c_id int,
o_date date,
o_total_price double,
foreign key (c_id) references customer(c_id)
);

create table product(
p_id int primary key auto_increment,
p_name varchar(50),
p_price double
);

create table order_detail(
o_id int,
p_id int,
od_qty int ,
primary key (o_id,p_id),
foreign key (o_id) references ordered(o_id),
foreign key (p_id) references product(p_id)
);

insert into customer(c_name,c_age)
value ("Minh Quan",10),
("Ngoc Oanh",20),
("Hong Ha",50);

insert into ordered(c_id,o_date,o_total_price )
value (1,20060321,Null),
(2,20060323,Null),
(1,20060316,Null);

insert into product(p_name,p_price)
value ("May Giat",3),
("Tu lanh",5),
("Dieu hoa",7),
("Quat",1),
("Bep dien",2);

insert into order_detail(o_id,p_id,od_qty)
value (1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

