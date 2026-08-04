/*==========-Purpose - Calculate the bottom 10 products based on total quantity sold. -==========*/


SELECT Top 10
	p.Product_Id,
	p.Product_Name,
	ISNULL(Sum(quantity),0) as Unitsold
FROM dbo.Products as p 
LEFT JOIN dbo.OrderItems as oi
ON p.Product_Id=oi.Product_Id
GROUP BY p.Product_Id,p.Product_Name
ORDER BY Unitsold ASC
