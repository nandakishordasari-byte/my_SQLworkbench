CREATE TABLE Algonex_Crew (
    crew_id BIGINT ,
    Roll_num varchar(100),
    full_name VARCHAR(100),
    email VARCHAR(255),
    phone VARCHAR(20),
    created_at TIMESTAMP
);
SHOW TABLES;
INSERT INTO algonex_crew VALUES (101,'228p1a0556','Nanda','nanda@gmail.com',8765432109,'2026-08-17 23:05:00'),
								(102,'228p1a0557','kishor','kishor@gmail.com',9876543210,'2026-08-17 23:15:00'),
                                (103,'228p1a0558','Ajay','ajay@gmail.com',7654321098,'2026-08-17 23:25:00'),
                                (104,'228p1a0559','Vishnu','vishnu@gmail.com',8008940874,'2026-08-17 23:05:00'),
                                (105,'228p1a0560','Diwaker','diwaker@gmail.com',8008940874,'2026-08-17 23:05:00'),
                                (106,'228p1a0561','Naveen','naveen@gmail.com',8008940874,'2026-08-17 23:05:00'),
                                (107,'228p1a0562','Mani','mani@gmail.com',8008940874,'2026-08-17 23:05:00'),
                                (108,'228p1a0563','Madhu','madhu@gmail.com',8008940874,'2026-08-17 23:05:00'),
                                (109,'228p1a0564','Govardhan','govardhan@gmail.com',8008940874,'2026-08-17 23:05:00'),
                                (110,'228p1a0565','Manohar','peram@gmail.com',8008940874,'2026-08-17 23:05:00'),
                                (111,'228p1a0566','Tahir','tahir@gmail.com',8008940874,'2026-08-17 23:05:00'),
                                (112,'228p1a0567','Chandhra','chandhra@gmail.com',8008940874,'2026-08-17 23:05:00'),
                                (113,'228p1a0568','Mohan','mohan@gmail.com',8008940874,'2026-08-17 23:05:00'),
                                (114,'228p1a0569','Narendhra','nari@gmail.com',8008940874,'2026-08-17 23:05:00');
show tables;             
select* from Algonex_Crew;
-- Add a column
alter table Algonex_Crew
Add column city varchar(20);
-- rename column name
alter table Algonex_Crew
rename column phone to mobile_num;
-- remove a column
alter table Algonex_Crew
drop column city;
select 
      crew_id,
      full_name,
      mobile_num
from Algonex_Crew;      
-- filter with where
select
      crew_id,
      full_name,
      mobile_num
from Algonex_Crew
where mobile_num=9876543210;
select*from Algonex_Crew;   
-- GROUP BR
select
     email,
     count(*) as mobile_num
from algonex_crew
group by email;     
-- SHOW INDEX
SHOW INDEX FROM algonex_crew;
-- EXPLAN
explain select 
   crew_id,full_name
FROM algonex_crew
where email='nanda@gmail.com';
-- clauses & constraints
select*FROM algonex_crew
where crew_id>10;
            
