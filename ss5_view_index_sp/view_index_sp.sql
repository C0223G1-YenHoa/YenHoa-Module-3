create database demo;
use demo;

create table products(
id int primary key auto_increment,
product_code varchar(50),
product_name varchar(50),
product_price double,
product_amount int,
product_description varchar(255),
product_status varchar(50)
);

insert into products(product_code,product_name,product_price,product_amount,product_description,product_status)
value ("abc123","motobike",12000,12,"chay bang xang","hoat dong tot"),
("def456","bike",10000,10,"chay bang com","het suc hoat dong");

create unique index index_id on products(id);
create index index_name_price on products(product_name,product_price);

explain select * from products where product_amount=12;

create view view_product ( product_code,product_name,product_price) as 
select  product_code,product_name,product_price
from products;

insert into view_product(product_code,product_name,product_price)
value ("fgfjd","car",4000);

drop view view_product;

delimiter //
create procedure display()
begin
select * from products ;
end //
delimiter ;

call display();

delimiter //
create procedure adds(in product_code varchar(50),product_name varchar(50),product_price double,product_amount int,product_description varchar(50),product_status varchar(50))
begin
insert into products(product_code,product_name,product_price,product_amount,product_description,product_status)
value (product_code,product_name,product_price,product_amount,product_description,product_status);
end //
delimiter ;

call adds("likil","fdfdf",65745,43,"dsff","fdfed");


delimiter //
create procedure edit_by_id(in id int, new_name varchar(50))
begin
set sql_safe_updates=0;
update products
set product_name = new_name
where id = id;
set sql_safe_updates=1;
end //
delimiter ;

call edit_by_id(4,"fjdf");

delimiter //
create procedure delete_by_id(in id int)
begin
set sql_safe_updates=0;
delete from products where id=id;
set sql_safe_updates=1;
end //
delimiter ;

call delete_by_id(3);






