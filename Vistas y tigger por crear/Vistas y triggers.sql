-- Ver la información del personal

drop view if exists ver_personal;
Create view ver_personal as 
select dni_empleado as dni,
nombre as nombre,
apellido as apellido,
cargo as cargo 
from 
personal;

-- Ver la información de los clientes junto con su mascota

drop view if exists cliente_mascota;
create view cliente_mascota as 
select c.nombre as nombre_cliente,
m.nombre as nombre_mascota,
t.tipo as tipo
from 
cliente as c inner join mascota as m on c.dni_cliente=m.dni_cliente
inner join tipo_mascota as t on m.id_tipo=t.id_tipo;



DELIMITER $$
CREATE TRIGGER tr_ventas_historico 
AFTER INSERT ON ventas
FOR EACH ROW
BEGIN 
   INSERT INTO ventas_historico(dni_empleado, estado, fecha)
   VALUES (NEW.dni_empleado, NEW.estado, CURDATE());
END; $$
 
