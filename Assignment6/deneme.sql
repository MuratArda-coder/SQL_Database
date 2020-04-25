SELECT UPPER(customers.customer_name) FROM customers
UNION
SELECT UPPER(salesmans.salesman_name) FROM salesmans
UNION
SELECT UPPER(products.product_name) FROM products
UNION
SELECT sales.sale_date FROM sales
UNION
SELECT CONCAT(price+price*sales.commission_ratio," TL") AS total_price FROM products
UNION
SELECT CONCAT((price+price*sales.commission_ratio)*1.08," TL") AS total_price_with_VAT FROM products
WHERE   price+price*sales.commission_ratio>15;