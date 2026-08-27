use algonex_1;
CREATE TABLE customer1(
    customer_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (customer_id),
    CONSTRAINT uq_customers_email
        UNIQUE (email)
);
show databases;
insert into customer1(full_name,email)
                  values('Jaswanth','jesh@gmail.com'),
                         ('venu madhav reddy','madhav@gmail.com'),
                         ('varun','varun@gmail.com'),
                         ('Ajay','ajay@gmail.com'),
                         ('paramesh','para@gmail.com'),
                         ('Basappa','basa@gmail.com'),
                         ('Hena','hena@gmail.com'),
                         ('Gayathri','gayii@gmail.com');
select * from customer1;
                         
                         
show tables;