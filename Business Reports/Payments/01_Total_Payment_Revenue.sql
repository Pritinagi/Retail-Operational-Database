/*==========-Purpose - Calculate the total revenue successfully received through payments. -==========*/


SELECT 
	SUM(o.total_amount) RevenueByPayments
FROM dbo.Payments as p

INNER JOIN dbo.Orders as o
ON p.order_id=o.order_id

