/*==========-Purpose -Identify the least frequently used payment method. -==========*/

SELECT 
	TOP 1
	p.Payment_Method,
	COUNT(*) as LeastFrequent
FROM dbo.Payments as p
Group BY Payment_Method
Order By Payment_Method asc;


--or
WITH LeastFrequent as
(
SELECT 
	p.Payment_Method,
	COUNT(*) as LeastFrequent,
	RANK() OVER (ORDER BY COUNT(*)  ASC) as RANKING
FROM dbo.Payments as p
GROUP BY p.Payment_Method
)
SELECT Payment_Method,
LeastFrequent
RANKING
from LeastFrequent
where RANKING=1