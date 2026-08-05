/*==========-Purpose - Calculating Monthly Revenue -==========*/

SELECT
DATENAME(month,Order_Date) as Months,
DATENAME(year,Order_Date) as years,
Sum(total_amount) as MonthyRevenue
FROM dbo.Orders
group by DATENAME(month,Order_Date), DATENAME(year,Order_Date)
order by min(Order_Date)


