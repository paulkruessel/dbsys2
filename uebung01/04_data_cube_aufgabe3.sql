CREATE TABLE Verkauf_2DC AS
SELECT 
    CASE
        WHEN GROUPING(s.CUSTOMER_AGE) = 1 THEN 'alle'
        ELSE TO_CHAR(s.Customer_Age)
    END AS Customer_Age,
    CASE
        WHEN GROUPING(p.Product_Category) = 1 THEN 'alle'
        ELSE p.Product_Category
    END AS Product_Category,
    NVL(SUM(s.Amount), 0) AS TOTAL_AMOUNT
FROM Sale s
JOIN Time t
    ON t.Time_ID = s.Time_ID
JOIN Product p
    ON p.Product_ID = s.Product_ID
WHERE t.Year >= 2020
GROUP BY CUBE (p.PRODUCT_CATEGORY, s.CUSTOMER_AGE);

SELECT * FROM VERKAUF_2DC;