CREATE TABLE orders0 (
    order_id BIGINT PRIMARY KEY,
    customer_id BIGINT,
    total_amount DECIMAL(10,2),
    status VARCHAR(30)
);

CREATE TABLE order_audit (
    audit_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT,
    action_type VARCHAR(30),
    action_time DATETIME
);


DELIMITER //

CREATE TRIGGER after_order_inserts
AFTER INSERT ON orders0
FOR EACH ROW
BEGIN

    INSERT INTO order_audit (order_id, action_type,action_time)
    VALUES (NEW.order_id,'ORDER_CREATED',CURRENT_TIMESTAMP);
END //
DELIMITER ;

INSERT INTO orders0 (order_id, customer_id, total_amount, status)
VALUES (1001, 101, 599.00, 'PLACED');
select *from orders0;
select *from order_audit;