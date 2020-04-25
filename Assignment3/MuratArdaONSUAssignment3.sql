SELECT UPPER(product_name) AS NAME,category AS PRODUCT_CATEGORY,
IF(price<20,'LOWER THAN 20 TL',CONCAT(ROUND(price,-1),' TL')) AS PRODUCT_PRICE
FROM products
WHERE (category IN ('c1','c2','c5')) AND (price BETWEEN 10.00 AND 40.00)
ORDER BY price;

SELECT UPPER(salesman_name) AS NAME,DATE_FORMAT(hire_date,'%d/%m/%Y') AS HIREDATE,IF(salary<1000,'SMALLER THAN 1000 TL',
	CONCAT(TRUNCATE(salary,1),' TL')) AS SALESMAN_SALARY,
	IF(salary*12<1000,'SMALLER THAN 1000 TL',CONCAT(TRUNCATE(salary*12,1),' TL')) AS ANNUAL_SALARY
FROM salesmans
WHERE YEAR(CURDATE())-YEAR(hire_date)<=6 OR (salary BETWEEN 850 AND 1100)
ORDER BY hire_date