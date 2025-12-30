
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(20),
    ProductID VARCHAR(20),
    Category VARCHAR(50),
    OrderDate DATE,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    Revenue DECIMAL(12,2),
    Status VARCHAR(20),
    Region VARCHAR(20)
);

INSERT INTO staging_table 
    (OrderID, CustomerID, ProductID, Category, OrderDate, Quantity, UnitPrice, Revenue, Status, Region) 
    VALUES (1, 'CUST004', 'PROD001', 'Books', 
    '2024-05-05', 2, 783.74, 1567.48, 'Pending', 'North'),
    (2, 'CUST019', 'PROD007', 'Electronics', 
    '2024-01-16', 1, 1171.33, 1171.33, 'Pending', 'South'),
    (3, 'CUST018', 'PROD007', 'Clothing', 
    '2024-08-17', 5, 1463.13, 7315.65, 'Pending', 'South'),
    (4, 'CUST014', 'PROD006', 'Books', 
    '2024-03-20', 2, 4790.34, 9580.68, 'Delivered', 'North'),
    (5, 'CUST003', 'PROD007', 'Electronics', 
    '2024-07-02', 3, 3058.26, 9174.78, 'Pending', 'West'),
    (6, 'CUST018', 'PROD002', 'Furniture', 
    '2024-02-10', 5, 1536.57, 7682.85, 'Delivered', 'South'),
    (7, 'CUST003', 'PROD001', 'Clothing', 
    '2024-05-28', 1, 4291.06, 4291.06, 'Pending', 'West'),
    (8, 'CUST009', 'PROD008', 'Books', 
    '2024-03-24', 3, 1840.83, 5522.49, 'Delivered', 'North'),
    (9, 'CUST020', 'PROD003', 'Groceries', 
    '2024-05-05', 2, 2365.08, 4730.16, 'Delivered', 'South');
INSERT INTO Orders 
    (OrderID, CustomerID, ProductID, Category, OrderDate, Quantity, UnitPrice, Revenue, Status, Region) 
    VALUES (10, 'CUST011', 'PROD001', 'Clothing', 
    '2024-01-17', 3, 2065.71, 6197.13, 'Pending', 'South');
INSERT INTO Orders 
    (OrderID, CustomerID, ProductID, Category, OrderDate, Quantity, UnitPrice, Revenue, Status, Region) 
    VALUES (11, 'CUST019', 'PROD006', 'Clothing', 
    '2024-12-01', 4, 2038.6, 8154.4, 'Cancelled', 'South');
INSERT INTO Orders 
    (OrderID, CustomerID, ProductID, Category, OrderDate, Quantity, UnitPrice, Revenue, Status, Region) 
    VALUES (12, 'CUST009', 'PROD003', 'Clothing', 
    '2024-10-14', 5, 1387.43, 6937.15, 'Cancelled', 'West');
INSERT INTO Orders 
    (OrderID, CustomerID, ProductID, Category, OrderDate, Quantity, UnitPrice, Revenue, Status, Region) 
    VALUES (13, 'CUST012', 'PROD004', 'Clothing', 
    '2024-09-17', 4, 545.46, 2181.84, 'Pending', 'North');
INSERT INTO Orders 
    (OrderID, CustomerID, ProductID, Category, OrderDate, Quantity, UnitPrice, Revenue, Status, Region) 
    VALUES (14, 'CUST005', 'PROD003', 'Furniture', 
    '2024-11-01', 1, 1985.36, 1985.36, 'Cancelled', 'East');
INSERT INTO Orders 
    (OrderID, CustomerID, ProductID, Category, OrderDate, Quantity, UnitPrice, Revenue, Status, Region) 
    VALUES (15, 'CUST018', 'PROD001', 'Electronics', 
    '2024-12-15', 5, 3779.3, 18896.5, 'Delivered', 'North');
INSERT INTO Orders 
    (OrderID, CustomerID, ProductID, Category, OrderDate, Quantity, UnitPrice, Revenue, Status, Region) 
    VALUES (16, 'CUST010', 'PROD007', 'Clothing', 
    '2024-08-20', 1, 4773.7, 4773.7, 'Delivered', 'South');
INSERT INTO Orders 
    (OrderID, CustomerID, ProductID, Category, OrderDate, Quantity, UnitPrice, Revenue, Status, Region) 
    VALUES (17, 'CUST017', 'PROD002', 'Books', 
    '2024-11-23', 5, 3083.95, 15419.75, 'Shipped', 'East');
