/*
Sales Analysis By Weekdays and Weekends
*/

SELECT
  CASE WHEN DAYOFWEEK(transaction_date) IN (1,7) THEN 'WEEKENDS'
  ELSE ' WEEKDAYS'
  END AS Day_type,
  CONCAT(ROUND(SUM(unit_price*transaction_qty)/1000,1),'K') As Total_Sales
FROM
  coffee_shop_sales
WHERE 
  MONTH(transaction_date) = 5
GROUP BY
  CASE WHEN DAYOFWEEK(transaction_date) IN (1,7) THEN 'WEEKENDS'
  ELSE ' WEEKDAYS'
  END
/*
IN SQL SUN = 1 and Sat = 7
*/