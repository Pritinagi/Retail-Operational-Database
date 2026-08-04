/*==========-Purpose - Show all products where the inventory quantity is less than 10 units. -==========*/

SELECT 
	i.Inventory_Id,
	i.Store_Id,
	p.Product_Name,
	i.Quantity
FROM dbo.Inventories as i 
INNER JOIN dbo.Products as p
	ON i.Product_Id=p.Product_Id
WHERE i.Quantity<10
order by i.Quantity ASC