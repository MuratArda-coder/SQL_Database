SELECT category,
    TRUNCATE(SUM(price),1),
    TRUNCATE(MAX(price),1),
    TRUNCATE(AVG(price),1)
FROM products
    INNER JOIN sales
    ON sales.product_id = products.product_id
    INNER JOIN salesmans
    ON sales.salesman_id = salesmans.salesman_id
WHERE   YEAR(salesmans.hire_date) >= 2012 
        AND 
        salesmans.salary > 1020
GROUP BY category


SELECT UPPER(customers.customer_name)
FROM customers
    INNER JOIN sales
    ON sales.customer_id = customers.customer_id
    INNER JOIN products
    ON sales.product_id = products.product_id
WHERE products.category IN ("c2","c3","c4","c5")
GROUP BY products.category
HAVING MAX(price)>15;


SELECT UPPER(customers.customer_name)
FROM customers
    INNER JOIN sales
    ON sales.customer_id = customers.customer_id
    INNER JOIN products
    ON sales.product_id = products.product_id
WHERE products.category IN ("c1","c3","c4")
GROUP BY products.category
HAVING MAX(price)<15;


SELECT UPPER(customers.customer_name)
FROM customers
    INNER JOIN sales
    ON sales.customer_id = customers.customer_id
    INNER JOIN products
    ON sales.product_id = products.product_id
WHERE products.category NOT IN ("c1","c3","c4")
GROUP BY products.category
HAVING MIN(price)>5
ORDER BY customers.customer_name;


SELECT category,
    CONCAT(TRUNCATE(SUM(price),0)," TL"),
    CONCAT(TRUNCATE(MAX(price),0)," TL"),
    CONCAT(TRUNCATE(AVG(price),0)," TL")
FROM products
    INNER JOIN sales
    ON sales.product_id = products.product_id
    INNER JOIN salesmans
    ON sales.salesman_id = salesmans.salesman_id
WHERE   salesmans.hire_date < "2015-01-01" 
        AND 
        salesmans.salary > 1010
GROUP BY category
ORDER BY SUM(price) DESC;


SELECT category,
    CONCAT(TRUNCATE(SUM(price),1)," TL")
FROM products
    INNER JOIN sales
    ON sales.product_id = products.product_id
WHERE sales.commission_ratio > 0.05 
GROUP BY category
ORDER BY SUM(price);


SELECT category,
	CONCAT(TRUNCATE(price,1)," TL"),
    CONCAT(TRUNCATE(price*1.08,1)," TL")
FROM products
    INNER JOIN sales
    ON sales.product_id = products.product_id
WHERE sales.commission_ratio > (SELECT AVG(commission_ratio) from sales)
GROUP BY category
ORDER BY 1.08*price;