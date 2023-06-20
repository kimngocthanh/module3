create database demo;
use demo;

create table products (
id int primary key,
product_code varchar(45),
product_name varchar(45),
product_price double,
product_amount int,
product_description varchar(45),
product_status varchar(45)
);

insert into products
value (1, "pr1", "Sting", 20000, 1, "ok", "ok"),(2, "pr2", "Pepsi", 20000, 2, "okee", "okee");

CREATE UNIQUE INDEX idx_product_code ON products (product_code);
create index idx_pr_name_pr_price on products (product_name, product_price);
explain select *
from products;

CREATE VIEW product_info AS
SELECT product_code, product_name, product_price, product_status
FROM products;
UPDATE products
SET product_name = 'Coca'
WHERE id = 1;
DROP VIEW product_info;


DELIMITER //
CREATE PROCEDURE get_all()
BEGIN
    SELECT *
    FROM products;
END //
DELIMITER ;
call get_all();
DELIMITER //
CREATE PROCEDURE add_product(
in product_code VARCHAR(45),
in product_name VARCHAR(45),
in product_price DOUBLE,
in product_amount int,
in product_description VARCHAR(45),
in product_status VARCHAR(45)
)
BEGIN
    INSERT INTO product (product_code, product_name, product_price,product_amount, product_description, product_status)
    VALUES (new_product_code, new_product_name, new_product_price, new_product_amount, new_product_description,new_product_status);
END //
DELIMITER ;
call add_new_product(3, 'pr3','rock start',50000,5,'okeeee','okeeee');
-- 
delimiter //
CREATE PROCEDURE update_id_product(
in new_id int,
in new_product_status varchar(45)
)
begin
set sql_safe_updates = 0;
update products
set product_status =  new_product_status
where id = new_id;
set sql_safe_updates = 1;
END //
DELIMITER ;
call update_id_product(1,"not oke");
delimiter //
CREATE PROCEDURE delete_id_product(
in new_id int
)
begin
set sql_safe_updates = 0;
delete from products
where id = new_id;
set sql_safe_updates = 1;
END //
DELIMITER ;
call delete_id_product(3)