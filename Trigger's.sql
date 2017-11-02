/*Disparador: Es un objeto de Base de Datos. Es decir, tambien se guarda como las tablas y los procedimientos almacenados
Un disparador debe su nombre a que se "dispara" cuando se ejecuta la accion en la cual se programa
Nota: Los DML nunca se aplican sobre la sentencia SELECT
Los disparadores solo trabajan con INSERT UPDATE y DELETE
Los DML tienen 2 subcategorias:
BEFORE: Normalmente ocupan para validar
AFTER: Normalmente se ocupan para automatizar y se necesita una tabla siempre
Ejemplo #1 de disparador tipo Before 
*/
--Paso 1:Generar la tabla

CREATE TABLE MAYORES(ID INTEGER PRIMARY KEY,
                     NOMBRE VARCHAR2(60),
                     EDAD INTEGER);

---Paso 2: Problema: Generar un disparador que impida registrar usuarios menores de edad en la tabla MAYORES

CREATE OR REPLACE TRIGGER DISP_MAYORES BEFORE INSERT ON MAYORES
FOR EACH ROW ---Este es para garantizar que dispare en cada fila, si se ejecuta un cursor
BEGIN  
IF:NEW.EDAD<18 THEN
raise_application_error(-20000, 'EDAD INCORRECTA');---Esto es una excepcion de ORACLE
END IF;
END;
/

INSERT INTO MAYORES VALUES(1,'JUAN',20);
SELECT * FROM MAYORES;
INSERT INTO MAYORES VALUES(2,'ANNA',16);
SELECT * FROM MAYORES;

--Ejercicio #2 Disparador de tipo BEFORE con operacion UPDATE
--Paso 1 Generar la tabla

CREATE TABLE NOMINA(ID INTEGER PRIMARY KEY,
                    SUELDO_BASE FLOAT,
                    HORAS_LABORADAS INTEGER,
                    DEPOSITO FLOAT);

/*PASO 2 GUARDAR LOS SIGUIENTES 2 REGISTROS
    ID=1, SUELDO_BASE=2000, HORAS_LABORADAS=20, DEPOSITO=28000
    ID=2, SUELDO_BASE=1000, HORAS_LABORADAS=16, DEPOSITO=50000
*/

INSERT INTO NOMINA VALUES(1,2000,20,28000);
INSERT INTO NOMINA VALUES(2,1000,16,50000);
SELECT * FROM NOMINA;

/*PROBLEMA: Para cada trabajador se necesita actualizar su deposito de la siguiente manera:
            DEPOSITO=DEPOSITO+HORAS_LABORADAS*SUELDO_BASE
    UTILIZA UN DISPARADOR PARA QUE LLEVE A CABO DICHA ACTUALIZACION
*/

CREATE OR REPLACE TRIGGER DISP_NOMINA BEFORE UPDATE ON NOMINA
FOR EACH ROW
BEGIN
---INICIAMOS LA LOGICA DEL DISPARADOR
:NEW.DEPOSITO:= :OLD.DEPOSITO+:NEW.HORAS_LABORADAS * :OLD.SUELDO_BASE;
END;
/

---EJERCICIO:PROBAR QUE FUNCIONA PARA EL UPDATE DEL REGISTRO CUYO ID=1 CONSIDERAR LAS HORAS LABORADAS=20

UPDATE NOMINA SET HORAS_LABORADAS=20 WHERE ID=1;

SELECT * FROM NOMINA;
