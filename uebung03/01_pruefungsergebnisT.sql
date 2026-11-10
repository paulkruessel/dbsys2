-- 1a)
CREATE OR REPLACE TYPE PruefungsergebnisT AS OBJECT
(pruefungsdatum Date,
vorlesung REF VorlesungT,
student REF StudierenderT,
note NUMBER(2,1)) FINAL;
/

-- 1b)
CREATE TABLE PruefungsergebnisTab OF PruefungsergebnisT
(vorlesung SCOPE IS VorlesungTab,
student SCOPE IS StudierenderTab,
CONSTRAINT chk_note CHECK (Note IN (1.0, 1.3, 1.7, 2.0, 2.3, 2.7, 3.0, 3.3, 3.7, 4.0, 5.0)));

