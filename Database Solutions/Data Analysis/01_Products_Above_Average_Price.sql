/*===============-	Purpose : Find all products whose price is greater than the average price of all products. -===============*/

SELECT
	Product_Id,
	product_name,
	Product_Price
FROM (

		SELECT 
			Product_Id,
			product_name,
			Product_Price,
			AVG(product_price) as AVG_Price
		FROM dbo.products 
		GROUP BY 
			Product_Id,
			product_name,
			Product_Price	
	
) as avg_price
WHERE AVG_Price<product_price
