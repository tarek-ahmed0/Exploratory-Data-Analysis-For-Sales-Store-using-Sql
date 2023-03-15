-- Performing Exploratory Data Analysis ( EDA ) To Get Useful Insights
-- • Each Customer Total Orders ( Showing His Name ).
SELECT customers.CustomerName, COUNT(orders.OrderID) AS `Total Orders`
FROM customers 
RIGHT JOIN orders
ON customers.CustomerID = orders.CustomerID
GROUP BY customers.CustomerName
ORDER BY `Total Orders` DESC;

-- • Each Customer Total Revenue ( Showing His ID, Name, City ).
SELECT customers.CustomerID , customers.CustomerName, SUM(orders.OrderTotal) AS `OrderTotal` 
FROM customers 
RIGHT JOIN orders
ON customers.CustomerID = orders.CustomerID
GROUP BY customers.CustomerName
ORDER BY `Total Revenue` DESC;

-- • Total Orders Number.
SELECT COUNT(orders.OrderID) AS `Total Orders Number`
FROM orders;

-- • Total Orders Revenue.
SELECT SUM(orders.OrderTotal) AS `OrderTotal`
FROM orders;

-- • Total Quantity Of Each Cookie ( Showing Cookie ID, Cookie Name ).
SELECT products_details.CookieID, products_details.CookieName, SUM(orders_product.Quantity) AS QuantitySold
FROM orders_product
LEFT JOIN products_details
ON orders_product.CookieID = products_details.CookieID
GROUP BY products_details.CookieName
ORDER BY QuantitySold DESC;

-- • Total Quantity Of Each Cookie ( Cookie Name, Revenue, Cost, Profit ).
SELECT products_details.CookieName,
SUM(products_details.RevenuePerCookie * orders_product.Quantity) AS Revenue, 
SUM(products_details.CostPerCookie * orders_product.Quantity) AS Cost, 
SUM(products_details.RevenuePerCookie * orders_product.Quantity - products_details.CostPerCookie * orders_product.Quantity) AS Profit
FROM orders_product
LEFT JOIN products_details
ON orders_product.CookieID = products_details.CookieID
GROUP BY CookieName
ORDER BY Profit DESC;

-- • Cookie Total Revenue.
SELECT
SUM(products_details.RevenuePerCookie * orders_product.Quantity) AS TotalRevenue
FROM orders_product
LEFT JOIN products_details
ON orders_product.CookieID = products_details.CookieID;

-- • Cookie Total Cost.
SELECT
SUM(products_details.CostPerCookie * orders_product.Quantity) AS TotalCost
FROM orders_product
LEFT JOIN products_details
ON orders_product.CookieID = products_details.CookieID;

-- • Cookie Total Profit.
SELECT
(SUM(products_details.RevenuePerCookie * orders_product.Quantity) - SUM(products_details.CostPerCookie * orders_product.Quantity)) AS TotalProfit
FROM orders_product
LEFT JOIN products_details
ON orders_product.CookieID = products_details.CookieID;


