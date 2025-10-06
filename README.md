# 🛒 Smart E-Commerce Sales Management System Database

This project is a complete SQL Server-based database design for managing an e-commerce platform. It includes user registration, product listings, order processing, payments, reviews, and inventory tracking.

---

## 📦 Database Name
**SmartE_CommerceSalesManagementSystemDB**

---

## 🧱 Tables Overview

| Table Name      | Description                                      |
|-----------------|--------------------------------------------------|
| Users           | Stores customer and seller information           |
| Products        | Contains product details and seller reference    |
| Orders          | Records customer orders                          |
| OrderDetails    | Tracks individual items in each order            |
| Payments        | Logs payment transactions                        |
| Reviews         | Stores customer feedback on products             |
| InventoryLogs   | Tracks stock changes and reasons                 |

---

## 🔗 Table Relationships

- **Users → Products**: One-to-Many (SellerId)
- **Users → Orders**: One-to-Many (UserId)
- **Orders → OrderDetails**: One-to-Many (OrderId)
- **Products → OrderDetails**: One-to-Many (ProductId)
- **Orders → Payments**: One-to-One (OrderId)
- **Users → Reviews**: One-to-Many (UserId)
- **Products → Reviews**: One-to-Many (ProductId)
- **Products → InventoryLogs**: One-to-Many (ProductId)

---

## 📥 Sample Data Inserted

- **Users**: Mezanur, Tufile
- **Products**: Mobile, 4 Ports Hub, Digital Watch, Send Watch
- **Orders**: 5 sample orders with current date
- **OrderDetails**: 2 sample entries
- **Payments**: 2 sample payments
- **Reviews**: 1 review
- **InventoryLogs**: 1 stock change entry

---

## 📊 SQL Features Used

- `CREATE TABLE`, `INSERT`, `UPDATE`, `DELETE`
- `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL JOIN`
- `GROUP BY`, `ORDER BY`, `TOP`, `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
- `UNION`, `UNION ALL`
- `WHERE`, `IN`, `BETWEEN`, `NOT`, `AS`

---

## 📋 Sample Queries

```sql
-- Select all users
SELECT * FROM Users;

-- Join Users with Products
SELECT * FROM Users INNER JOIN Products ON Users.Id = Products.SellerId;

-- Get top 4 products
SELECT TOP 4 * FROM Products ORDER BY Price DESC;

-- Count products by name
SELECT COUNT(Id), Name FROM Products GROUP BY Name;
