#A
SELECT 	UPPER(customers.customer_name),
	UPPER(salesmans.salesman_name),
        UPPER(products.product_name),
        sales.sale_date,
        CONCAT(price+price*sales.commission_ratio," TL") AS total_price,
        CONCAT((price+price*sales.commission_ratio)*1.08," TL") AS total_price_with_VAT
FROM 	sales

	INNER JOIN customers
        ON customers.customer_id = sales.customer_id
        
        INNER JOIN products
        ON products.product_id = sales.product_id
        
        INNER JOIN salesmans
        ON salesmans.salesman_id = sales.salesman_id
WHERE	price+price*sales.commission_ratio>15;



#B
SELECT  UPPER(customers.customer_name),
        UPPER(salesmans.salesman_name),
        UPPER(products.product_name),
        sales.sale_date,
        CONCAT(price+price*sales.commission_ratio," TL") AS total_price,
        CONCAT((price+price*sales.commission_ratio)*1.18," TL") AS total_price_with_VAT
FROM    sales

        INNER JOIN customers
        ON customers.customer_id = sales.customer_id
        
        INNER JOIN products
        ON products.product_id = sales.product_id
        
        INNER JOIN salesmans
        ON salesmans.salesman_id = sales.salesman_id

WHERE   salesmans.salesman_name = "Deniz";



#C
SELECT  UPPER(customers.customer_name),
        UPPER(salesmans.salesman_name),
        UPPER(products.product_name),
        sales.sale_date,
        CONCAT(price+price*sales.commission_ratio," TL") AS total_price,
        CONCAT((price+price*sales.commission_ratio)*1.08," TL") AS total_price_with_VAT
FROM    sales

        INNER JOIN customers
        ON customers.customer_id = sales.customer_id
        
        INNER JOIN products
        ON products.product_id = sales.product_id
        
        INNER JOIN salesmans
        ON salesmans.salesman_id = sales.salesman_id

WHERE   salesmans.salesman_name = "Ali";



#D
SELECT  sales.sale_id,
        UPPER(customers.customer_name),
        UPPER(salesmans.salesman_name),
        UPPER(products.product_name),
        UPPER(products.category),
        sales.sale_date,
        CONCAT(price," TL") AS price,
        CONCAT(price+price*sales.commission_ratio," TL") AS total_price
FROM    sales

        INNER JOIN customers
        ON customers.customer_id = sales.customer_id
        
        INNER JOIN products
        ON products.product_id = sales.product_id
        
        INNER JOIN salesmans
        ON salesmans.salesman_id = sales.salesman_id;



#E
SELECT  UPPER(sal.salesman_name),
                sal.hire_date,
        CONCAT((sal.salary)," TL") AS salary,
        (SELECT COUNT(salesmans.salesman_name) FROM salesmans INNER JOIN sales ON sales.salesman_id = salesmans.salesman_id
                WHERE sal.salesman_id = sales.salesman_id
        ) AS SaleCount
         
FROM salesmans as sal;



#F
SELECT  UPPER(customers.customer_name) AS CustomerName,
        UPPER(products.category) AS Category,
        UPPER(products.product_name) AS ProductName,
        CONCAT(products.price," TL") AS price,
        
        CONCAT((SELECT IF(COUNT(price)=0,0,price+(price*commission_ratio)) 
                FROM products INNER JOIN sales ON sales.product_id = products.product_id
                WHERE sl.product_id=sales.product_id)," TL") AS TotalPriceOfThisProduct,
            
        CONCAT((SELECT IF(COUNT(price)=0,0,(products.price+(products.price*sales.commission_ratio))*1.08) 
                FROM products INNER JOIN sales ON sales.product_id = products.product_id
                WHERE sl.product_id=sales.product_id)," TL") AS TotalPriceOfThisProduct,
        
        DATE_FORMAT(sl.sale_date,'%m/%d/%Y') AS saleDate
FROM sales AS sl
        INNER JOIN customers
        ON customers.customer_id = sl.customer_id

        INNER JOIN salesmans
        ON salesmans.salesman_id = sl.salesman_id
        
        INNER JOIN products
        ON products.product_id = sl.product_id
WHERE customers.customer_name = "Ayşe"

UNION ALL

SELECT  UPPER(customers.customer_name),
        "TOTAL",
        "",
        "",
        
        CONCAT(SUM((SELECT IF(COUNT(price)=0,0,price+(price*commission_ratio)) 
                FROM products INNER JOIN sales ON sales.product_id = products.product_id
                WHERE sl.product_id=sales.product_id))," TL") AS TotalPriceOfThisProduct,
            
        CONCAT(SUM((SELECT IF(COUNT(price)=0,0,(products.price+(products.price*sales.commission_ratio))*1.08) 
                FROM products INNER JOIN sales ON sales.product_id = products.product_id
                WHERE sl.product_id=sales.product_id))," TL") AS TotalPriceOfThisProduct,
        
        ""
FROM sales AS sl
        INNER JOIN customers
        ON customers.customer_id = sl.customer_id

        INNER JOIN salesmans
        ON salesmans.salesman_id = sl.salesman_id
        
        INNER JOIN products
        ON products.product_id = sl.product_id
WHERE customers.customer_name = "Ayşe"