use algonex;

create table workers (
   worker_id varchar(100),
   full_name varchar(100),
   phone_num varchar(20),
   email varchar(30),
   gender char(6)
   );
   
select * from workers;
insert into workers(worker_id,full_name,phone_num,email,gender)
   values(1,'Nanda kishor',9876543210,'nanda@gmail.com','Male'),
		 (2,'Jaswanth',9876543210,'jash@gmail.com','Male');
         
select*from workers;
#Add a column
alter table workers
Add column phone_num2 varchar(20);
# rename column name
alter table workers
rename column phone_num2 to mobile_num;
# remove a column
alter table workers
drop column mobile_num;
# update:change existing rows
update workers
set full_name='Asha r.rao'
Where worker_id=1;