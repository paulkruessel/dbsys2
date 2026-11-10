-- 1c)
-- Professoren
INSERT INTO ProfessorTab VALUES (ProfessorT('Langweg', 'IT-Sicherheit',        'F003'));
INSERT INTO ProfessorTab VALUES (ProfessorT('Eck',     'Datenbanken',          'O106'));
INSERT INTO ProfessorTab VALUES (ProfessorT('Boger',   'Software Engineering', 'O205'));
INSERT INTO ProfessorTab VALUES (ProfessorT('Laube',   'Cloud Native AI',      'O205'));

-- Fakultäten
INSERT INTO FakultaetTab VALUES (FakultaetT('Informatik',
    (SELECT REF(p) FROM ProfessorTab p WHERE p.name = 'Langweg'),
    ProfessorenVA(
        (SELECT REF(p) FROM ProfessorTab p WHERE p.name = 'Langweg'),
        (SELECT REF(p) FROM ProfessorTab p WHERE p.name = 'Eck'),
        (SELECT REF(p) FROM ProfessorTab p WHERE p.name = 'Boger'),
        (SELECT REF(p) FROM ProfessorTab p WHERE p.name = 'Laube'))));

INSERT INTO FakultaetTab VALUES (FakultaetT('Wirtschaft', NULL, ProfessorenVA()));

-- Studiengänge
INSERT INTO StudiengangTab VALUES (StudiengangT('Angewandte Informatik',
    (SELECT REF(f) FROM FakultaetTab f WHERE f.name = 'Informatik')));
INSERT INTO StudiengangTab VALUES (StudiengangT('Wirtschaftsinformatik',
    (SELECT REF(f) FROM FakultaetTab f WHERE f.name = 'Informatik')));
INSERT INTO StudiengangTab VALUES (StudiengangT('BWL',
    (SELECT REF(f) FROM FakultaetTab f WHERE f.name = 'Wirtschaft')));

-- Studierende
INSERT INTO StudierenderTab VALUES (StudierenderT('Maier',  '123456',
    (SELECT REF(s) FROM StudiengangTab s WHERE s.name = 'Angewandte Informatik')));
INSERT INTO StudierenderTab VALUES (StudierenderT('Müller', '123999',
    (SELECT REF(s) FROM StudiengangTab s WHERE s.name = 'Angewandte Informatik')));
INSERT INTO StudierenderTab VALUES (StudierenderT('Kunz',   '123777',
    (SELECT REF(s) FROM StudiengangTab s WHERE s.name = 'Wirtschaftsinformatik')));
INSERT INTO StudierenderTab VALUES (StudierenderT('Schulz', '124555',
    (SELECT REF(s) FROM StudiengangTab s WHERE s.name = 'BWL')));

-- Vorlesungen
INSERT INTO VorlesungTab VALUES (VorlesungT('Datenbanksysteme',
    (SELECT REF(p) FROM ProfessorTab p WHERE p.name = 'Eck')));
INSERT INTO VorlesungTab VALUES (VorlesungT('Software Engineering',
    (SELECT REF(p) FROM ProfessorTab p WHERE p.name = 'Boger')));
INSERT INTO VorlesungTab VALUES (VorlesungT('IT-Sicherheit',
    (SELECT REF(p) FROM ProfessorTab p WHERE p.name = 'Langweg')));
INSERT INTO VorlesungTab VALUES (VorlesungT('Cloud Native AI',
    (SELECT REF(p) FROM ProfessorTab p WHERE p.name = 'Laube')));

-- Prüfungsergebnisse
INSERT INTO PruefungsergebnisTab
SELECT PruefungsergebnisT(DATE '2026-07-15', REF(v), REF(s), 1.3)
FROM VorlesungTab v, StudierenderTab s
WHERE v.name = 'Datenbanksysteme' AND s.name = 'Maier';

INSERT INTO PruefungsergebnisTab
SELECT PruefungsergebnisT(DATE '2026-07-20', REF(v), REF(s), 2.0)
FROM VorlesungTab v, StudierenderTab s
WHERE v.name = 'Software Engineering' AND s.name = 'Maier';

INSERT INTO PruefungsergebnisTab
SELECT PruefungsergebnisT(DATE '2026-07-15', REF(v), REF(s), 2.3)
FROM VorlesungTab v, StudierenderTab s
WHERE v.name = 'Datenbanksysteme' AND s.name = 'Müller';

INSERT INTO PruefungsergebnisTab
SELECT PruefungsergebnisT(DATE '2026-07-20', REF(v), REF(s), 1.7)
FROM VorlesungTab v, StudierenderTab s
WHERE v.name = 'Software Engineering' AND s.name = 'Müller';

INSERT INTO PruefungsergebnisTab
SELECT PruefungsergebnisT(DATE '2026-07-24', REF(v), REF(s), 2.3)
FROM VorlesungTab v, StudierenderTab s
WHERE v.name = 'IT-Sicherheit' AND s.name = 'Müller';

INSERT INTO PruefungsergebnisTab
SELECT PruefungsergebnisT(DATE '2026-07-15', REF(v), REF(s), 1.3)
FROM VorlesungTab v, StudierenderTab s
WHERE v.name = 'Datenbanksysteme' AND s.name = 'Kunz';

INSERT INTO PruefungsergebnisTab
SELECT PruefungsergebnisT(DATE '2026-07-24', REF(v), REF(s), 2.3)
FROM VorlesungTab v, StudierenderTab s
WHERE v.name = 'IT-Sicherheit' AND s.name = 'Kunz';

INSERT INTO PruefungsergebnisTab
SELECT PruefungsergebnisT(DATE '2026-07-22', REF(v), REF(s), 2.7)
FROM VorlesungTab v, StudierenderTab s
WHERE v.name = 'Cloud Native AI' AND s.name = 'Schulz';

COMMIT;