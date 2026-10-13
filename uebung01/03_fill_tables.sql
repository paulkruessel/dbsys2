INSERT INTO Store (Store_ID, Store_Manager, City, District, Country)
VALUES 
    (1, 'Max', 'Berlin', 'Berlin', 'Germany'),
    (2, 'Hans', 'Hamburg', 'Hamburg', 'Germany'),
    (3, 'Tom', 'Muenchen', 'Bayern', 'Germany');

INSERT INTO Product
    (Product_ID, Description, Price, Manufacturer,
     Manufacturer_Country, Product_Category)
VALUES
    (1, 'Galaxy S25', 799.00, 'Samsung', 'South Korea', 'Handy'),
    (2, 'iPhone 16', 899.00, 'Apple', 'USA', 'Handy'),
    (3, 'OLED C5', 1299.00, 'LG', 'South Korea', 'TV'),
    (4, 'Bravia 8', 1199.00, 'Sony', 'Japan', 'TV'),
    (5, 'DVD Player DVP', 79.00, 'Sony', 'Japan', 'DVD'),
    (6, 'DVD Player DP132', 49.00, 'LG', 'South Korea', 'DVD'),
    (7, 'EOS R50', 749.00, 'Canon', 'Japan', 'Foto'),
    (8, 'Alpha 6400', 849.00, 'Sony', 'Japan', 'Foto');

INSERT INTO Customer (Customer_ID, Name, Age, Country)
VALUES
    (1, 'Anna Mueller', 25, 'Germany'),
    (2, 'Max Schmidt', 32, 'Germany'),
    (3, 'Lisa Weber', 22, 'Germany'),
    (4, 'Paul Fischer', 45, 'Germany'),
    (5, 'Sarah Becker', 28, 'Austria');

INSERT INTO Seller
    (Seller_ID, Name, Date_Of_Birth, Expertise_Area)
VALUES
    (1, 'Tim Wagner', DATE '2002-04-15', 'Electronics'),
    (2, 'Julia Hoffmann', DATE '1995-08-22', 'Mobile Devices'),
    (3, 'Markus Braun', DATE '1980-02-10', 'Television'),
    (4, 'Sophie Keller', DATE '2005-11-03', 'Photography');

INSERT INTO Time
    (Time_ID, Sale_Date, Month, Year, Quarter)
VALUES
    (1, DATE '2020-03-15', 3, 2020, 1),
    (2, DATE '2020-11-22', 11, 2020, 4),
    (3, DATE '2021-06-10', 6, 2021, 2),
    (4, DATE '2021-12-05', 12, 2021, 4),
    (5, DATE '2022-04-18', 4, 2022, 2),
    (6, DATE '2022-09-12', 9, 2022, 3),
    (7, DATE '2023-02-25', 2, 2023, 1),
    (8, DATE '2023-08-14', 8, 2023, 3),
    (9, DATE '2024-05-20', 5, 2024, 2),
    (10, DATE '2024-10-08', 10, 2024, 4),
    (11, DATE '2025-03-17', 3, 2025, 1),
    (12, DATE '2026-07-09', 7, 2026, 3);

INSERT INTO Sale
    (Sale_ID, Customer_Age, Amount, Turnover,
     Customer_ID, Product_ID, Seller_ID, Store_ID, Time_ID)
VALUES
    (1, 19, 2, 1598.00, 1, 1, 1, 1, 1),
    (2, 26, 1, 1299.00, 2, 3, 3, 2, 2),
    (3, 17, 3, 2697.00, 3, 2, 2, 3, 3),
    (4, 39, 1, 79.00, 4, 5, 3, 1, 4),

    (5, 21, 1, 749.00, 1, 7, 4, 2, 5),
    (6, 24, 2, 1598.00, 5, 1, 1, 3, 6),
    (7, 28, 1, 1199.00, 2, 4, 3, 1, 7),
    (8, 19, 2, 98.00, 3, 6, 2, 2, 8),

    (9, 23, 1, 899.00, 1, 2, 1, 3, 9),
    (10, 43, 2, 1698.00, 4, 8, 4, 1, 10),
    (11, 27, 1, 1299.00, 5, 3, 3, 2, 11),
    (12, 25, 2, 1598.00, 1, 1, 1, 3, 12),

    (13, 19, 1, 799.00, 3, 1, 4, 1, 8),
    (14, 30, 2, 98.00, 2, 6, 2, 2, 9),
    (15, 25, 1, 749.00, 5, 7, 4, 3, 12),
    (16, 44, 1, 1199.00, 4, 4, 3, 1, 11);

COMMIT;

SELECT 'STORE' AS Table_Name, COUNT(*) AS Anzahl FROM Store
UNION ALL
SELECT 'PRODUCT', COUNT(*) FROM Product
UNION ALL
SELECT 'CUSTOMER', COUNT(*) FROM Customer
UNION ALL
SELECT 'SELLER', COUNT(*) FROM Seller
UNION ALL
SELECT 'TIME', COUNT(*) FROM Time
UNION ALL
SELECT 'SALE', COUNT(*) FROM Sale;