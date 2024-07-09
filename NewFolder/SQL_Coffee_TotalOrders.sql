 /*
KPI 2:
Total Order Analysis:
- Calculate the total number of orders for each respective month
- Determine the month-on-month increase or decrease in the numbers of orders.
- Calculate the difference in the number of orders between the selected month and 
   the previous month.
*/

SELECT 
	MONTH(transaction_date) AS Month,
	ROUND(COUNT(transaction_id)) AS TotalOrders,
    (COUNT(transaction_id)-LAG(COUNT(transaction_id),1)
    OVER (ORDER BY MONTH(transaction_date))) / LAG(COUNT(transaction_id),1) -- Division by present month orders
    OVER (ORDER BY MONTH(transaction_date))*100 AS Mom_increase_percentage,-- Percentage
	COUNT(transaction_id) - LAG(COUNT(transaction_id), 1) 
    OVER (ORDER BY MONTH(transaction_date)) AS PM_Compared
FROM 
	coffee_shop_sales
WHERE
    MONTH(transaction_date) IN (4,5)
GROUP BY
	MONTH(transaction_date)
ORDER BY
	MONTH(transaction_date)