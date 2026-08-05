/*==========-Purpose -Identify the most frequently used payment method. -==========*/

/**
SELECT 
	TOP 1
	Payment_Method,
	COUNT(*) as FrequentlyUsed
FROM dbo.Payments
Group By Payment_Method
ORDER BY FrequentlyUsed DESC
**/

--OR
WITH PaymentRank as
(
SELECT 
	Payment_Method,
	count(*) as FrequentlyUsed,
	RANK() OVER (ORDER BY count(*) DESC) Ranking
FROM dbo.Payments
group by Payment_Method
)
SELECT 
	Payment_Method,
	Ranking
from PaymentRank
WHERE Ranking=1