create database demo;
use demo;

create table users (
 id  int NOT NULL AUTO_INCREMENT,
 `name` varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);

insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Hoa','hoa@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Haan','han@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');

delimiter //
create procedure display_all()
begin 
select * from users;
end //
delimiter ;

call display_all();


delimiter //
create procedure update_user(new_id int,new_name varchar(50),email varchar(50),country varchar(50))
begin 
set sql_safe_updates=0;
update users set name = new_name , email= email, country = country where id = new_id;
set sql_safe_updates=1;
end //
delimiter ;

call update_user(6,"hoa","hoa@gmail.com","VN");

delimiter //
create procedure delete_user(id_delete int)
begin 
set sql_safe_updates=0;
delete from users where id = id_delete;
set sql_safe_updates=1;
end //
delimiter ;

call delete_user(5);