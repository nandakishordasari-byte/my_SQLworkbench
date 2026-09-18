/* Amazon-like system
customers(customer_id, name)
orders(order_id, customer_id, amount, order_date)
employees(employee_id, name, department_id, salary)
departments(department_id, department_name, location)

-- Solve this 10 problems
Employees earning above company average
Employees earning above their department average
Customers who have placed at least one order
Customers who have never placed an order
Customers whose total order amount is above the average customer order amount
Employees belonging to Bengaluru departments
Employees earning more than every employee in department 10
Employees earning more than at least one employee in department 10
Departments whose average salary is greater than company average salary
Find customers whose latest order amount is greater than their own average order amount */

use algonex_1;
create table customers2 (
     customer_id bigint primary key auto_increment ,
     customer_name varchar(50)
     );
     
create table orders1 (
         order_id bigint primary key ,
         customer_id bigint,
         amount bigint, 
         order_date DATETIME);
         
INSERT INTO customers2 VALUES (101,'Nanda'),
                             (102,'kishor'),
                             (103,'raju'),
                             (104,'somu'),
                             (105,'krishna');
                             
select* from customers2;

INSERT INTO orders1 VALUES (21,101,2000,'2026-01-15 10:30:00'),
                           (22,102,3000,'2026-03-22 14:45:30'),
                           (23,103,3500,'2026-05-10 09:15:20'),
                           (24,104,1800,'2026-07-18 18:20:45'),
                           (25,105,5300,'2026-09-18 21:35:10');
                           
select* from orders1;
-- Customers who have placed at least one order
SELECT *
FROM customers2 AS c
WHERE  EXISTS (
    SELECT 1
    FROM orders1 AS o
    WHERE o.customer_id = c.customer_id
);
-- Customers who have never placed an order
SELECT *
FROM customers2 AS c
WHERE  not EXISTS (
    SELECT 1
    FROM orders1 AS o
    WHERE o.customer_id = c.customer_id
);
-- Customers whose total order amount is above the average customer order amount
SELECT c.customer_id,
       c.customer_name,
       SUM(o.amount) AS total_amount
FROM customers2 AS c
JOIN orders1 AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.amount) > (
    SELECT AVG(total_amount)
    FROM (
        SELECT SUM(amount) AS total_amount
        FROM orders1
        GROUP BY customer_id
    ) AS customer_totals
);
-- Find customers whose latest order amount is greater than their own average order amount
INSERT INTO orders1 VALUES
(26,101,5000,'2026-09-20 10:00:00'),
(27,102,2000,'2026-09-21 11:00:00');
SELECT c.customer_id, c.customer_name, o.amount AS latest_amount
FROM customers2 c
JOIN orders1 o
    ON c.customer_id = o.customer_id
WHERE o.order_date = (
    SELECT MAX(o2.order_date)
    FROM orders1 o2
    WHERE o2.customer_id = c.customer_id
)
AND o.amount > (
    SELECT AVG(o3.amount)
    FROM orders1 o3
    WHERE o3.customer_id = c.customer_id
);
-- 