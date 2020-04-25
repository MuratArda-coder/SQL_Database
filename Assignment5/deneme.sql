SELECT category,
    TRUNCATE(SUM(price),1),
    TRUNCATE(MAX(price),1),
    TRUNCATE(AVG(price),1)
FROM products
WHERE  product_id IN 
	(SELECT product_id FROM sales WHERE salesman_id IN 
		(SELECT salesman_id FROM salesmans WHERE YEAR(hire_date)>=2012 AND salary>1020)
	)
GROUP BY category;


SELECT category IN (SELECT category FROM products WHERE product_id IN(
    		SELECT product_id FROM sales WHERE salesman_id IN
    			(SELECT salesman_id FROM salesmans WHERE YEAR(hire_date)>=2012 AND salary>1020)
    )) AS category,
    category,
    CONCAT(TRUNCATE(SUM(price),1)," TL"),
    CONCAT(TRUNCATE(MAX(price),1)," TL"),
    CONCAT(TRUNCATE(AVG(price),1)," TL")
FROM products
GROUP BY category




SELECT * 
FROM (SELECT product_id FROM sales WHERE salesman_id IN 
		(SELECT salesman_id FROM salesmans WHERE YEAR(hire_date)>=2012 AND salary>1020)
	) as X


SELECT X.product_id,
	SUM((SELECT SUM(price) FROM products WHERE X.product_id = product_id))

FROM (SELECT * FROM sales WHERE salesman_id IN 
		(SELECT salesman_id FROM salesmans WHERE YEAR(hire_date)>=2012 AND salary>1020)
	) as X


SUM((SELECT SUM(price) FROM products WHERE X.product_id = product_id))