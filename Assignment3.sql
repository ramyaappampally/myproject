
CREATE TABLE patients_details(
patient_id INT PRIMARY KEY,
patient_name VARCHAR(50) NOT NULL,
age TINYINT,
gender CHAR(1),
department VARCHAR(40),
doctor_name VARCHAR(50),
city VARCHAR(50),
diagnosis VARCHAR(60),
consultation_fee DECIMAL(8,2) DEFAULT 0.00,
admission_date DATE,
is_admitted bit 
);

INSERT INTO [dbo].[patients_details]
(
    patient_id, patient_name, age, gender,
    department, doctor_name, city, diagnosis,
    consultation_fee, admission_date, is_admitted
)
VALUES
(1, 'Arjun', 45, 'M', 'Cardiology', 'Dr. Rao',
 'Vijayawada', 'Hypertension', 800.00, '2026-10-01', 1),

(2, 'Priya', 32, 'F', 'Neurology', 'Dr. Mehta',
 'Guntur', 'Migraine', 1000.00, '2026-10-02', 0),

(3, 'Kiran', 58, 'M', 'Cardiology', 'Dr. Rao',
 'Hyderabad', 'Heart Disease', 1500.00, '2026-10-03', 1),

(4, 'Sravya', 27, 'F', 'Orthopedics', 'Dr. Kumar',
 'Vijayawada', 'Knee Pain', 700.00, '2026-10-04', 0),

(5, 'Ramesh', 64, 'M', 'Orthopedics', 'Dr. Kumar',
 'Guntur', 'Arthritis', 900.00, '2026-10-05', 1),

(6, 'Divya', 39, 'F', 'Neurology', 'Dr. Mehta',
 'Hyderabad', 'Migraine', 1100.00, '2026-10-06', 1),

(7, 'Manoj', 51, 'M', 'General Medicine', 'Dr. Shah',
 'Eluru', 'Diabetes', 600.00, '2026-10-07', 0),

(8, 'Anusha', NULL, 'F', 'General Medicine', 'Dr. Shah',
 'Eluru', 'Fever', 500.00, '2026-10-08', 0),

(9, 'Vamsi', 42, 'M', 'Cardiology', 'Dr. Rao',
 'Guntur', 'Hypertension', 1200.00, '2026-10-09', 1),

(10, 'Keerthi', 35, 'F', 'Orthopedics', 'Dr. Kumar',
 NULL, 'Back Pain', 750.00, '2026-10-10', 0);

---Add a column named room_number with INT data type to the patients table
 ALTER TABLE [dbo].[patients_details]
 ADD room_number int;

 --Modify the doctor_name column so that it can store up to 80 characters.

 ALTER TABLE [dbo].[patients_details]
 ALTER COLUMN doctor_name varchar(80) not null;

select * from [dbo].[patients_details]

--Rename the column room_number to ward_number.
EXEC sp_rename
    'Patients_details.room_number',
    'ward_number',
    'COLUMN';
-- Remove the ward_number column from the patients table.
ALTER TABLE [dbo].[patients_details]
drop column ward_number;
/* Insert a new patient: patient_id 11, patient_name 'Naveen', age 29, gender 'M', department 'Neurology', doctor_name
'Dr. Mehta', city 'Rajahmundry', diagnosis 'Migraine', consultation_fee 950.00, admission_date '2026-10-11', and
is_admitted FALSE.*/

INSERT INTO patients_details
(
    patient_id,
    patient_name,
    age,
    gender,
    department,
    doctor_name,
    city,
    diagnosis,
    consultation_fee,
    admission_date,
    is_admitted
)
VALUES
(
    11,
    'Naveen',
    29,
    'M',
    'Neurology',
    'Dr. Mehta',
    'Rajahmundry',
    'Migraine',
    950.00,
    '2026-10-11',
    0
);

select * from [dbo].[patients_details]
--Update the city of the patient whose patient_id is 4 to 'Hyderabad'.
UPDATE [dbo].[patients_details] 
SET city='Hyderabad'
where patient_id=4;
--Change the consultation_fee of the patient whose patient_id is 7 to 650.00.
UPDATE [dbo].[patients_details]
SET consultation_fee = 650
where patient_id=7;
--Delete the patient whose patient_id is 10
delete from [dbo].[patients_details]
where patient_id=10;

--Display all columns and all records from the patients table.

