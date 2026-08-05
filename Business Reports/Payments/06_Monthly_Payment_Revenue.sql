/*==========-Purpose : Show the total revenue received each month based on the payment date. -==========*/


SELECT 
datename(month,p.Payment_Date) as Months,
datename(year,p.Payment_Date) as years,

sum(o.total_amount) as MonthlyRevenue
FROM dbo.Payments as p

INNER JOIN dbo.Orders as o
ON p.Order_Id=o.Order_Id
GROUP BY 
		datename(month,p.Payment_Date), datename(year,p.Payment_Date)
ORDER BY MIN(p.Payment_Date) ASC
