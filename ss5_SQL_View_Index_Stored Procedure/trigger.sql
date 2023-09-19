CREATE DATABASE Company;
USE company;
CREATE TABLE employees(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
department VARCHAR(50) NOT NULL,
salary DECIMAL(10,2) NOT NULL);

DELIMITER //
CREATE TRIGGER update_department
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN 
	IF NEW.salary>=5000 THEN
		SET new.department = "Management";
    ELSEIF NEW.salary >= 3000 THEN
		SET new.department = "Sales";
    ELSE 
		SET new.department = "Supprt";
    END IF;
END //
DELIMITER ;

INSERT INTO employees (name, department, salary)
VALUES ("Join Doe","A", 3500),("Jane Smith", "A","2000"),("David Johnson","A",6000);

SELECT * FROM employees;

