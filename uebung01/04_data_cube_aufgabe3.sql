CREATE TABLE Verkauf_2DC AS
WITH Sales_With_Age AS (
    SELECT
        c.Age - (
            EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM t.Sale_Date)
        ) AS Customer_Age,
        p.Product_Category,
        s.Amount
    FROM Sale s
    JOIN Customer c
        ON c.Customer_ID = s.Customer_ID
    JOIN Time t
        ON t.Time_ID = s.Time_ID
    JOIN Product p
        ON p.Product_ID = s.Product_ID
    WHERE t.Year >= 2020
)
SELECT
    CASE
        WHEN GROUPING(Customer_Age) = 1 THEN 'alle'
        ELSE TO_CHAR(Customer_Age)
    END AS Customer_Age,
    CASE
        WHEN GROUPING(Product_Category) = 1 THEN 'alle'
        ELSE Product_Category
    END AS Product_Category,
    NVL(SUM(Amount), 0) AS TOTAL_AMOUNT
FROM Sales_With_Age
GROUP BY CUBE (Product_Category, Customer_Age);

SELECT * FROM VERKAUF_2DC;