/*==========-Purpose - Show the total number of orders processed by each employee. -==========*/


SELECT 
	e.Employee_Id,
	e.Employee_Name,
	count(o.order_id) as TotalOrderPerEmployee
FROM dbo.Employees as e
INNER JOIN dbo.Orders as o
	ON e.Employee_Id=o.Employee_Id
group by 
	e.Employee_Id,
	e.Employee_Name
Order by TotalOrderPerEmployee DESC