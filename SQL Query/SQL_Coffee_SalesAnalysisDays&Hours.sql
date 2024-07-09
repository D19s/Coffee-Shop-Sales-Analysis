/*
SALES ANALYSIS BY DAYS and HOURS
*/

SELECT 
  CONCAT(ROUND(SUM(unit_price*transaction_qty)/1000,2),'K') AS total_sales,
  SUM(transaction_qty) AS Total_qty_sold,
  COUNT(*)
FROM
 coffee_shop_sales
WHERE
  MONTH(transaction_date)=5 AND DAYOFWEEK(transaction_date)=2 AND HOUR(transaction_time)=8