


-- creacion de tablas

create table tipo_mascota(
    id_tipo int primary key,
     tipo varchar(10));

create table raza(
     id_raza int primary key,
     raza varchar(15));

create table cargo(
     id_cargo int primary key,
     cargo varchar(30));

create table calle(
    id_calle int primary key,
    calle varchar(30));


create table comunidad(
comunidad varchar(30) primary key);


create table ciudad(
 id_ciudad int primary key,
 nombre_ciudad varchar(30),
 nombre_comunidad varchar(30),
 foreign key(nombre_comunidad) references comunidad(comunidad));



create table personal( 
dni_empleado varchar(9) primary key, 
nombre varchar(10), 
apellido varchar(15), 
cargo int,
telefono int, 
calle int, ciudad int, 
foreign key(cargo) references cargo(id_cargo), 
foreign key(calle) references calle(id_calle), 
foreign key(ciudad) references ciudad(id_ciudad));


create table mascota(
id_mascota int primary key, 
dni_cliente varchar(9), 
nombre varchar(10), 
sexo enum('H','M'), 
id_tipo int, 
id_raza int, 
foreign key(id_tipo) references tipo_mascota(id_tipo), 
foreign key(id_raza) references raza(id_raza),
foreign key(dni_cliente) references cliente(dni_cliente));

create table cita(
     id_cita int primary key,
     dni_cliente varchar(9),
     fecha date);

create table factura (
n_factura int primary key,
precio double not null,
impuesto double not null,
total double not null);

create table venta(
id_venta int primary key,
n_factura int not null,
dni_cliente varchar(9) not null,
estado varchar(10) not null,
fecha date);

create table cliente ( 
     dni_cliente varchar(9) primary key,
     nombre varchar(15) not null,
     calle int,
     telefono int,
     correo varchar(30) not null,
     ciudad int,
     foreign key(calle) references calle(id_calle),
     foreign key(ciudad) references ciudad(id_ciudad));


create table tratamiento(
id_tratamiento int primary key,
id_mascota int not null,
descripcion varchar(50) not null,
fecha date,
foreign key(id_mascota) references mascota(id_mascota));

create table cliente_atendido(
     dni_cliente varchar(9),
     dni_empleado varchar(9),
     fecha date,
     primary key(dni_cliente,dni_empleado),
     foreign key(dni_cliente) references cliente(dni_cliente),
     foreign key(dni_empleado) references personal(dni_empleado));

create table gestion_citas(
     dni_empleado varchar(9),
     id_cita int,
     primary key(dni_empleado,id_cita),
     foreign key(dni_empleado) references personal(dni_empleado),
     foreign key(id_cita) references cita(id_cita));

create table gestion_ventas(
     dni_empleado varchar(9),
     id_venta int,
     primary key(dni_empleado,id_venta),
     foreign key(dni_empleado) references personal(dni_empleado),
     foreign key(id_venta) references venta(id_venta));


create table tratado_por(
dni_empleado varchar(9),
id_tratamiento int,
primary key(dni_empleado,id_tratamiento),
foreign key(dni_empleado) references personal(dni_empleado),
foreign key(id_tratamiento) references tratamiento(id_tratamiento));








