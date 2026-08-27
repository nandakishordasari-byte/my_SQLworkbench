use algonex;
CREATE TABLE command_demo (
    record_id INT NOT NULL AUTO_INCREMENT,
    item_name VARCHAR(100) NOT NULL,
    item_status VARCHAR(20) NOT NULL,
    PRIMARY KEY (record_id)
);

-- Step 3: Inspect the table
SHOW TABLES;
DESCRIBE command_demo;
SHOW CREATE TABLE command_demo;

-- Step 4: Insert rows
INSERT INTO command_demo (
    item_name,
    item_status
)
VALUES
    ('Keyboard', 'ACTIVE'),
    ('Mouse', 'ACTIVE'),
    ('Monitor', 'INACTIVE');

-- Step 5: Read rows
SELECT
    record_id,
    item_name,
    item_status
FROM command_demo
ORDER BY record_id;

-- Filter: 
SELECT
    record_id,
    item_name
FROM command_demo
WHERE item_status = 'ACTIVE'
ORDER BY item_name;

-- Step 6: Test rollback
START TRANSACTION;

UPDATE command_demo
SET item_status = 'INACTIVE'
WHERE item_name = 'Mouse';

SELECT
    record_id,
    item_name,
    item_status
FROM command_demo
WHERE item_name = 'Mouse';

ROLLBACK;

-- Verify: SELECT
    record_id,
    item_name,
    item_status
FROM command_demo
WHERE item_name = 'Mouse'; -- The status should return to ACTIVE

-- Step 7: Test commit
START TRANSACTION;

UPDATE command_demo
SET item_status = 'INACTIVE'
WHERE item_name = 'Mouse';

COMMIT;

-- Verify:
SELECT
    record_id,
    item_name,
    item_status
FROM command_demo
WHERE item_name = 'Mouse'; -- Now it should remain INACTIVE

-- Step 8: Test delete and rollback
START TRANSACTION;

DELETE FROM command_demo
WHERE item_name = 'Monitor';

SELECT
    record_id,
    item_name,
    item_status
FROM command_demo
ORDER BY record_id;

ROLLBACK; -- Verify that Monitor returned

-- Step 9: Alter the table
ALTER TABLE command_demo
ADD COLUMN item_notes VARCHAR(255);
select*from command_demo;

DESCRIBE command_demo;

-- Step 10: Inspect a query plan
EXPLAIN
SELECT
    record_id,
    item_name
FROM command_demo
WHERE item_status = 'ACTIVE';
select*from command_demo;