/*===================================-	Purpose : Create a reusable view showing product-level sales performance -===================================*/

CREATE VIEW VIEW_Product_Revenue as
(

	SELECT 
		p.Product_Id,
		p.Product_Name,
		ISNULL(SUM(oi.Quantity),0) as Total_quantity_sold,
		ISNULL(sum(oi.Unit_Price*oi.Quantity),0) as Total_revenue
	FROM dbo.Products as p
	LEFT JOIN dbo.OrderItems as oi
	ON p.Product_Id=oi.Product_Id
	GROUP BY 
		p.Product_Id,
		p.Product_Name





)
