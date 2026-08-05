/*==========-Purpose : Show all orders that have not yet received a payment. -==========*/


SELECT 
	o.Order_Id
FROM dbo.Payments as p
LEFT JOIN dbo.Orders as o
On p.Order_Id=o.Order_Id
WHERE p.Order_Id is null