/*==========-Purpose - Calculating Revenue by Product -==========*/

SELECT 
	product_name,
	sum(Unit_Price*Quantity) as ProductRevenue
FROM dbo.OrderItems as oi
INNER JOIN dbo.products as p
	ON oi.Product_Id=p.Product_Id
group by Product_Name
order by sum(Unit_Price*Quantity) asc