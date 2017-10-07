


--Clase de hoy 7/10/17
create table almacen(numero_almacen integer,
                    ubicacion_almacen varchar(80), 
                    constraint pk_numero_almacen primary key(numero_almacen)
                    );
                    
                    
--Una entidaad o registro tipo alamacen
create or replace procedure guardar_almacen( mi_id IN integer,
                            mi_ubicacion In varchar2)
                            as
                            begin
                            --Aqui la logica del procedimiento
                    insert into almacen values(mi_id, mi_ubicacion);
                    end;
                    /
--Vamos a probar que funciona nuestro procedimiento
    begin
    guardar_almacen(1,'PLYMOUTH');
    end;
    /
    
    select * from almacen;
    