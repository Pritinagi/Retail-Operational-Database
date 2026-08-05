/*==========-Purpose - Show all employees who have never processed an order. -==========*/

SELECT 
	e.Employee_Id,
	e.Employee_Name
FROM dbo.Employees as e
LEFT JOIN dbo.Orders as o
	ON e.Employee_Id=o.Employee_Id
	WHERE o.Order_Id is null
