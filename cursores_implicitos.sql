CREATE TABLE CARTERA_CLIENTES (ID INTEGER PRIMARY KEY, NOMBRE VARCHAR2(40), EDAD INTEGER, SUELDO_BASE FLOAT);

---INSERTAMOS DATOS
INSERT INTO CARTERA_CLIENTES VALUES(1,'JUAN',25,60000);
INSERT INTO CARTERA_CLIENTES VALUES(2,'ANA',45,40000);
INSERT INTO CARTERA_CLIENTES VALUES(3,'PEDRO',32,40000);
INSERT INTO CARTERA_CLIENTES VALUES(4,'IRMA',45,70000);
INSERT INTO CARTERA_CLIENTES VALUES(5,'LUIS',55,20000);

    SELECT * FROM CARTERA_CLIENTES;
    
---EJERCICIO 1
---ESCRIBIR UN CURSOR IMPLICITO QUE OBTENGA EL SUELDO_BASE DE EL REGISTRO QUE TIENE ID=3, UNA VEZ OBTENIDO QUE MULTIPLIQUE EL SUELDO_BASE POR 20 
--HORAS LABORADAS Y LO ASIGNE A UNA VARIABLE LOCAL LLAMADA PAGO_NOMINA. IMPRIMIR EL RESULTADO DE ESA VARIABLE

    DECLARE
    SUELDO FLOAT;
    PAGO_NOMINA FLOAT;
    BEGIN

--DECLARAMOS EL CURSOR IMPLICITO 
    SELECT SUELDO_BASE INTO SUELDO FROM CARTERA_CLIENTES WHERE ID=3;
    PAGO_NOMINA:=SUELDO*20;
    DBMS_OUTPUT.PUT_LINE('EL PAGO ES '||PAGO_NOMINA);
    END;
    /
    SET SERVEROUTPUT ON;
    
--EJERCICIO #2
--GENERAR LA SIGUIENTE TABLA EN ORACLE QUE TENGA SU CAMPO PRIMARY KEY AUTO INCREMENTADO DE 2 EN 2 EMPEZANDO DESDE EL 1.
--ES DECIR LLEVARA LA SECUENCIA 1,3,5,7,9...ETC,

---***NOTA: EN ORACLE NO EXISTE EL auto_increment*** 
---EN ORACLE PARA AUTO INCREMENTAR UN PRIMARY KEY SE DEBE USAR OTRO OBJETO DE BASE DE DATOS LLAMADO *SECUENCIA*


---  1. CREAMOS LA TABLA
    CREATE TABLE NOMINAS(ID_NOMINA INTEGER PRIMARY KEY, NOMBRE VARCHAR2(60));
    
---  2. GENERAR UNA SECUENCIA
    CREATE SEQUENCE SEC_NOMINAS
    START WITH 1 
    INCREMENT BY 2
    NOMAXVALUE;
    
---  3. CREAR EL PROCEDIMIENTO DE ENLACE DE TABLA Y SECUENCIA 

    ---REGLA: LOS ARGUMENTOS SON LOS MISMOS EN EL PROCEDIMIENTO SI SON 2 PONES 2
    ---REGLA: ARGUMENTO PK ES SIEMPRE DE TIPO OUT Y LOS ARGUMENTOS RESTANTES IN
    ---REGLA: LOS TIPOS DE DATOS DEBEN DE COINCIDIR CON EL MISMO TIPO DE DATOS DE LA COLUMNA, PERO SIN QUE SEAN LOS MISMOS NOMBRES
    ---REGLA: LOS ARGUMENTOS DEBEN DE SER EN EL MISMO ORDEN CON EL QUE SON DECLARADOS EN LA TABLA 
    
    CREATE OR REPLACE PROCEDURE GUARDAR_NOMINA(MY_ID OUT INTEGER, MY_NOMBRE IN VARCHAR2)
    AS
    BEGIN
    SELECT SEC_NOMINAS.NEXTVAL INTO MY_ID FROM DUAL;
    INSERT INTO NOMINAS VALUES(MY_ID, MY_NOMBRE);
    END;
    /
    
    ---FINALMENTE VAMOS A PROBAR EL PROCEDIMIENO CON UN BLOQUE PL SQL 
    
    DECLARE 
    VALOR INTEGER;
    BEGIN
    GUARDAR_NOMINA(VALOR,'JUAN');
    DBMS_OUTPUT.PUT_LINE('EL PK GENERADO ES: '||VALOR);
    END;
    /
    
    SELECT * FROM NOMINAS;
    
     