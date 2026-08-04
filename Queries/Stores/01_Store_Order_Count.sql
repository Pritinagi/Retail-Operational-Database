/*==========-Purpose - Show the total number of orders processed by each store. -==========*/
SELECT 
	s.Store_Name,
	s.Store_City,
	count(o.order_id) as TotalOrderedProcessed
FROM dbo.Stores as s
INNER JOIN dbo.Employees as e
	ON s.Store_Id=e.Store_Id

INNER JOIN dbo.Orders as o
	ON e.Employee_Id=o.Employee_Id
group by 
	s.Store_Name,	s.Store_City
order by TotalOrderedProcessed DESC 