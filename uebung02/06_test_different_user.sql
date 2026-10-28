-- Change db username of mueller to something else
UPDATE pers
SET db_username = 'DBSYS09'
WHERE pnr = 123;

commit;

-- run these tests as the new account, as this is now not owner of the views
-- read own data, expected: 1 row (Mueller)
SELECT * FROM dbsys13.myself;

-- read direct subordinates, expected: Coy, Schmidt, Junghans
SELECT * FROM dbsys13.mypers;

-- change own beruf, expected: 1 row updated
UPDATE dbsys13.myself
SET beruf = 'Fullstack Developer';
SELECT * FROM dbsys13.myself;

-- change own gehalt via myself, expected: ERROR insufficient privileges
-- (gehalt is not in GRANT UPDATE on myself)
UPDATE dbsys13.myself
SET gehalt = 1000000;

-- change own gehalt via mypers, expected: 0 rows updated
-- (Mueller is not his own supervisor, so he is not in mypers)
UPDATE dbsys13.mypers
SET gehalt = 1000000
WHERE pnr = 123;

-- change gehalt of direct subordinate, expected: 1 row updated
UPDATE dbsys13.mypers
SET gehalt = 85000
WHERE pnr = 406;

-- change gehalt of indirect subordinate, expected: 0 rows updated
UPDATE dbsys13.mypers
SET gehalt = 25000
WHERE pnr = 874;

-- change name of subordinate, expected: ERROR insufficient privileges
-- (only gehalt, anr, vnr are granted on mypers)
UPDATE dbsys13.mypers
SET name = 'Hacker'
WHERE pnr = 406;

-- access base table directly, expected: ERROR table or view does not exist
UPDATE dbsys13.pers
SET gehalt = 1000000
WHERE pnr = 123;

SELECT * FROM dbsys13.mypers;
SELECT * FROM dbsys13.myself;

rollback;

-- reset db_username of mueller
UPDATE pers
SET db_username = 'DBSYS13'
WHERE pnr = 123;

commit;
