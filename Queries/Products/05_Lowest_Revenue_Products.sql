/*==========-Purpose - Show the bottom 10 products based on total revenue generated, including products that have never been sold. -==========*/


SELECT TOP 10
	p.Product_Id,
	p.Product_Name,
	ISNULL(SUM(oi.unit_price*oi.Quantity),0) as Revenue
FROM dbo.Products as p
LEFT JOIN dbo.OrderItems as oi
ON p.Product_Id=oi.Product_Id
GROUP BY p.Product_Id,p.Product_Name  
ORDER BY Revenue ASC