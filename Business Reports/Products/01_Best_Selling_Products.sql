/*==========-Purpose - Calculate the top 10 best-selling products based on total quantity sold. -==========*/

SELECT 
	TOP 10
	p.Product_Id,
	p.Product_Name,
	sum(Quantity) as TotalQuantitySold
FROM dbo.Products as p
INNER JOIN dbo.OrderItems as oi
ON p.Product_Id=oi.Product_Id
GROUP BY p.Product_Id,p.Product_Name
ORDER BY Quantity DESC

