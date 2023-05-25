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



-- Ver clientes que no han pagado aún


drop view if exists pago_pendiente;

create view pago_pendiente as

select c.dni_cliente as cliente,
c.nombre as nombre_cliente,
c.telefono as contacto,
c.correo as email,
v.estado as estado_pago

from

cliente as c inner join venta as v on c.dni_cliente=v.dni_cliente and v.estado='Pendiente'; 
 



-- Al hacer cambio en una venta, se copia la información de quien lo hizo en ventas_historico

DELIMITER $$
CREATE TRIGGER tr_ventas_historico 
AFTER INSERT ON venta
FOR EACH ROW
BEGIN 
   INSERT INTO ventas_historico(dni_empleado, estado, fecha)
   VALUES (NEW.dni_empleado, NEW.estado, CURDATE());
END; $$
 
