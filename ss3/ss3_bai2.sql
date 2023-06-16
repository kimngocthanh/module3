create database ss3_bai2;
use ss3_bai2;

create table customer (
customer_id int primary key,
customer_name varchar(45),
customer_age int
);

create table orderr (
orderr_id int primary key,
customer_id int,
orderr_date date,
orderr_total_price double,
foreign key (customer_id) references customer (customer_id)
);

create table product (
product_id int primary key,
product_name varchar(45),
product_price double
);

create table orderr_detail (
orderr_id int,
product_id int,
orderr_qty varchar(45),
primary key(orderr_id,product_id),
foreign key (orderr_id) references orderr(orderr_id),
foreign key (product_id) references product(product_id)
);

insert into customer
value (1,"Minh Quan", 10), (2,"Ngoc Oanh",20), (3,"Hong Ha",50);

insert into orderr 
values (1,1,'2006-03-21',null),(2,2,'2006-03-23',null),(3,1,'2006-03-16',null);

insert into product 
value (1,"Máy Giặt",3),(2,"tủ lạnh",5),(3,"điếu hoà",7),(4,"quat",1),(5,"bep dien",2);

insert into orderr_detail
value (1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);

select orderr_id, orderr_date,orderr_total_price
from orderr;

select *
from customer 
join orderr on customer.customer_id = orderr.customer_id;

select customer.customer_name, product.product_name
from product
join orderr_detail on product.product_id = orderr_detail.product_id
join orderr on orderr_detail.orderr_id = orderr.orderr_id
join customer on customer.customer_id = orderr.orderr_id;

select *
from customer 
left join orderr on customer.customer_id = orderr.customer_id
where orderr.orderr_id is null;

select orderr.orderr_id, orderr.orderr_date,  orderr_detail.orderr_qty*product.product_price as total
from orderr_detail
join product on orderr_detail.product_id = product.product_id
join orderr on orderr_detail.orderr_id = orderr.orderr_id;






