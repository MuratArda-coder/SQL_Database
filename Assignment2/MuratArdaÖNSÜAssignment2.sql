SELECT product_id as PRD_ID, customer_id as CUSTOMER_ID, 
sale_date as SALE_DATE, commission_ratio
FROM sales
WHERE (sale_date<2016) OR (sale_id NOT IN (1,6,2))
ORDER BY sale_date,commission_ratio DESC;

SELECT *
FROM salesmans
WHERE (salesman_name LIKE ("_e%")) AND (hire_date>01-01-2012)
ORDER BY salary;

SELECT product_name as PRODUCT_NAME, category as CAT, 
price*1.08 as PR_VAT
FROM products
WHERE (category IN ('c1','c4','c5')) OR (price*1.08>16)
ORDER BY PR_VAT DESC;

SELECT salesman_name as SALESMAN_NAME, hire_date as HIREDATE,
salary as OLD_SALARY, 12*salary as OLD_ANNUAL_SALARY,
salary+salary*0.25 as NEW_SALARY, 
(12*(salary+salary*0.25)) as NEW_ANNUAL_SALARY
FROM salesmans
WHERE (hire_date>=2013-00-00 AND hire_date<=2015-00-00) OR 
(salary+salary*0.25)>1000
ORDER BY NEW_ANNUAL_SALARY, salesman_name;



