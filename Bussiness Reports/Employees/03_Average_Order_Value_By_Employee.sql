/*==========-Purpose - Show the average order value processed by each employee. -==========*/



SELECT 
	e.Employee_Id,
	e.Employee_Name,
	AVG(total_amount) as AverageOrderValue
FROM dbo.Employees as e
INNER JOIN dbo.Orders as o
	ON e.Employee_Id=o.Employee_Id
GROUP BY 
	e.Employee_Id,
	e.Employee_Name
ORDER BY AverageOrderValue DESC