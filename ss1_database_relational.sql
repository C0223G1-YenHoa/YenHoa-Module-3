create database student_management;
use student_management;

create table Class(
id int primary key auto_increment,
`name` varchar(45)
);

create table Teacher(
id int primary key auto_increment,
`name` varchar(45),
age int,
country varchar(255)
);

select * from Class;
select * from Teacher;

insert into Class (`name`)
value ("Hoa"),("Han");

insert into Teacher (`name`,age,country)
value("Hoa",23,"QN"),("Hung",25,"DN"),("Kiet",28,"Gia Lai");




