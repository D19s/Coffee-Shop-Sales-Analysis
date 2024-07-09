/*
KPI 1:
Total Sales Analysis:
- Calculate the total sales for each respective month
- Determine the month-on-month increase or decrease in sales.
- Calculate the difference in the sales between the selected month and the previous month.
*/


SELECT
   MONTH(transaction_date) AS Month, -- Number of Month Which month we are seeing the sale
   ROUND(SUM(unit_price*transaction_qty)) AS total_sales, -- Total Sales Column
   (SUM(unit_price*transaction_qty) - LAG(SUM(unit_price*transaction_qty),1) -- Month sales difference, lag is used to get value from previous row of total sales column
   OVER (ORDER BY MONTH(transaction_date))) / LAG(SUM(unit_price*transaction_qty),1) -- Division by present month sales
   OVER (ORDER BY MONTH(transaction_date))*100 AS Mom_increase_percentage, -- Percentage
   ROUND(SUM(unit_price*transaction_qty) - LAG(SUM(unit_price*transaction_qty), 1)
   OVER (ORDER BY MONTH(transaction_date)))AS PM_Sales_Compare
FROM
	coffee_shop_sales
WHERE
	MONTH(transaction_date) IN (4,5) -- for months April and May
GROUP BY
	MONTH(transaction_date)
ORDER BY
	MONTH(transaction_date)