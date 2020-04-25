SELECT (SELECT category FROM products WHERE X.product_id = product_id) as category,
	CONCAT(TRUNCATE(SUM((SELECT SUM(price) FROM products WHERE X.product_id = product_id)),1)," TL") AS sumPrice,
	CONCAT(TRUNCATE(MAX((SELECT SUM(price) FROM products WHERE X.product_id = product_id)),1)," TL") AS maxPrice,
    CONCAT(TRUNCATE(AVG((SELECT SUM(price) FROM products WHERE X.product_id = product_id)),1)," TL") AS avgPrice

FROM (SELECT * FROM sales WHERE salesman_id IN 
		(SELECT salesman_id FROM salesmans WHERE YEAR(hire_date)>=2012 AND salary>1020)
	) as X
    
GROUP BY (SELECT category FROM products WHERE X.product_id = product_id)


SELECT UPPER(customer_name)
FROM customers
WHERE customer_id IN 
	(SELECT customer_id FROM sales WHERE product_id IN
    	(SELECT product_id FROM products
     	WHERE category IN ("c2","c3","c4","c5")
     	AND category IN 
         	(SELECT category FROM products GROUP BY category HAVING MAX(price)>15))
    );


SELECT UPPER(customer_name)
FROM customers
WHERE customer_id IN 
	(SELECT customer_id FROM sales WHERE product_id IN
    	(SELECT product_id FROM products
     	WHERE category IN ("c1","c3","c4")
     	AND category IN 
         	(SELECT category FROM products GROUP BY category HAVING MAX(price)<15))
    );


SELECT UPPER(customer_name)
FROM customers
WHERE customer_id IN 
	(SELECT customer_id FROM sales WHERE product_id IN
    	(SELECT product_id FROM products
     	WHERE category NOT IN ("c1","c3","c4")
     	AND category IN 
         	(SELECT category FROM products GROUP BY category HAVING MIN(price)>5))
    )
ORDER BY customers.customer_name;


SELECT (SELECT category FROM products WHERE X.product_id = product_id) as category,
	CONCAT(TRUNCATE(SUM((SELECT SUM(price) FROM products WHERE X.product_id = product_id)),0)," TL") AS sumPrice,
	CONCAT(TRUNCATE(MAX((SELECT SUM(price) FROM products WHERE X.product_id = product_id)),0)," TL") AS maxPrice,
    CONCAT(TRUNCATE(AVG((SELECT SUM(price) FROM products WHERE X.product_id = product_id)),0)," TL") AS avgPrice

FROM (SELECT * FROM sales WHERE salesman_id IN 
		(SELECT salesman_id FROM salesmans WHERE YEAR(hire_date)<2015 AND salary>1010)
	) as X
    
GROUP BY (SELECT category FROM products WHERE X.product_id = product_id)
ORDER BY sumPrice DESC


SELECT category,
    CONCAT(TRUNCATE(SUM(price),1)," TL")
FROM products
WHERE product_id IN (SELECT product_id FROM sales WHERE commission_ratio > 0.05)
GROUP BY category
ORDER BY SUM(price);


SELECT category,
	CONCAT(TRUNCATE(price,1)," TL"),
    CONCAT(TRUNCATE(price*1.08,1)," TL")
FROM products
WHERE product_id IN (SELECT product_id FROM sales WHERE commission_ratio >
                    	(SELECT AVG(commission_ratio) FROM sales )
                    )
GROUP BY category
ORDER BY 1.08*price;