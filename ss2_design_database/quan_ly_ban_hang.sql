create database quan_ly_ban_hang;
use quan_ly_ban_hang;

create table Customer(
c_id int primary key auto_increment,
c_name varchar(50),
c_age int
);

create table Ordered(
o_id int primary key auto_increment,
c_id int,
o_date date,
o_total_price double,
foreign key (c_id) references Customer(c_id)
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
foreign key (o_id) references Ordered(o_id),
foreign key (p_id) references product(p_id)
);
