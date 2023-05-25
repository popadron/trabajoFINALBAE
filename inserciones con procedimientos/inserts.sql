drop procedure if exists insertar_clientes;

delimiter //

create procedure insertar_personal ( in numero int)


begin



declare dni_empleado varchar(9);
declare contador int default 0;
declare nombre varchar(10);
declare apellido varchar(15);
declare cargo char(3);
declare telefono int;
declare calle int;
declare ciudad int;


set contador = (select count(*) from personal);


while contador <= numero do

set dni_empleado = concat(7845,contador);
set nombre = concat('Antonio',contador);
set apellido = concat('Gonzalez',contador);

-- El 001 es cirujano
if(contador%2 = 0) 
set cargo = '001';
set calle = 1;
set ciudad = 1;
end if
-- El 002 es auxiliar
if(contador%3 = 0) 
set cargo = '002';
set calle = 2;
set ciudad = 2;
end if
-- El 003 es Veterinario
if(contador%5 = 0) 
set cargo = '003';
set calle = 3;
set ciudad = 3;
end if

set telefono = concat('92230212',contador);







insert into personal values(dni_empleado,nombre,apellido,cargo,telefono,calle,ciudad);

set contador = contador + 1;

end while;

end //


delimiter ;




-- tabla comunidad

drop procedure if exists insertar_comunidad;

delimiter //


create procedure insertar_comunidad ( in nombre varchar(30))
begin


insert into comunidad values(id_comunidad,nombre);

end //


delimiter ;
call insertar_comunidad('S/C de Tenerife');


-- tabla tipo_mascota

drop procedure if exists insertar_tipo_mascota;

delimiter //


create procedure insertar_tipo_mascota ( in tipo varchar(30))
begin


insert into comunidad values(id_tipo,tipo);

end //


delimiter ;
call insertar_tipo_mascota('Gusano');


-- tabla raza

drop procedure if exists insertar_raza;

delimiter //


create procedure insertar_raza ( in raza varchar(30))
begin


insert into comunidad values(id_raza,raza);

end //


delimiter ;
call insertar_raza('Labrador');


-- tabla cargo 

drop procedure if exists insertar_cargo;

delimiter //


create procedure insertar_cargo ( in cargo varchar(30))
begin


insert into comunidad values (id_cargo,cargo);

end //


delimiter ;
call insertar_cargo('Auxiliar');


-- tabla calle 


drop procedure if exists insertar_calle;

delimiter //


create procedure insertar_calle ( in calle varchar(30))
begin


insert into comunidad values (id_calle,calle);

end //


delimiter ;
call insertar_calle('Los Volcanes');






