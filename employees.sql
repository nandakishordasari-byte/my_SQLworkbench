CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);
insert into employees values(101,'nanda','cse',1234);
insert into employees values(102,'Vishnu','cse',1234),
							(103,'Ajay','ece',234);
select * from employees;
select emp_name from employees where emp_id=102;
select * from employees where salary=1234;
update employees set salary=20000 where emp_name='nanda';
SELECT *
FROM employees
WHERE emp_name = 'nanda';
SET SQL_SAFE_UPDATES = 0;

UPDATE employees
SET salary = 20000
WHERE emp_name = 'nanda';

SET SQL_SAFE_UPDATES = 1;
show tables;
