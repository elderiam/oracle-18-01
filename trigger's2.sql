---Ejemplo trigger de tipo AFTER
---PASO #1 Crear la tabla 

CREATE TABLE PRIMERA(ID INTEGER PRIMARY KEY,
                     NOMBRE VARCHAR2(60),
                     EDAD INTEGER);

/*Crear un respaldo con la siguiente logica
a). Si un registro tiene una edad menor a 18, debera guardarse en una tabla de respaldo llamada "RESPALDO_MENORES".
b). Si un registro tiene una edad mayor o igual a 18 debera guardarse en una tabla llaada "RESPALDO_MAYORES".*/

CREATE TABLE RESPALDO_MENORES(ID INTEGER,
                              NOMBRE VARCHAR2(60),
                              EDAD INTEGER);
                              
CREATE TABLE RESPALDO_MAYORES(ID INTEGER,
                              NOMBRE VARCHAR2(60),
                              EDAD INTEGER);
                              
CREATE OR REPLACE TRIGGER DISP_PRIMERA AFTER INSERT ON PRIMERA
FOR EACH ROW
BEGIN
    IF :NEW.EDAD<18 THEN
        INSERT INTO RESPALDO_MENORES VALUES(:NEW.ID, :NEW.NOMBRE, :NEW.EDAD);
    ELSE
        INSERT INTO RESPALDO_MAYORES VALUES(:NEW.ID, :NEW.NOMBRE, :NEW.EDAD);
    END IF;
    END;
    /

--PASO #2 Comprobar que funciona
INSERT INTO PRIMERA VALUES(1,'JUAN',20);
INSERT INTO PRIMERA VALUES(2,'ANA',17);
SELECT * FROM PRIMERA;
SELECT * FROM RESPALDO_MAYORES;
SELECT * FROM RESPALDO_MENORES;

