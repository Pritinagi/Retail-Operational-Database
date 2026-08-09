USE RetailOperationalDatabase;
GO

BEGIN TRANSACTION;

DELETE FROM dbo.Payments;
DELETE FROM dbo.Inventories;
DELETE FROM dbo.OrderItems;
DELETE FROM dbo.Orders;
DELETE FROM dbo.Customers;
DELETE FROM dbo.Employees;
DELETE FROM dbo.Products;
DELETE FROM dbo.Stores;
DELETE FROM dbo.Categories;
DBCC CHECKIDENT ('dbo.Categories', RESEED, 100);
DBCC CHECKIDENT ('dbo.Products', RESEED, 200);
DBCC CHECKIDENT ('dbo.Stores', RESEED, 300);
DBCC CHECKIDENT ('dbo.Employees', RESEED, 400);
DBCC CHECKIDENT ('dbo.Customers', RESEED, 500);
DBCC CHECKIDENT ('dbo.Orders', RESEED, 1000);
DBCC CHECKIDENT ('dbo.OrderItems', RESEED, 2000);
DBCC CHECKIDENT ('dbo.Inventories', RESEED, 3000);
DBCC CHECKIDENT ('dbo.Payments', RESEED, 4000);

COMMIT TRANSACTION;