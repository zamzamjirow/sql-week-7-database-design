# Week 7: Database Design and Normalization

## Overview
This assignment focuses on database design and normalization using SQL. It explores how to organize relational databases, reduce data redundancy, and improve data integrity through normalization techniques.

## Learning Objectives
- Understand the principles of database normalization.
- Apply First Normal Form (1NF) and Second Normal Form (2NF).
- Identify and eliminate repeating groups and partial dependencies.
- Create relational tables using primary keys and foreign keys.
- Improve database structure and data integrity.

## Assignment Questions

### Question 1: First Normal Form (1NF)
The original `ProductDetail` table contained multiple products in a single cell, violating 1NF.

**Solution:**
- Created a new table called `ProductDetail_1NF`.
- Separated multiple products into individual rows.
- Ensured each cell contains only one value.
- Used a composite primary key (`OrderID`, `Product`).

### Question 2: Second Normal Form (2NF)
The original `OrderDetails` table contained a partial dependency because `CustomerName` depended only on `OrderID`, rather than the entire composite primary key.

**Solution:**
- Created an `Orders` table to store order information.
- Created an `OrderItems` table to store products and quantities.
- Defined appropriate primary keys and foreign keys.
- Eliminated the partial dependency by separating customer information from product details.

## Database Structure

The assignment uses three tables:

| Table | Description |
|---|---|
| `ProductDetail_1NF` | Stores individual products associated with orders. |
| `Orders` | Stores order IDs and customer names. |
| `OrderItems` | Stores products and their quantities for each order. |

## Technologies Used
- MySQL
- MySQL Workbench
- Visual Studio Code
- Git and GitHub

## Files
- `answer.sql` – Contains SQL solutions for Questions 1 and 2.

## How to Run
1. Open MySQL Workbench.
2. Open the `answer.sql` file.
3. Execute the SQL statements.
4. Review the created tables and inserted records.
5. Run the SELECT queries to verify the results.

## Conclusion
This assignment demonstrates how database normalization improves database organization, reduces unnecessary data duplication, and establishes proper relationships between tables using primary and foreign keys