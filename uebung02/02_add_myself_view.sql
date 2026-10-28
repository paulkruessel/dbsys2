CREATE OR REPLACE VIEW myself AS
SELECT * FROM pers
WHERE USER = db_username;

SELECT * FROM myself;