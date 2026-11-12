
-- ==========================================
-- WEEK 7: DATABASE DESIGN AND NORMALIZATION
-- ==========================================

-- Create and select the database

CREATE DATABASE IF NOT EXISTS week7_normalization;

USE week7_normalization;


-- ==========================================
-- QUESTION 1: ACHIEVING FIRST NORMAL FORM (1NF)
-- ==========================================

-- Step 1: Create the ProductDetail_1NF table

CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    PRIMARY KEY (OrderID, Product)
);

-- Step 2: Insert normalized records

INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- Step 3: Display the normalized table

SELECT * FROM ProductDetail_1NF;


-- ==========================================
-- QUESTION 2: ACHIEVING SECOND NORMAL FORM (2NF)
-- ==========================================

-- Partial Dependency:
-- CustomerName depends only on OrderID,
-- rather than the entire composite key (OrderID, Product).

-- Step 1: Create the Orders table

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Step 2: Create the OrderItems table

CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Step 3: Insert records into Orders

INSERT INTO Orders (OrderID, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Step 4: Insert records into OrderItems

INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

-- Step 5: Display the Orders table

SELECT * FROM Orders;

-- Step 6: Display the OrderItems table

SELECT * FROM OrderItems;

-- Step 7: Join both tables to display complete order details

SELECT
    Orders.OrderID,
    Orders.CustomerName,
    OrderItems.Product,
    OrderItems.Quantity
FROM Orders
JOIN OrderItems
ON Orders.OrderID = OrderItems.OrderID;
