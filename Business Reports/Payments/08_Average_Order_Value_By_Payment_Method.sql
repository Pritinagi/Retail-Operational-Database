/*==========-Purpose : Show the average order value for each payment method. -==========*/

SELECT 
	p.Payment_Method,
	AVG(o.total_amount) as AverageOrderValue
FROM dbo.Payments as p 
INNER JOIN dbo.Orders as o 
ON p.Order_Id=o.Order_Id

GROUP BY p.Payment_Method
ORDER BY AverageOrderValue DESC