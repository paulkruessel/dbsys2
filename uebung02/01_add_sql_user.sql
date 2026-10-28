ALTER TABLE pers ADD (
    db_username varchar2(20) UNIQUE
);

UPDATE pers
SET db_username = 'DBSYS13'
WHERE pnr = 123;

commit;

SELECT pnr, name, vnr, db_username FROM pers;
