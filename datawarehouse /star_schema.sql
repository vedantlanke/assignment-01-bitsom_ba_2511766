-- =========================
-- DIMENSION TABLES
-- =========================

CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,
    full_date DATE,
    month INT,
    month_name VARCHAR(15),
    quarter INT,
    year INT
);

CREATE TABLE dim_store (
    store_key INT PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE dim_product (
    product_key INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(30)
);

-- =========================
-- FACT TABLE
-- =========================

CREATE TABLE fact_sales (
    sales_key INT PRIMARY KEY,
    date_key INT,
    store_key INT,
    product_key INT,
    units_sold INT,
    unit_price DECIMAL(12,2),
    total_amount DECIMAL(14,2),

    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (store_key) REFERENCES dim_store(store_key),
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key)
);

-- =========================
-- CLEANED DIM DATA
-- =========================

-- Dates standardized to YYYY-MM-DD

INSERT INTO dim_date VALUES
(20230118,'2023-01-18',1,'January',1,2023),
(20230115,'2023-01-15',1,'January',1,2023),
(20230205,'2023-02-05',2,'February',1,2023),
(20230220,'2023-02-20',2,'February',1,2023),
(20230331,'2023-03-31',3,'March',1,2023),
(20230428,'2023-04-28',4,'April',2,2023),
(20230521,'2023-05-21',5,'May',2,2023),
(20230604,'2023-06-04',6,'June',2,2023),
(20230801,'2023-08-01',8,'August',3,2023),
(20230815,'2023-08-15',8,'August',3,2023),
(20230809,'2023-08-09',8,'August',3,2023),
(20230928,'2023-09-28',9,'September',3,2023),
(20231020,'2023-10-20',10,'October',4,2023),
(20231026,'2023-10-26',10,'October',4,2023),
(20231118,'2023-11-18',11,'November',4,2023),
(20231208,'2023-12-08',12,'December',4,2023),
(20231212,'2023-12-12',12,'December',4,2023);

-- Stores

INSERT INTO dim_store VALUES
(1,'Chennai Anna','Chennai'),
(2,'Delhi South','Delhi'),
(3,'Bangalore MG','Bangalore'),
(4,'Pune FC Road','Pune'),
(5,'Mumbai Central','Mumbai');

-- Products (category standardized)

INSERT INTO dim_product VALUES
(101,'Speaker','Electronics'),
(102,'Tablet','Electronics'),
(103,'Phone','Electronics'),
(104,'Smartwatch','Electronics'),
(105,'Atta 10kg','Grocery'),
(106,'Jeans','Clothing'),
(107,'Biscuits','Grocery'),
(108,'Jacket','Clothing'),
(109,'Laptop','Electronics'),
(110,'Milk 1L','Grocery'),
(111,'Saree','Clothing');

-- =========================
-- FACT DATA (cleaned + derived measure)
-- =========================

INSERT INTO fact_sales VALUES
(1,20230928,1,101,3,49262.78,147788.34),
(2,20231212,1,102,11,23226.12,255487.32),
(3,20230205,1,103,20,48703.39,974067.80),
(4,20230220,2,102,14,23226.12,325165.68),
(5,20230115,1,104,10,58851.01,588510.10),
(6,20230809,3,105,12,52464.00,629568.00),
(7,20230331,4,104,6,58851.01,353106.06),
(8,20231026,4,106,16,2317.47,37079.52),
(9,20231208,3,107,9,27469.99,247229.91),
(10,20230815,3,104,3,58851.01,176553.03),
(11,20230604,1,108,15,30187.24,452808.60),
(12,20231020,5,106,13,2317.47,30127.11),
(13,20230521,3,109,13,42343.15,550460.95),
(14,20230428,5,110,10,43374.39,433743.90),
(15,20231118,2,108,5,30187.24,150936.20),
(16,20230118,5,111,15,35451.81,531777.15),
(17,20230801,5,111,11,35451.81,389969.91);
