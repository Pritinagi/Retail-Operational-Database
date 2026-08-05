/*==========-Purpose - Show each employee's total revenue and their percentage contribution to the company's total revenue. -==========*/



SELECT 
	e.Employee_Id,
	e.Employee_Name,
	SUM(o.Total_Amount) as EmployeeRevenue ,
	SUM(SUM(Total_Amount)) OVER() as totalrevenue,
	SUM(o.Total_Amount)*100/(SUM(SUM(Total_Amount)) OVER()) as revenuepercentage
FROM dbo.Employees as e
INNER JOIN dbo.Orders as o
	ON e.Employee_Id=o.Employee_Id
GROUP BY e.Employee_Id,
	e.Employee_Name
ORDER BY EmployeeRevenue DESC