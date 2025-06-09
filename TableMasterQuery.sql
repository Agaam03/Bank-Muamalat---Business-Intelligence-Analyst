WITH
    master_table AS (
        SELECT
            O.Date AS order_date,
            PC.CategoryName AS category_name,
            P.ProdName AS product_name,
            P.Price AS product_price,
            O.Quantity AS order_qty,
            (P.Price * O.Quantity) AS total_sales,
            C.CustomerEmail AS cust_email,
            C.CustomerCity AS cust_city
        FROM
            `big-bison-462208-i7.rakamin.customers` AS C
            RIGHT JOIN `big-bison-462208-i7.rakamin.orders` AS O ON C.CustomerID = O.CustomerID
            LEFT JOIN `big-bison-462208-i7.rakamin.products` AS P ON O.ProdNumber = P.ProdNumber
            RIGHT JOIN `big-bison-462208-i7.rakamin.productcategory` AS PC ON P.Category = PC.CategoryID
    )

SELECT * FROM master_table ORDER BY master_table.order_date;