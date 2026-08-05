/*==========-Purpose - Calculating Store Revenue -==========*/
SELECT 
	Store_Name,
	sum(Total_Amount) as Store_Revenue
from dbo.Orders as o
INNER JOIN 
	dbo.Employees as e
	ON o.Employee_Id=e.Employee_Id
INNER JOIN 
	dbo.Stores as s
	ON e.Store_Id=s.Store_Id
Group by
	Store_Name
order by
	Store_Revenue desc