select * from [dbo].[patients_details]
--. Display the patient_name, age, and department of patients whose age is greater than 40.
select patient_name,age,department from [dbo].[patients_details]
where age >40;
-- Display patients whose consultation_fee is between 700 and 1200, including both limits
select * from [dbo].[patients_details]
where consultation_fee between 700 and 1200;
--Display patients who belong to either the 'Cardiology' or 'Neurology' department.
select * from  [dbo].[patients_details]
where department='Cardiology' or department='Neurology';
--. Display patients whose names start with the letter 'A'.
select * from [dbo].[patients_details]
where patient_name like 'A%';
-- Display each department only once and arrange the department names in alphabetical order.
select department from [dbo].[patients_details]
order by department ASC;
--. Display the absolute value of -75 and the sign of -18.
select ABS(-75);
select ABS(-18);
-- Display 8.2 rounded up to the next whole number and 8.9 rounded down to the previous whole number.
select CEILING(8.2) as result;
select FLOOR(8.9) as result;
--. Display 125.678 rounded to two decimal places and truncated to two decimal places without rounding.
SELECT ROUND(125.678, 2) AS rounded_value;
SELECT ROUND(125.678, 2, 1) AS truncated_value;
-- Find the total number of patients and the average consultation fee.
select COUNT(*) AS total_patients,
AVG(consultation_fee) AS average_consultation_fee
FROM [dbo].[patients_details];
-- Display the highest, lowest, and total consultation fees from the patients table.
SELECT
    MAX(consultation_fee) AS highest_fee,
    MIN(consultation_fee) AS lowest_fee,
    SUM(consultation_fee) AS total_fee
FROM [dbo].[patients_details];

-- Count the number of patients in each department.
select COUNT(*) as total_patients
from [dbo].[patients_details]
--Find the average consultation fee for each department.
select department,
AVG(consultation_fee) AS average_fee 
from [dbo].[patients_details]
GROUP BY department

--. Display departments having more than one patient.
select department,COUNT(*) AS total_patients
from [dbo].[patients_details]
group by department
HAVING COUNT(*) > 1;
--Consider only admitted patients. Group them by department and display departments having more than one admitted patient
select department,count(*) as total_admitted_patients
from [dbo].[patients_details]
WHERE is_admitted = 1
group by department
having  count(*)>1
--25. Consider patients whose age is 40 or above. Group them by department and display only departments whose average consultation fee is greater than 900.
SELECT department,
AVG(consultation_fee) AS average_fee
FROM [dbo].[patients_details]
WHERE age >= 40
GROUP BY department
HAVING AVG(consultation_fee) > 900;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(60) NOT NULL,
    category VARCHAR(40),
    brand VARCHAR(40),
    stock_quantity INT,
    unit_price DECIMAL(8,2) DEFAULT 0.00,
    warehouse_city VARCHAR(50),
    manufacture_date DATE,
    added_at DATETIME,
    is_available bit,
    description TEXT
);

INSERT INTO Products
(
    product_id,
    product_name,
    category,
    brand,
    stock_quantity,
    unit_price,
    warehouse_city,
    manufacture_date,
    added_at,
    is_available,
    description
)
VALUES
(1, 'Wireless Mouse', 'Accessories', 'Logitech', 45, 650.00,
 'Hyderabad', '2025-02-10', '2026-10-01 09:00:00', 1,
 'Wireless computer mouse'),

(2, 'Laptop Stand', 'Accessories', 'Portronics', 30, 899.00,
 'Bengaluru', '2025-01-15', '2026-10-02 09:30:00', 1,
 'Adjustable laptop stand'),

(3, 'USB Keyboard', 'Accessories', 'Dell', 25, 1200.00,
 'Hyderabad', '2024-11-20', '2026-10-03 10:00:00', 1,
 'Wired USB keyboard'),

(4, 'Office Chair', 'Furniture', 'GreenSoul', 12, 5500.00,
 'Chennai', '2025-03-05', '2026-10-04 10:30:00', 1,
 'Ergonomic office chair'),

(5, 'LED Monitor', 'Electronics', 'Samsung', 18, 9200.00,
 'Bengaluru', '2025-04-12', '2026-10-05 11:00:00', 1,
 '24 inch LED monitor'),

(6, 'USB Hub', 'Accessories', NULL, 60, 450.00,
 'Hyderabad', '2024-09-18', '2026-10-06 11:30:00', 1,
 'Four port USB hub'),

