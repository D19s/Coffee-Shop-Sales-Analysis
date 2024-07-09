/*
SALES Analysis by Product Category
*/

SELECT
   product_category,
   SUM(unit_price*transaction_qty) AS total_sales
FROM
   coffee_shop_sales
WHERE 
   MONTH(transaction_date)=5
GROUP BY 
   Product_category
ORDER BY 
   SUM(unit_price*transaction_qty) DESC