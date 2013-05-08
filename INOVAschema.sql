create type tipoTarjeta as enum ('C','D');
create type ID as enum ('C','R');

create table tarjeta (
  numero char(16) not null primary key, -- Numero de tarjeta de credito, no contiene guiones.
  tipo tipoTarjeta not null, -- Tipo de tarjeta 'C' para credito y 'D' para debito.
  fecha_venc date not null, -- Fecha de vencimiento de la tarjeta.
  cod_seguridad varchar(3) not null -- Codigo de seguridad de la tarjeta.
);

create table cliente (
  tipo varchar(1) not null, -- Tipo de documento de ID 'R' para RIF y 'C' para cedula.
  nro numeric(10) not null, -- Numero de ID.
  nombre varchar(50) not null, -- Nombre del cliente.
  direccion varchar(80) not null, -- Direccion del cliente.
  telefono numeric(11) not null, -- Numero de telefono del cliente.
  fecha date not null, -- Fecha de la factura.
  efectivo integer not null, -- Cantidad de efectivo con la que se paga la factura (si el efectivo es cero
  --es porque se uso alguna tarjeta).
  total integer not null, -- Total de la factura.
  primary key(tipo, nro) -- La clave primaria es tipo y nro.
);

create table plan (
  codigo_plan numeric(5) not null primary key, -- Codigo del plan.
  nombre_plan varchar(15) not null -- Nombre del plan.
);

create table prepago (
  codigo_plan numeric(5) not null references plan(codigo_plan), -- Codigo del plan prepago.
  monto integer not null -- Monto del prepago.
);

create table postpago (
  codigo_plan numeric(5) not null references plan(codigo_plan) --Codigo del plan postpago.
  renta_basica integer not null -- Monto de la renta basica. En caso de ser cero es porque hay consumo ilimitado,
  -- si se tiene mayor a cero en cambio es porque se cobra renta basica mas tarifas por consumo extra.
);

create table paquete (
  codigo_paq numeric(5) not null primary key, -- Codigo del paquete.
  nombre varchar(15) not null -- Nombre del paquete.
);

create table servicio (
  codigo_serv numeric(5) not null primary key, -- Codigo del servicio.
  nombre varchar(15) not null, -- Nombre del servicio
  tarifa integer -- Tarifa del servicio.
);

create table empresa (
  codigo_empresa numeric(5) not null primary key, -- Codigo de la empresa.
  nombre varchar(15) not null -- Nombre de la empresa.
);

create table producto (
  nro_serie numeric(10) not null primary key, -- Numero de serie del producto.
  tipo varchar(10) not null -- tipo de producto (decodificador, telefono, comida, etc.).
);

create table factura (
  fecha date not null, -- Fecha de la factura.
  tipo ID not null, -- Tipo de id (RIF o Cedula).
  nro numeric(10) not null, -- Numero de ID.
  efectivo integer not null, -- Cantidad de efectivo con la que se paga la factura (si el efectivo es cero
  --es porque se uso alguna tarjeta).
  total integer not null, -- Total de la factura.
  primary key (fecha, tipo, nro), -- La clave primaria es la combinacion de fecha, tipo y nro.
  foreign key (tipo, nro) references cliente(tipo, nro) -- Tipo y nro conforman una clave foranea a cliente.
);

create table genera (
  nro_serie numeric(10) not null references producto(nro_serie), -- numero de serie del producto.
  fecha date not null, -- fecha de generacion de la factura
  tipo ID not null, -- ID del cliente
  nro numeric(10) not null, -- Numero de id
  foreign key (fecha, tipo, nro) references factura(fecha, tipo, nro)
);

create table consume (
  nombre varchar(15) not null references servicio(nombre),
  nro_serie integer not null references producto(nro_serie),
  cantidad integer not null,
  primary key(nombre, nro_serie)
);

create table tiene (
  tipo varchar(1) not null,
  nro integer not null,
  numero integer not null references tarjeta(numero),
  foreign key (tipo, nro) references cliente(tipo, nro),
  primary key (tipo, nro, numero)
);

create table contrata (
  tipo varchar(1) not null,
  nro integer not null,
  nro_serie integer not null references producto(nro_serie),
  nombre varchar(15) not null references plan(nombre),
  foreign key (tipo, nro) references cliente(tipo, nro),
  primary key (tipo, nro, nro_serie, nombre)
);

create table posee (
  nombre_paq varchar(15) not null references paquete(nombre),
  nombre_pla varchar(15) not null references plan(nombre)
);

create table ofrece (
  nombre varchar(15) not null references empresa(nombre),
  nro_serie integer not null references producto(nombre),
  primary key (nombre, nro_serie)
);

create table brinda (
  nombre_ser varchar(15) not null references servicio(nombre),
  nombre_paq varchar(15) not null references paquete(nombre),
  primary key(nombre_ser, nombre_paq)
);

-- Constraints

alter table prepago add check ( monto >= 0 ); -- Se chequea que el monto del prepago sea >=0.
alter table servicio add check ( tarifa >= 0 ); -- Se chequea que el monto de la tarifa sea >=0.
