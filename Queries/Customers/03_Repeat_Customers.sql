/*==========-Purpose - Calculate customers who have placed more than one order, along with their total number of orders -==========*/



SELECT 
	c.Customer_Id,
	c.customer_name,
	count(o.order_id) as TotalNumberOfOrders
FROM dbo.Customers as c
INNER JOIN dbo.Orders as o
	ON c.Customer_Id=o.Customer_Id
GROUP BY
	c.Customer_Id, c.Customer_Name
HAVING	
	COUNT(o.order_id)>1
ORDER BY 
	TotalNumberOfOrders DESC
