SELECT
    EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM seller.DATE_OF_BIRTH) AS AGE_OF_SELLER,
    t.Year,
    p.Product_Category,
    s.Turnover
FROM Sale s
JOIN Time t
    ON t.TIME_ID = s.TIME_ID
JOIN PRODUCT p
    ON p.PRODUCT_ID = s.PRODUCT_ID
JOIN SELLER seller
    ON seller.SELLER_ID = s.SELLER_ID;