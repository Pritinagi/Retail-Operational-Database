/*==========-Purpose - Show in how many stores each product is currently available (Quantity > 0) -==========*/

SELECT 
	i.Product_Id,
	p.product_name,
	COUNT(i.Store_Id) as AvailableStores
FROM dbo.Products as p
INNER JOIN dbo.Inventories as i
	ON p.Product_Id=i.Product_Id
WHERE i.Quantity>0
Group BY 
	i.Product_Id,
	p.product_name
ORDER BY AvailableStores ASC
