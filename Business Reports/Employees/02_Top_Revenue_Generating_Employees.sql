/*==========-Purpose - Show the top 10 employees based on total revenue generated from the orders they processed. -==========*/

SELECT 
	TOP 10
	e.Employee_Id,
	e.Employee_Name,
	SUM(o.total_amount) as TotalRevenue
FROM dbo.Employees as e
INNER JOIN dbo.Orders as o
	ON e.Employee_Id=o.Employee_Id
GROUP BY	
	e.Employee_Id,
	e.Employee_Name
ORDER BY TotalRevenue DESC
