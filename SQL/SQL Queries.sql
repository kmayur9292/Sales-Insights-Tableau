
-- Show all customer records
SELECT * FROM customers;

-- Show total number of customers
SELECT COUNT(*) FROM customers;

-- Show transactions for Chennai market (market code for Chennai is Mark001)
SELECT * FROM transactions WHERE market_code = 'Mark001';

-- Show distinct product codes that were sold in Chennai
SELECT DISTINCT product_code FROM transactions WHERE market_code = 'Mark001';

-- Show transactions where currency is US dollars
SELECT * FROM transactions WHERE currency = 'USD';

-- Show transactions in 2020 joined with date table
SELECT t.*, d.*
FROM transactions t
INNER JOIN date_dim d
  ON t.order_date = d.date
WHERE d.year = 2020;

-- Show total revenue in year 2020
SELECT SUM(t.sales_amount)
FROM transactions t
INNER JOIN date_dim d
  ON t.order_date = d.date
WHERE d.year = 2020
  AND (t.currency = 'INR' OR t.currency = 'USD');

-- Show total revenue in January 2020
SELECT SUM(t.sales_amount)
FROM transactions t
INNER JOIN date_dim d
  ON t.order_date = d.date
WHERE d.year = 2020
  AND d.month_name = 'January'
  AND (t.currency = 'INR' OR t.currency = 'USD');

-- Show total revenue in year 2020 in Chennai
SELECT SUM(t.sales_amount)
FROM transactions t
INNER JOIN date d
  ON t.order_date = d.date
WHERE d.year = 2020
  AND t.market_code = 'Mark001';
