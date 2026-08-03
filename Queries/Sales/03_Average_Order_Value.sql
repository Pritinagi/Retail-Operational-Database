/*==========-Purpose - Calculating Average Order Value -==========*/
SELECT 
AVG(total_amount) as AverageOrderValue
from dbo.Orders