/*==========-Purpose - Show all products that are completely out of stock. -==========*/
SELECT 
	i.Store_Id,
	i.Product_Id,
	p.product_name
FROM dbo.Inventories as i
INNER JOIN dbo.Products as p
	ON i.Product_Id=p.Product_Id
WHERE i.Quantity<=0
