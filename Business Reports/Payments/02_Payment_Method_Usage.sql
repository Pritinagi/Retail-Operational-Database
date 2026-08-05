/*==========-Purpose - Show how many transactions were made using each payment method. -==========*/

SELECT 
	p.payment_method,
	COUNT(Order_id) as MethodUsage
FROM dbo.Payments as p
Group BY p.Payment_Method
ORDER BY MethodUsage DESC