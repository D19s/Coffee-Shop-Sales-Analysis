 /*
KPI 3:
Total Quantity Sold Analysis:
- Calculate the total quantity sold for each respective month
- Determine the month-on-month increase or decrease in the total quantity sold.
- Calculate the difference in the total quantity sold between the selected month and 
   the previous month.
*/

SELECT 
	MONTH(transaction_date) AS Month,
	ROUND(SUM(transaction_qty)) AS Total_Quantity_Sold,
    ((SUM(transaction_qty)-LAG(SUM(transaction_qty),1)
    OVER (ORDER BY MONTH(transaction_date))) / LAG(SUM(transaction_qty),1) -- Division by present month orders
    OVER (ORDER BY MONTH(transaction_date)))*100 AS Mom_increase_percentage,-- Percentage
	SUM(transaction_qty) - LAG(SUM(transaction_qty), 1) 
    OVER (ORDER BY MONTH(transaction_date)) AS PM_Quantity_Sold_Compared
FROM 
	coffee_shop_sales
WHERE
    MONTH(transaction_date) IN (4,5)
GROUP BY
	MONTH(transaction_date)
ORDER BY
	MONTH(transaction_date)