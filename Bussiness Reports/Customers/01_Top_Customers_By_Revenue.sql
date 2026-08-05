/*==========-Purpose - Calculating Top 10 Customers by Revenue -==========*/
SELECT TOP 10
	Customer_Name,
	sum(total_amount) CustomerRevenue
FROM dbo.Customers as c 
INNER JOIN dbo.Orders as o
	ON c.Customer_Id=o.Customer_Id
group by Customer_Name
order by sum(total_amount)  desc
