CREATE TABLE Time (
    Time_ID NUMBER PRIMARY KEY,
    Sale_Date DATE NOT NULL,
    Month NUMBER(10,0) NOT NULL,
    CHECK (Month BETWEEN 1 AND 12),
    Year NUMBER(10,0) NOT NULL,
    CHECK (Year > 0),
    Quarter NUMBER(10,0) NOT NULL,
    CHECK (Quarter BETWEEN 1 AND 4)
);

CREATE TABLE Store (
    Store_ID NUMBER PRIMARY KEY,
    Store_Manager VARCHAR2(255) NOT NULL,
    District VARCHAR2(255) NOT NULL,
    Country VARCHAR2(255) NOT NULL,
    City VARCHAR2(255) NOT NULL
);

CREATE TABLE Product (
    Product_ID NUMBER PRIMARY KEY,
    Description VARCHAR2(255),
    Price NUMBER(10,2) NOT NULL,
    CHECK (Price > 0),
    Manufacturer VARCHAR2(255) NOT NULL,
    Manufacturer_Country VARCHAR2(255) NOT NULL,
    Product_Category VARCHAR2(255)
);

CREATE TABLE Customer (
    Customer_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(255) NOT NULL,
    Age NUMBER(10,0) NOT NULL,
    CHECK (Age > 0),
    Country VARCHAR2(255) NOT NULL
);

CREATE TABLE Seller (
    Seller_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(255) NOT NULL,
    Date_Of_Birth DATE NOT NULL,
    Expertise_Area VARCHAR2(255)
);

CREATE TABLE Sale(
    Sale_ID NUMBER PRIMARY KEY,
    Amount NUMBER(10, 0),
    CHECK (Amount > 0),
    Turnover NUMBER(10,2),

    Customer_ID NUMBER NOT NULL,
    CONSTRAINT fk_sale_customer
        FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID),

    Product_ID NUMBER NOT NULL,
    CONSTRAINT fk_sale_product
        FOREIGN KEY (Product_ID)
        REFERENCES Product(Product_ID),

    Seller_ID NUMBER NOT NULL,
    CONSTRAINT fk_sale_seller
        FOREIGN KEY (Seller_ID)
        REFERENCES Seller(Seller_ID),

    Store_ID NUMBER NOT NULL,
    CONSTRAINT fk_sale_store
        FOREIGN KEY (Store_ID)
        REFERENCES Store(Store_ID),

    Time_ID NUMBER NOT NULL,
    CONSTRAINT fk_sale_time
        FOREIGN KEY (Time_ID)
        REFERENCES Time(Time_ID)
);
