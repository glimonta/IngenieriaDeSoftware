drop type if exists tipoTarjeta   cascade;
drop type if exists ID            cascade;

create type tipoTarjeta as enum ('C','D');
create type ID as enum ('C','R');

create table tarjeta (
  numero char(16) not null primary key, -- Numero de tarjeta de credito, no contiene guiones.
  tipo tipoTarjeta not null, -- Tipo de tarjeta 'C' para credito y 'D' para debito.
  fecha_venc date not null, -- Fecha de vencimiento de la tarjeta.
  cod_seguridad varchar(3) not null, -- Codigo de seguridad de la tarjeta.
  banco varchar(30) not null -- Es el banco emisor de la tarjeta.
);

create table cliente (
  tipo ID not null, -- Tipo de documento de ID 'R' para RIF y 'C' para cedula.
  nro numeric(10) not null, -- Numero de ID.
  nombre varchar(50) not null, -- Nombre del cliente.
  direccion varchar(80) not null, -- Direccion del cliente.
  telefono numeric(11) not null, -- Numero de telefono del cliente.
  fecha date not null, -- Fecha de la factura.
  efectivo integer not null, -- Cantidad de efectivo con la que se paga la factura (si el efectivo es cero
  --es porque se uso alguna tarjeta).
  total integer not null, -- Total de la factura.
  observacion varchar(160), -- Descripcion de la factura
  primary key(tipo, nro, fecha) -- La clave primaria es tipo y nro.
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
  codigo_plan numeric(5) not null references plan(codigo_plan), --Codigo del plan postpago.
  renta_basica integer not null -- Monto de la renta basica. En caso de ser cero es porque hay consumo ilimitado,
  -- si se tiene mayor a cero en cambio es porque se cobra renta basica mas tarifas por consumo extra.
);

create table paquete (
  codigo_paq numeric(5) not null primary key, -- Codigo del paquete.
  nombre varchar(15) not null -- Nombre del paquete.
);

create table servicio (
  codigo_serv numeric(5) not null primary key, -- Codigo del servicio.
  nombre varchar(45) not null, -- Nombre del servicio
  tarifa integer, -- Tarifa del servicio.
  cupo numeric(10) --Cupos disponibles del servicio
);

create table empresa (
  codigo_empresa numeric(5) not null primary key, -- Codigo de la empresa.
  nombre varchar(15) not null -- Nombre de la empresa.
);

create table producto (
  nro_serie numeric(10) not null primary key, -- Numero de serie del producto.
  tipo varchar(10) not null -- tipo de producto (decodificador, telefono, comida, etc.).
);

create table genera (
  nro_serie numeric(10) not null references producto(nro_serie), -- numero de serie del producto.
  fecha date not null, -- fecha de generacion de la factura
  tipo ID not null, -- ID del cliente
  nro numeric(10) not null, -- Numero de id
  foreign key (fecha, tipo, nro) references cliente(fecha, tipo, nro)
);

create table consume (
  codigo_serv numeric(5) not null references servicio(codigo_serv), -- Codigo del servicio.
  nro_serie numeric(10) not null references producto(nro_serie), -- Numero de serie del producto
  cantidad integer not null, -- Cantidad que se consume
  tipo ID not null, -- Tipo de ID
  nro numeric(10) not null, -- numero de id
  fecha date not null, -- fecha de generacion de la factura
  fecha_consumo date not null,--fecha donde se realizo el consumo
  primary key(codigo_serv, nro_serie,fecha, tipo, nro) -- La clave primaria es la combinacion del numero de serie con el codigo del servicio.
);

create table tiene (
  tipo ID not null, -- Tipo de ID
  nro numeric(10) not null, -- Numero de ID
  fecha date not null, -- fecha de generacion de la factura
  numero char(16) not null references tarjeta(numero), -- Numero de la tarjeta
  foreign key (tipo, nro, fecha) references cliente(tipo, nro, fecha), -- tipo, nro y fecha referencian al cliente
  primary key (tipo, nro, fecha, numero) -- La clave es la combinacion de tipo, nro, fecha y numero
);

create table contrata (
  tipo ID not null, -- Tipo de ID
  nro numeric(10) not null, -- numero de id
  fecha date not null, -- fecha de generacion de la factura
  nro_serie numeric(10) not null references producto(nro_serie), -- numero de serie del producto
  codigo_plan numeric(5) not null references plan(codigo_plan), -- codigo del plan
  foreign key (tipo, nro, fecha) references cliente(tipo, nro, fecha),
  primary key (tipo, nro, nro_serie, fecha, codigo_plan)
);

create table posee (
  codigo_paq numeric(5) not null references paquete(codigo_paq),
  codigo_pla numeric(5) not null references plan(codigo_plan),
  primary key (codigo_paq, codigo_pla)
);

create table ofrece (
  codigo_empresa numeric(5) not null references empresa(codigo_empresa),
  nro_serie numeric(10) not null references producto(nro_serie),
  primary key (codigo_empresa, nro_serie)
);

create table agrega (
  codigo_serv numeric(5) not null references servicio(codigo_serv), -- Codigo del servicio.
  nro_serie numeric(10) not null references producto(nro_serie),
  primary key (codigo_serv, nro_serie)
);

create table brinda (
  codigo_serv numeric(5) not null references servicio(codigo_serv),
  codigo_paq numeric(5) not null references paquete(codigo_paq),
  primary key(codigo_serv, codigo_paq)
);

-- Constraints

alter table prepago add check ( monto >= 0 ); -- Se chequea que el monto del prepago sea >=0.
alter table servicio add check ( tarifa >= 0 ); -- Se chequea que el monto de la tarifa sea >=0.
alter table servicio add check ( cupo >= 0 ); -- Se chequea que los cupos no sean negativos.
