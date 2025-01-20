SELECT 
    YEAR(S.dateTime) AS year,
    MONTH(S.dateTime) AS month,
    E.name AS employee_name,
    P.type AS product_type,
    SUM(SI.subtotal) AS total_sales
FROM Sales S
JOIN SalesItem SI ON S.id = SI.salesId
JOIN Product P ON SI.productId = P.id
JOIN Employee E ON S.employeeId = E.id
GROUP BY 
    YEAR(S.dateTime), 
    MONTH(S.dateTime),
    E.name,
    P.type
ORDER BY year, month, E.name, P.type;
