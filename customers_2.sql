create table customers_2 (
     customer_id bigint not null auto_increment,
     full_name varchar(100) not null,
     email varchar(255) not null,
      PRIMARY KEY (customer_id),
    CONSTRAINT uq_customers_email
        UNIQUE (email)
        );



create table orders (
  order_id bigint not null auto_increment,
  order_number varchar(30) not null,
  customer_id bigint not null,
  total_amount decimal(12,2) not null,
  
  primary key(order_id),
  constraint uq_orders_order_number
    UNIQUE(order_number),
    
     constraint fk_orders_customers_2
     foreign key (customer_id)
     references customers_2(customer_id)
     );      
     
insert into customers_2(full_name,email)
                  values('Jaswanth','jesh@gmail.com'),
                         ('venu madhav reddy','madhav@gmail.com'),
                         ('varun','varun@gmail.com');
                         
select * from customers_2;
select * from orders;
  
insert into orders(order_number,customer_id,total_amount)
                  values('23',1,200.0),
                         ('24',2,109.0),
                         ('25',3,234.0);
