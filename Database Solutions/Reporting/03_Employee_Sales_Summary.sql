/*===============-	Purpose : Create a reusable view showing employee sales performance. -===============*/
--Show every employee and the number of orders handled by that employee, along with the total revenue generated from those orders.
CREATE VIEW View_Employee_Performance as 
(

	SELECT 
		e.Employee_Id,
		e.Employee_Name,
		ISNULL(COUNT(o.Order_Id),0) as order_count,
		ISNULL(SUM(o.total_amount),0) as total_revenue
	FROM dbo.Employees as e 
	LEFT JOIN dbo.orders as o
	ON e.Employee_Id=o.Employee_Id
	GROUP BY 
		e.Employee_Id,
		e.Employee_Name

)