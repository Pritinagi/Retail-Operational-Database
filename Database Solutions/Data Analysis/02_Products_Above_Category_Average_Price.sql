/*===============-	Purpose : Find products whose price is greater than the average price of products within their own category. -===============*/
SELECT 
	Product_Id,
	Product_Name,
	Product_Price,
	Category_Id

FROM dbo.Products p1
WHERE Product_Price>(

	SELECT 
	
	AVG(Product_price) as AVG_price
	FROM dbo.Products p2
	WHERE p1.Category_Id=p2.Category_Id
)
