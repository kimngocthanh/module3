drop database if exists ss2_bai2;
create database ss2_bai2;
use ss2_bai2;

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