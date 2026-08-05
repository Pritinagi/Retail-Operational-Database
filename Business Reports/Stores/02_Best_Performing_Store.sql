/*==========-Purpose - Show the store that generated the highest revenue -==========*/


SELECT 
	TOP 1
	s.Store_Name,
	SUM(o.total_amount) as Revenue
FROM dbo.Stores as s
INNER JOIN dbo.Employees as e
	ON s.Store_Id=e.Store_Id
INNER JOIN dbo.Orders as o
	ON e.Employee_Id=o.Employee_Id
GROUP BY s.Store_Name
ORDER BY Revenue DESC