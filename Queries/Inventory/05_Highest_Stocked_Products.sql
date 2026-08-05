/*==========-Purpose - Show the top 10 products with the highest total inventory across all stores -==========*/


SELECT 
	TOP 10
	p.Product_Id,
	p.product_name,
	SUM(Quantity) as totalinventory
FROM dbo.Inventories as i
INNER JOIN dbo.Products as p
	ON i.Product_Id=p.Product_Id
group by p.Product_Id,p.product_name
order by totalinventory desc