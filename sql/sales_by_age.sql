SELECT 
    CASE 
        WHEN C.birthDate IS NOT NULL THEN TIMESTAMPDIFF(YEAR, C.birthDate, CURDATE())
        ELSE NULL
    END AS age,
    CASE 
        WHEN SUM(S.totalPrice) BETWEEN 0 AND 29999 THEN '0-29,999'
        WHEN SUM(S.totalPrice) BETWEEN 30000 AND 59999 THEN '30,000-59,999'
        WHEN SUM(S.totalPrice) BETWEEN 60000 AND 99999 THEN '60,000-99,999'
        WHEN SUM(S.totalPrice) BETWEEN 100000 AND 199999 THEN '100,000-199,999'
        WHEN SUM(S.totalPrice) >= 200000 THEN '200,000 and above'
    END AS sales_range,
    COUNT(S.id) AS total_receipts
FROM Sales S
JOIN Customer C ON S.customerId = C.id
GROUP BY 
    age, sales_range
ORDER BY sales_range, age;
