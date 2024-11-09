-- 1 
SELECT DISTINCT E.employee_id, E.first_name, E.last_name, EE.salary
FROM employee E, employee_event EE
WHERE E.employee_id = EE.employee_id AND (EE.salary BETWEEN 700 AND 1000)
ORDER BY EE.salary DESC;


-- 2
SELECT D.dish_name, M.price
FROM dish D, menu M
WHERE D.menu_id = M.menu_id AND M.menu_id = 305;


-- 3
SELECT menu_id, price
FROM menu M
WHERE EXISTS (SELECT *
              FROM event_ E
              WHERE M.menu_id = E.menu_id
              AND price > 90);
              
              
-- 4
SELECT M.menu_type
FROM order_ O, menu M
WHERE M.menu_id = O.menu_id
GROUP BY M.menu_id
HAVING COUNT(M.menu_id) > 1;


-- 5
SELECT O.customer_id, COUNT(O.order_id) AS order_count
FROM order_ O
GROUP BY O.customer_id
HAVING COUNT(O.order_id) >= 1
ORDER BY order_count DESC;


-- 6
SELECT O.guest_number, O.city, M.menu_type
FROM order_ O, menu M
WHERE O.menu_id = M.menu_id AND MONTH(O.order_date) = 5 
UNION
SELECT O.guest_number, O.city, M.menu_type
FROM order_ O, menu M 
WHERE O.menu_id = M.menu_id AND MONTH(O.order_date) = 8;


-- 7
SELECT E.first_name, E.last_name, BE.backup_employee_id, COUNT(BE.employee_id) AS times_as_backup
FROM backup_employee BE, employee E
WHERE E.employee_id = BE.employee_id
GROUP BY BE.backup_employee_id, E.first_name, E.last_name
HAVING COUNT(BE.employee_id) >= 1
ORDER BY  E.first_name;


-- 8 
SELECT C.customer_id, COUNT(O.order_id) AS num_orders
FROM customer C
LEFT OUTER JOIN order_ O ON C.customer_id = O.customer_id
GROUP BY C.customer_id;


-- 9
SELECT DISTINCT c.first_name, c.last_name
FROM customer c, order_ o, menu m
WHERE c.customer_id = o.customer_id
AND o.menu_id = m.menu_id
AND o.guest_number * m.price > (SELECT AVG(o2.guest_number * m2.price)
								FROM order_ o2, menu m2
								WHERE o2.menu_id = m2.menu_id);
                                
                                
-- 10 
SELECT DISTINCT s.supplier_id, s.first_name
FROM supplier s
JOIN product p ON s.supplier_id = p.supplier_id
WHERE p.price > 100;


-- 11 
SELECT product_id, price
FROM product
WHERE price > (SELECT AVG(price) FROM product);


-- 12
SELECT s.supplier_id, s.first_name, COUNT(p.product_id) AS num_products
FROM supplier s
JOIN product p ON s.supplier_id = p.supplier_id
GROUP BY s.supplier_id;


-- 13
CREATE TABLE seniority 
(employee_id INT PRIMARY KEY,
first_name VARCHAR(45),
last_name VARCHAR(45),
seniority INT
DEFAULT 0);


-- 14   
ALTER TABLE seniority
ADD COLUMN last_update DATETIME DEFAULT CURRENT_TIMESTAMP;
DELIMITER $
CREATE TRIGGER emp_time
BEFORE INSERT ON seniority
FOR EACH ROW
BEGIN 
    SET NEW.last_update = NOW();
END$
DELIMITER ;
INSERT INTO seniority (employee_id, first_name, last_name) 
VALUES 
    (205, 'adir', 'nimni'),
    (206, 'ohad', 'bar');


-- 15  
CREATE TABLE total_price
(order_id INT,
total_price INT);
INSERT INTO total_price(order_id, total_price) 
VALUES (401, 2500),
		(402,18630), 
        (403, 6240),
        (404, 13770),
        (405, 14490),
        (406, 1770),
        (407, 42250),
        (408, 5060),
        (409, 1955),
        (410, 3700),
        (411, 780),
        (412, 2730),
        (413, 10200);
SET SQL_SAFE_UPDATES = 0;
UPDATE total_price
SET total_price = total_price*0.9;


-- 16  
START TRANSACTION;
INSERT INTO seniority (employee_id, first_name, last_name) 
VALUES (201, 'hen','zilber' ),
(203,'eden', 'benita' );
INSERT INTO seniority (employee_id, first_name, last_name, seniority) 
VALUES (202, 'dani', 'cohen', 9),
(204, 'neta','elbaz',13);
COMMIT;