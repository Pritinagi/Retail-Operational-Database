/*===============-	Purpose : Find all products whose price is greater than the average price of all products. -===============*/

SELECT
	Product_Id,
	product_name,
	Product_Price
FROM products
WHERE product_price>(

		SELECT 
			AVG(product_price) as AVG_Price
		FROM dbo.products 
		
	)