INSERT INTO Orders 
    (OrderID, CustomerID, ProductID, Category, OrderDate, Quantity, UnitPrice, Revenue, Status, Region) 
    VALUES (18, 'CUST006', 'PROD009', 'Groceries', 
    '2024-01-01', 5, 1688.36, 8441.8, 'Pending', 'North');
INSERT INTO Orders 
    (OrderID, CustomerID, ProductID, Category, OrderDate, Quantity, UnitPrice, Revenue, Status, Region) 
    VALUES (19, 'CUST012', 'PROD005', 'Clothing', 
    '2024-01-30', 2, 4402.25, 8804.5, 'Pending', 'North');
INSERT INTO Orders 
    (OrderID, CustomerID, ProductID, Category, OrderDate, Quantity, UnitPrice, Revenue, Status, Region) 
    VALUES (20, 'CUST016', 'PROD002', 'Groceries', 
    '2024-03-05', 2, 3332.78, 6665.56, 'Shipped', 'East');
INSERT INTO Orders 
    (OrderID, CustomerID, ProductID, Category, OrderDate, Quantity, UnitPrice, Revenue, Status, Region) 
    VALUES (21, 'CUST017', 'PROD010', 'Furniture', 
    '2024-04-18', 5, 3800.8, 19004.0, 'Shipped', 'East');
INSERT INTO Orders 
    (OrderID, CustomerID, ProductID, Category, OrderDate, Quantity, UnitPrice, Revenue, Status, Region) 
    VALUES (22, 'CUST013', 'PROD006', 'Furniture', 
    '2024-09-21', 4, 692.92, 2771.68, 'Shipped', 'North');
INSERT INTO Orders 
    (OrderID, CustomerID, ProductID, Category, OrderDate, Quantity, UnitPrice, Revenue, Status, Region) 
    VALUES (23, 'CUST011', 'PROD001', 'Groceries', 
    '2024-10-10', 2, 2983.36, 5966.72, 'Pending', 'North');
INSERT INTO Orders 
    (OrderID, CustomerID, ProductID, Category, OrderDate, Quantity, UnitPrice, Revenue, Status, Region) 
    VALUES (24, 'CUST002', 'PROD004', 'Electronics', 
    '2024-01-17', 3, 447.2, 1341.6, 'Shipped', 'East');
INSERT INTO Orders 
    (OrderID, CustomerID, ProductID, Category, OrderDate, Quantity, UnitPrice, Revenue, Status, Region) 
    VALUES (25, 'CUST016', 'PROD004', 'Groceries', 
    '2024-03-08', 5, 2923.44, 14617.2, 'Shipped', 'West');
INSERT INTO Orders 
    (OrderID, CustomerID, ProductID, Category, OrderDate, Quantity, UnitPrice, Revenue, Status, Region) 
    VALUES (26, 'CUST014', 'PROD004', 'Electronics', 
    '2024-02-19', 4, 1836.06, 7344.24, 'Cancelled', 'West');
INSERT INTO Orders 
    (OrderID, CustomerID, ProductID, Category, OrderDate, Quantity, UnitPrice, Revenue, Status, Region) 
    VALUES (27, 'CUST002', 'PROD002', 'Electronics', 
    '2024-07-25', 3, 4022.9, 12068.7, 'Pending', 'South');
INSERT INTO Orders 
    (OrderID, CustomerID, ProductID, Category, OrderDate, Quantity, UnitPrice, Revenue, Status, Region) 
    VALUES (28, 'CUST007', 'PROD004', 'Groceries', 
    '2024-08-17', 2, 2167.22, 4334.44, 'Delivered', 'West');
INSERT INTO Orders 
    (OrderID, CustomerID, ProductID, Category, OrderDate, Quantity, UnitPrice, Revenue, Status, Region) 
    VALUES (29, 'CUST008', 'PROD002', 'Furniture', 
    '2024-10-08', 1, 347.88, 347.88, 'Pending', 'North');
INSERT INTO Orders 
    (OrderID, CustomerID, ProductID, Category, OrderDate, Quantity, UnitPrice, Revenue, Status, Region) 
    VALUES (30, 'CUST008', 'PROD003', 'Furniture', '2024-09-05', 4, 1147.36, 4589.44, 'Cancelled', 'North');

    drop table staging_table;
create table staging_table(
    OrderID INT ,
    CustomerID VARCHAR(20),
    ProductID VARCHAR(20),
    Category VARCHAR(50),
    OrderDate DATE,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    Revenue DECIMAL(12,2),
    Status VARCHAR(20),
    Region VARCHAR(20)
);

select * from staging_table;







