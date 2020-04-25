SELECT YEAR(hire_date),
	CONCAT(TRUNCATE(SUM(salary),1)," TL"),
    CONCAT(TRUNCATE(MAX(salary),1)," TL"),
    CONCAT(TRUNCATE(AVG(salary),1)," TL")
FROM salesmans
WHERE YEAR(hire_date)>2012 
GROUP BY YEAR(hire_date)
HAVING MAX(salary)>1000;



SELECT YEAR(hire_date),
	CONCAT(TRUNCATE(SUM(salary),0)," TL"),
    CONCAT(TRUNCATE(MIN(salary),0)," TL"),
    CONCAT(TRUNCATE(AVG(salary),0)," TL")
FROM salesmans
WHERE YEAR(hire_date) BETWEEN 2014 AND 2017
GROUP BY YEAR(hire_date)
HAVING MAX(salary)>1000;



SELECT category,
	CONCAT(TRUNCATE(SUM(price),1)," TL"),
    CONCAT(TRUNCATE(MAX(price),1)," TL"),
    CONCAT(TRUNCATE(AVG(price),1)," TL")
FROM products
WHERE category IN ("c1","c2","c4")
GROUP BY category
HAVING MAX(price)>20;



SELECT YEAR(hire_date) AS YEAR_OF_HIRE,
	CONCAT(ROUND(SUM(salary),1)," TL") AS TOTAL_SALARY,
    CONCAT(ROUND(MIN(salary),1)," TL") AS MINIMUM_SALARY,
    CONCAT(ROUND(AVG(salary),1)," TL") AS AVERAGE_SALARY
FROM salesmans
WHERE YEAR(hire_date) BETWEEN 2012 AND 2016
GROUP BY YEAR(hire_date)
HAVING SUM(salary) > 1500
ORDER BY SUM(salary);



SELECT UPPER(category),
	CONCAT(TRUNCATE(SUM(price),0)," TL"),
    CONCAT(TRUNCATE(MAX(price),0)," TL"),
    CONCAT(TRUNCATE(MIN(price),0)," TL"),
    CONCAT(TRUNCATE(AVG(price),0)," TL")  
FROM products
WHERE category IN ("c1","c3","c4")
GROUP BY category
HAVING SUM(price) > 25
ORDER BY category DESC;


SELECT YEAR(sale_date) AS SALE_YEAR,
	CONCAT(ROUND(AVG(commission_ratio),3)," TL") AS AVERAGE_COMMISSION
FROM sales
WHERE sale_date<"2015-02-01"
GROUP BY MONTH(sale_date)
HAVING AVG(commission_ratio) > 0.02;

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));