(7, 'Study Table', 'Furniture', 'Wakefit', 8, 4200.00,
 NULL, '2025-05-22', '2026-10-07 12:00:00', 0,
 'Wooden study table'),

(8, 'Webcam', 'Electronics', 'Logitech', NULL, 2100.00,
 'Chennai', NULL, '2026-10-08 12:30:00', 1,
 'HD video webcam'),

(9, 'Bluetooth Speaker', 'Electronics', 'JBL', 22, 1800.00,
 'Bengaluru', '2025-06-14', '2026-10-09 13:00:00', 1,
 'Portable Bluetooth speaker'),

(10, 'Desk Lamp', 'Furniture', 'Philips', 35, 750.00,
 'Hyderabad', '2024-12-01', '2026-10-10 13:30:00', 0,
 'LED desk lamp');
select * from [dbo].[products]

--Add a column named supplier_name with VARCHAR(60) data type to the products table.
ALTER TABLE [dbo].[products]
ADD supplier_name varchar(60);
--Create a table named store_demo with store_id as INT PRIMARY KEY, store_name as VARCHAR(50) NOT NULL, and city as VARCHAR(40) with a default value of 'Hyderabad'

CREATE TABLE store_demo
(
    store_id INT PRIMARY KEY,
    store_name VARCHAR(50) NOT NULL,
    city VARCHAR(40) DEFAULT 'Hyderabad'
);

-- Insert a new product with product_id 11, product_name 'Power Bank', category 'Electronics', brand 'Ambrane', stock_quantity 40, unit_price 1499.00, warehouse_city 'Vijayawada', manufacture_date '2025-07-10', added_at '2026-10-11 14:00:00', is_available TRUE, and description 'Portable power bank'.
INSERT INTO Products
(
    product_id,
    product_name,
    category,
    brand,
    stock_quantity,
    unit_price,
    warehouse_city,
    manufacture_date,
    added_at,
    is_available,
    description
)
VALUES
(
    11,
    'Power Bank',
    'Electronics',
    'Ambrane',
    40,
    1499.00,
    'Vijayawada',
    '2025-07-10',
    '2026-10-11 14:00:00',
    1,
    'Portable power bank'
);
select * from [dbo].[products]
-- Change the unit_price of the product whose product_id is 6 to 500.00.
UPDATE  [dbo].[products]
SET unit_price= 500.00
where product_id= 6;
--Display the product name, category, and unit price of all products. Also display products whose brand value has not been provided.
SELECT product_name,category,unit_price
FROM Products
WHERE brand IS NULL;
--Display products that belong to the 'Electronics' category and have a unit price greater than 1500
SELECT *
FROM [dbo].[Products]
WHERE category = 'Electronics'
AND unit_price > 1500;

--Display products whose unit price is between 700 and 5000, including both limits.
select * from [dbo].[products]
where unit_price between 700 and 5000;
--Display products whose names begin with the letter 'W'
select * from [dbo].[products]
where product_name like 'w%'
--Display each category only once and arrange the category names in alphabetical order.
select DISTINCT category from [dbo].[products] 
order by category ASC;

--Display the unit price rounded to the nearest whole number for every product. Also display the total number of products and the average unit price.
SELECT product_name,unit_price,
ROUND(unit_price, 0) AS rounded_price
FROM [dbo].[Products];
SELECT COUNT(*) AS total_products,
AVG(unit_price) AS average_unit_price
FROM [dbo].[Products];
--Display the highest, lowest, and total unit prices from the products table.
select 
MAX(unit_price) AS highest_price,
MIN(unit_price) AS lowest_price,
Sum(unit_price) AS total_unit_price 
from [dbo].[products]
--Count the number of products in each category
SELECT* from [dbo].[products]
SELECT category,COUNT(*) AS total_products 
FROM [dbo].[Products]
GROUP BY category
ORDER BY category ASC;
-- Display categories that contain more than one product.
SELECT category,COUNT(*) as total_product
from [dbo].[products]
GROUP BY category
having count(*)>1;
--Consider only products with stock_quantity greater than 10. Group the remaining products by category and display only categories whose average unit price is greater than 1000.
SELECT category,
AVG(unit_price) AS avg_price
FROM [dbo].[products]
WHERE stock_quantity >= 10
GROUP BY category
HAVING AVG(unit_price) > 1000;

