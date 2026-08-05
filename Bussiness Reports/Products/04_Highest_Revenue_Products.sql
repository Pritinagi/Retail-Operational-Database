/*==========-Purpose - Show the top 10 products that generated the highest revenue -==========*/


SELECT 
	TOP 10
	p.Product_Id,
	p.Product_Name,
	SUM(Unit_Price*Quantity) as Revenue
FROM dbo.Products as p
INNER JOIN dbo.OrderItems as oi
ON p.Product_Id=oi.Product_Id
GROUP BY p.Product_Id,p.Product_Name
ORDER BY Revenue DESC