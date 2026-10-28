-- Change own info, should be possible
UPDATE myself
SET beruf = 'Fullstack Developer';

-- change gehalt of direct subordinate should be possible
UPDATE mypers
SET gehalt = 85000
WHERE pnr = 406;

-- change gehalt of indirect subordinate should not be possible
UPDATE mypers
SET gehalt = 25000
WHERE pnr = 874;

-- change own gehalt should not be possible on mypers and myself views
UPDATE mypers
SET gehalt = 1000000
WHERE pnr = 123;
UPDATE myself
SET gehalt = 200000;
-- works on myself views because my account is the owner of that view.

SELECT * FROM pers;
rollback;