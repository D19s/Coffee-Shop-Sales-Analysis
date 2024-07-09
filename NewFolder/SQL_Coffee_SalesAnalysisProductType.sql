/*
SALES Analysis by Product Type
*/

SELECT
   product_type,
   SUM(unit_price*transaction_qty) AS total_sales
FROM
   coffee_shop_sales
WHERE 
   MONTH(transaction_date)=5
GROUP BY 
   product_type
ORDER BY 
   SUM(unit_price*transaction_qty) DESC
LIMIT 10