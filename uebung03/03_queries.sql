-- 2a)
SELECT p.student.name FROM PruefungsergebnisTab p
WHERE p.vorlesung.name = 'Datenbanksysteme'
AND p.note < 2.0;

-- 2b)
SELECT s.name FROM StudierenderTab s
WHERE s.studiengang.fakultaet.dekan.name = 'Langweg';

-- 2c)
SELECT p.COLUMN_VALUE.name AS name
FROM FakultaetTab f, TABLE(f.professoren) p
WHERE f.name = 'Informatik';