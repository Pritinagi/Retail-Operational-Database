/*==========-Purpose : Show all orders that have not yet received a payment. -==========*/


SELECT 
	o.Order_Id
FROM dbo.Orders as o
LEFT JOIN dbo.Payments as p
On o.Order_Id=p.Order_Id
WHERE p.Order_Id is null