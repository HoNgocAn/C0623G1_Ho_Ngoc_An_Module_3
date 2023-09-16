CREATE DATABASE view_index;

USE view_index;
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_code VARCHAR(50) NOT NULL UNIQUE,
    product_name VARCHAR(50) NOT NULL,
    product_price DOUBLE CHECK (product_price > 0),
    product_amount INT CHECK (product_amount >= 0),
    product_description VARCHAR(256),
    product_status BIT
);

insert into products(product_code,product_name,product_price,product_amount,product_description,product_status)
values
('A1','Áo phong','100000','10','Thoải mái',1),
('A2','Váy nữ','200000','5','Chất lượng tốt',0);

-- Thao tác với index
EXPLAIN SELECT * FROM products WHERE product_name = 'Áo phong'; 
ALTER TABLE products ADD INDEX index_product_code(product_code);
ALTER TABLE products ADD INDEX index_name_price(product_name, product_price);
EXPLAIN SELECT * FROM products WHERE product_name = 'Áo phong'; 

DROP INDEX index_name_price
ON products;

-- Thao tác với VIEW
CREATE VIEW product_views AS
SELECT product_code, product_name, product_price,product_status
FROM  products;

SELECT 
    *
FROM
    product_views;
    
CREATE OR REPLACE VIEW product_views AS
SELECT product_code, product_name, product_price, product_status
FROM products
WHERE product_status = '1';

DROP VIEW product_views;

-- Thao tác với Store Procedure
DELIMITER //

-- Hien thi danh sach
CREATE PROCEDURE findAllProduct()
BEGIN
  SELECT * FROM products;
END //
DELIMITER ;

CALL findAllProduct();

--  Them san pham moi
DELIMITER //
CREATE PROCEDURE addNewProduct(
	product_code VARCHAR(50),
    product_name VARCHAR(50),
    product_price DOUBLE,
    product_amount INT,
    product_description VARCHAR(256),
    product_status BIT)
BEGIN
INSERT INTO products(product_code,product_name,product_price,product_amount,product_description,product_status)
VALUES(product_code,product_name,product_price,product_amount,product_description,product_status);
END //
DELIMITER ;

CALL addNewProduct('A3','Vest','300000','0','Lịch Lãm',1);

-- Update san pham
DELIMITER //
CREATE PROCEDURE editProduct(
	product_id int,
	product_code VARCHAR(50),
    product_name VARCHAR(50),
    product_price DOUBLE,
    product_amount INT,
    product_description VARCHAR(256),
    product_status BIT)
BEGIN
	UPDATE products
    SET
    product_code = product_code,
    product_name = product_name,
    product_price = product_price,
    product_amount = product_amount,
    product_description = product_description,
    product_status = product_status
    WHERE id = product_id;
END //
DELIMITER ;

CALL editProduct('A3','Vest','300000','0','Lịch Lãm',1);

-- Xoa san pham theo id
DELIMITER //
CREATE PROCEDURE deleteProduct(
	product_id int)
BEGIN
	DELETE FROM products
    WHERE id = product_id;
END //
DELIMITER ;

CALL deleteProduct(4);