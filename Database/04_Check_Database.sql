/*========================================================
  DATABASE VALIDATION
  Purpose: Verify row counts, relationships, duplicates,
           NULL values, and invalid business data.
========================================================*/


/*========================================================
  1. ROW COUNT CHECK
========================================================*/

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




/*========================================================
  2. ORDERS WITH INVALID CUSTOMER
========================================================*/


SELECT 
    COUNT(*) as InvalidCustomers
FROM dbo.Orders as o
LEFT JOIN dbo.Customers as c
ON o.Customer_Id=c.Customer_Id
WHERE c.Customer_Id is null


/*========================================================
  3. ORDERS WITH INVALID Employee
========================================================*/
SELECT 
    COUNT(*) as InvalidEmployee
FROM dbo.Orders as o
LEFT JOIN dbo.Employees as e
ON o.Employee_Id=e.Employee_Id
WHERE e.Employee_Id is null


/*========================================================
  4. ORDERS WITH INVALID orderitems
========================================================*/


SELECT
    COUNT(*) as InvalidOrderItems
FROM dbo.OrderItems as oi
LEFT JOIN dbo.Orders as o
ON oi.Order_Id=o.Order_Id
WHERE o.Order_Id is NULL



/*========================================================
    5. OrderItems that reference a Product which does not exist in dbo.Products
========================================================*/

SELECT 
    count(*) as InvalidOrderitems
FROM dbo.OrderItems as oi
LEFT JOIN dbo.Products as p
ON oi.Product_Id=p.Product_Id
WHERE p.Product_Id is NULL




/*========================================================
    6. Payments whose Order_Id does not exist in dbo.Orders.
========================================================*/
SELECT 
    COUNT(*) as InvalidPayments
FROM dbo.Payments as p
LEFT JOIN dbo.Orders as o
ON p.Order_Id=o.Order_Id
WHERE o.Order_Id is null



/*========================================================
    7. Inventory records whose Store_Id does not exist in dbo.Stores.
========================================================*/

SELECT 
    count(*) as InvalidInventoryStores  
FROM dbo.Inventories as i 
LEFT JOIN dbo.Stores as s
ON i.Store_Id=s.Store_Id
WHERE s.Store_Id is null




/*============================================================================
    8. Inventory records have a Product_Id that does not exist in dbo.Products
==============================================================================*/

SELECT 
    COUNT(*) as InvalidInventoryProducts
FROM dbo.Inventories as i
LEFT JOIN dbo.Products as p
ON i.Product_Id=p.Product_Id
WHERE p.Product_Id is null



/*============================================================================
    9. Find Orders having more than one Payment.
==============================================================================*/

SELECT 
    o.Order_Id,
    count(p.payment_id) as PaymentCount
FROM dbo.orders as o
LEFT JOIN dbo.payments as p
ON o.Order_Id=p.Order_Id
Group by o.Order_Id
having count(p.payment_id)>1



/*============================================================================
10.duplicate (Order_Id, Product_Id) combinations in dbo.OrderItems
==============================================================================*/

SELECT 
    COUNT(*) as DuplicateCombo
FROM dbo.OrderItems as o
GROUP BY o.Order_Id , o.Product_Id
Having count(* )>=2


SELECT * FROM dbo.OrderItems




/*============================================================================
11.Invalid OrderItem Quantity
==============================================================================*/


SELECT 
    COUNT(Quantity) as InvalidQuantities
FROM dbo.OrderItems as oi
WHERE Quantity<=0




/*============================================================================
12. Invalid Product Prices
==============================================================================*/

SELECT 
COUNT(*) as InvalidProductPrices
FROM dbo.Products 
Where Product_Price<=0





/*============================================================================
13. Required Columns
==============================================================================*/

SELECT 
    COUNT(*) as InvalidColumneName
FROM dbo.Products
WHERE Product_Name is null or Product_Name=''





/*============================================================================
14. Invalid Order Dates
==============================================================================*/

SELECT 
    count(*) as invaliddate
FROM dbo.Orders
where CAST(GETDATE() AS DATE)<Order_Date


/*============================================================================
15. Payment Before Order
==============================================================================*/

SELECT 
COUNT(*) as PaymentsBeeforeOrders
FROM dbo.Orders as o
INNER JOIN dbo.Payments as p
ON o.Order_Id=p.Order_Id
WHERE o.Order_Date>p.Payment_Date



/*============================================================================
16. Invalid OrderItem Unit Prices
==============================================================================*/


SELECT 
    COUNT(*) as InvalidUnitPrice
FROM dbo.OrderItems as oi
WHERE Unit_Price<=0



/*============================================================================
17. Negative Inventory Stock
==============================================================================*/


SELECT 
    COUNT(*) as InvalidInventoryStocks
FROM dbo.Inventories
WHERE Quantity<0



/*============================================================================
18. Duplicate Product Names
==============================================================================*/


SELECT 
    Product_name,
    COUNT(*) DuplicateProductCount
FROM dbo.Products
GROUP BY Product_Name
HAVING COUNT(Product_Name)>=2



/*============================================================================
19. Duplicate Customer Phone Numbers
==============================================================================*/

SELECT 
    Customer_Phone,
    Count(*) as CustomerCount
FROM dbo.Customers
Group by Customer_Phone
Having Count(*)>=2



/*============================================================================
20. Orders With No OrderItems
==============================================================================*/


SELECT 
    o.Order_Id
FROM dbo.orders as o
LEFT JOIN dbo.OrderItems as oi
ON o.Order_Id=oi.Order_Id
WHERE oi.OrderItem_Id is null





/*============================================================================
21. Customers With No Orders
==============================================================================*/

SELECT 
    Customer_Name
FROM dbo.Customers as c
LEFT JOIN dbo.Orders as o
ON c.Customer_Id=o.Customer_Id
WHERE o.Customer_Id is null



/*============================================================================
22. Products With No Inventory Record
==============================================================================*/

SELECT 
p.Product_Id ,
p.Product_Name
FROM dbo.Products as p
LEFT JOIN dbo.Inventories as i
ON p.Product_Id=i.Product_Id
WHERE i.Product_Id is null





/*============================================================================
23. Employees With No Orders
==============================================================================*/

SELECT 
    e.Employee_Id,
    e.Employee_Name
FROM dbo.Employees as e
LEFT JOIN dbo.Orders as o
ON e.Employee_Id=o.Employee_Id
WHERE o.Employee_Id is null


/*============================================================================
24. Orders With Invalid Total Amount
==============================================================================*/

SELECT 
    Count(*) as InvalidOrderAmounts
FROM dbo.Orders as o

WHERE o.Total_Amount<0


/*============================================================================
25. Inventory Without a Valid Product
==============================================================================*/

SELECT 
    p.Product_Id,
    COUNT(Store_Id) as StoreCount
FROM dbo.Products as p
LEFT JOIN dbo.Inventories as i 
ON p.Product_Id=i.Product_Id
group by  p.Product_Id
HAVING COUNT(Store_Id)>1
