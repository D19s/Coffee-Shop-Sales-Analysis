/*
Sales value by Store Location
*/

SELECT 
	store_location, -- Use group by when Dimension field, discrete field with an aggregation, qualitative value
    CONCAT(ROUND(SUM(unit_price*transaction_qty)/1000,1),'K') AS Total_sales
FROM
	coffee_shop_sales
WHERE MONTH(transaction_date) = 5 -- May
GROUP BY store_location
ORDER BY SUM(unit_price*transaction_qty) DESC