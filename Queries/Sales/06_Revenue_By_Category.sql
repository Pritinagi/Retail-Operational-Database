/*==========-Purpose - Calculating Revenue by categoryy -==========*/
SELECT * FROM Categories
SELECT * from Products
SELECT * from OrderItems
SELECT * from orders




SELECT 
	c.category_name,
	SUM(Unit_Price*Quantity) as CategoryRevenue
from dbo.Categories as c
INNER JOIN dbo.Products as p
	ON p.Category_Id=c.Category_Id
INNER JOIN dbo.OrderItems as oi
	ON oi.Product_Id=p.Product_Id
group by c.Category_Name
ORDER BY SUM(Unit_Price*Quantity) desc
