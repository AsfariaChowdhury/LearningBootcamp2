CREATE TABLE employee(
	emp_id INT PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    birth_day DATE,
    sex VARCHAR(5),
    salary INT,
    manager_id INT,
    branch_id INT
);

CREATE TABLE branch(
	branch_id INT PRIMARY KEY,
    branch_name VARCHAR(40),
    mgr_id INT,
    mgr_start_date DATE,
    FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

-- 11/06/2021
ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(manager_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

CREATE TABLE client(
	client_id INT PRIMARY KEY,
    client_name VARCHAR(40),
    branch_id INT,
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE product(
	branch_id INT,
    client_id INT,
    quantity INT,
    product_name VARCHAR(80),
    PRIMARY KEY(branch_id, client_id),
    FOREIGN KEY(branch_id) REFERENCES client(branch_id) ON DELETE CASCADE,
    FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

-- DROP TABLE product;

-- Gulshan 1
INSERT INTO employee VALUES(100, 'Muhammad', 'Kabir', '1999-10-18', 'M', 13000, NULL, NULL);

INSERT INTO branch VALUES(1, 'Gulshan 1', 100, '2016-05-25');

UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;

-- UPDATE employee
-- SET manager_id = 107
-- WHERE emp_id = 100;

-- SELECT * FROM employee;
INSERT INTO employee VALUES(101, 'Karim', 'Uddin', '1998-07-12', 'M', 12000, 100, 1);
INSERT INTO employee VALUES(102, 'Jamal', 'Rahul', '1999-04-16', 'M', 12000, 100, 1);
INSERT INTO employee VALUES(103, 'Rina', 'Ahmed', '2001-04-26', 'F', 11000, 100, 1);
INSERT INTO employee VALUES(107, 'Tahsina', 'Islam', '1996-08-02', 'F', 15000, NULL, 1);

UPDATE employee
SET manager_id = 107
WHERE emp_id = 100;

-- Gulshan 2
INSERT INTO employee VALUES(105, 'Tahmid', 'Hossain', '1995-10-01', 'M', 14000, 107, NULL);

INSERT INTO branch VALUES(2, 'Gulshan 2', 105, '2015-08-05');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 105;

INSERT INTO employee VALUES(104, 'Mina', 'Tuhin', '2000-04-02', 'F', 11000, 105, 2);
INSERT INTO employee VALUES(106, 'Mohsin', 'Salman', '2000-10-23', 'M', 11000, 105, 2);
INSERT INTO employee VALUES(108, 'Sabrina', 'Suhayla', '2003-03-03', 'F', 10000, 105, 2);

select * from employee;
select * from branch;

INSERT INTO client VALUES(500, 'Kazi Properties', 1);
INSERT INTO client VALUES(501, 'Happy Shop', 1);
INSERT INTO client VALUES(502, 'Maisha Styles', 1);
INSERT INTO client VALUES(503, 'Trendy Salon', 1);
INSERT INTO client VALUES(504, 'Scented Candles', 2);
INSERT INTO client VALUES(505, 'Hussain Cafe', 2);
INSERT INTO client VALUES(506, 'Aspire College', 2);

select * from client;

INSERT INTO product VALUES(1, 500, 5, 'paper (500 pp/bundle)');
INSERT INTO product VALUES(1, 501, 10, 'paper clips (300/box)');
INSERT INTO product VALUES(1, 502, 15, 'notepad');
INSERT INTO product VALUES(1, 503, 6, 'stapler');
INSERT INTO product VALUES(2, 504, 5, 'pens (10/pack)');
INSERT INTO product VALUES(2, 505, 11, 'books');
INSERT INTO product VALUES(2, 506, 203, 'textbooks');

select * from product;

-- DEMONSTRATION, of functions
-- find all employees ordered by salary, descending
SELECT * FROM employee
ORDER BY salary DESC;

-- find the average of all employees salary
SELECT AVG(salary);

-- find the total amount the book shop has to pay to its employees
-- find the sum of employees salaries
SELECT SUM(salary)
FROM employee;

-- find the total quantity of all products sold, arranged per branch
SELECT SUM(quantity), branch_id
FROM product
GROUP BY branch_id;

-- DEMONSTRATION, of wildcards
-- find all clients who are salons
SELECT *
FROM client
WHERE client_name LIKE '%Salon';

-- find the cliet id to whom stapler was sold
SELECT client_id
FROM product
WHERE product_name LIKE '%stapler';