/*==========-Purpose - Calculating Customers with No orders  -==========*/

select 
c.Customer_Id,
c.Customer_Name,
c.Customer_Phone
from dbo.Customers as c
Left join dbo.Orders as o
ON c.Customer_Id=o.Customer_Id
Where o.Customer_Id is Null 

