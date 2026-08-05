/*==========-Purpose - Calculate all products that have never been sold. -==========*/

SELECT 
	p.Product_Id,
	p.Product_Name
FROM dbo.Products as p
LEFT JOIN dbo.OrderItems as oi
ON p.Product_Id=oi.Product_Id
where oi.Product_Id is NULL


