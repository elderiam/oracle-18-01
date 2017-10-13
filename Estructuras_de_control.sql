create table menores_edad(id_menores integer primary key,
                          nombre varchar2(60),
                          edad integer );
                          
create or replace procedure generar_mil
as begin
--generamos los mil
for i IN 1..1000 loop
insert into menores_edad values(i,'jesus',20);
end loop;
end;
/

--vamos a ejecutar el procedimiento
begin
generar_mil();
end;
/

select * from menores_edad;
select count(*) from menores_edad;

create or replace procedure ACTUALIZAR_EDAD(AGE IN INTEGER,ID IN integer)AS
BEGIN
IF AGE <18 THEN 
RAISE_APPLICATION_ERROR(-2000,'NO ACEPTO EDADES MENORES A 18');
ELSE
UPDATE menores_edad SET EDAD=AGE WHERE id_menores=ID;
END IF;
END;