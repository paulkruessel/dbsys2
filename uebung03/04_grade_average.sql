-- 3a)

CREATE OR REPLACE TYPE BODY StudierenderT AS
    MEMBER FUNCTION getNotenschnitt RETURN FLOAT IS
        schnitt FLOAT;
    BEGIN
        SELECT AVG(p.note) INTO schnitt
        FROM PruefungsergebnisTab p
        WHERE p.student.matrikelnummer = SELF.matrikelnummer;
        RETURN schnitt;
    END;
END;
/

-- 3b)

SELECT s.matrikelnummer, s.name, s.getNotenschnitt() AS notenschnitt
FROM StudierenderTab s;