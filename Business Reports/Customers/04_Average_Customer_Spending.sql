/*==========-Purpose - Calculate the average amount spent by each customer across all of their orders -==========*/


SELECT
	Customer_Name,
	c.customer_id,
	avg(Total_Amount) as AverageAmount
FROM dbo.Customers as c
INNER JOIN dbo.Orders as o
ON c.Customer_Id=o.Customer_Id
GROUP BY Customer_Name,c.Customer_Id
ORDER BY AverageAmount DESC