/*==========-Purpose - Show the total revenue received through each payment method. -==========*/


SELECT 
	p.Payment_Method,
	SUM(o.Total_Amount) as TotalRevenue
FROM dbo.Payments as p
INNER JOIN dbo.Orders as o
ON p.Order_Id=o.Order_Id
GROUP BY p.Payment_Method
Order BY TotalRevenue DESC