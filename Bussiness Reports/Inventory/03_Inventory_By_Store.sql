/*==========-Purpose - Show the total inventory quantity available in each store. -==========*/
SELECT 
	s.store_name ,
	SUM(i.Quantity) as TotalInventory
FROM dbo.Inventories as i
INNER JOIN dbo.Stores as s
	ON i.Store_Id=s.Store_Id
GROUP BY s.Store_Name
ORDER BY TotalInventory DESC