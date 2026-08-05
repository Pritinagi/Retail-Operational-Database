/*==========-Purpose - Show the store that generated the lowest revenue, including stores with no orders -==========*/

SELECT 
	TOP 1
	s.Store_Id,
	s.Store_Name,
	ISNULL(sum(o.total_amount),0) as Revenue
FROM dbo.Stores as s
LEFT JOIN dbo.Employees as e
	ON s.Store_Id=e.Store_Id
LEFT JOIN dbo.Orders as o
	ON e.Employee_Id=o.Employee_Id
GROUP BY 
	s.Store_Id, s.Store_Name
ORDER BY  Revenue ASC
