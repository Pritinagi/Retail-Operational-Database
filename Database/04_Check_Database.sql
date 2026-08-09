/*=================-check data -======================*/

USE RetailOperationalDatabase;
GO

SELECT 'Categories' AS TableName, COUNT(*) AS ROW_COUNT FROM dbo.Categories
UNION ALL
SELECT 'Products', COUNT(*) FROM dbo.Products
UNION ALL
SELECT 'Stores', COUNT(*) FROM dbo.Stores
UNION ALL
SELECT 'Employees', COUNT(*) FROM dbo.Employees
UNION ALL
SELECT 'Customers', COUNT(*) FROM dbo.Customers
UNION ALL
SELECT 'Orders', COUNT(*) FROM dbo.Orders
UNION ALL
SELECT 'OrderItems', COUNT(*) FROM dbo.OrderItems
UNION ALL
SELECT 'Payments', COUNT(*) FROM dbo.Payments
UNION ALL
SELECT 'Inventories', COUNT(*) FROM dbo.Inventories;




