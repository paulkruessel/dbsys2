SELECT table_name
FROM user_tables
WHERE table_name IN(
    'TIME', 'STORE', 'PRODUCT',
    'CUSTOMER', 'SELLER', 'SALE'
)
ORDER BY table_name;