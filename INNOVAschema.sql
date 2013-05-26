begin;

create type tipoTarjeta as enum ('C','D');

create table tarjeta (
  numero        text        not null primary key, -- Numero de tarjeta de credito, no contiene guiones.
  tipo          tipoTarjeta not null, -- Tipo de tarjeta 'C' para credito y 'D' para debito.
  fecha_venc    date        not null, -- Fecha de vencimiento de la tarjeta.
  cod_seguridad char(3)     not null, -- Codigo de seguridad de la tarjeta.
  banco         text        not null  -- Es el banco emisor de la tarjeta.
);

create table cliente (
  nro_cliente   serial  not null primary key, -- Numero de cliente
  cedula        integer not null unique, -- Cedula del cliente
  nombre        text    not null, -- Nombre del cliente.
  direccion     text    not null, -- Direccion del cliente.
  telefono      text    not null -- Numero de telefono del cliente.
);

create table factura (
  nro_factura serial  not null primary key, -- Numero de factura
  nro_cliente integer not null references cliente, -- Cliente asociado a la factura
  fecha       date    not null, -- Fecha de la factura
  total       integer not null, -- Total de la factura
  observacion text    not null, -- Observaciones de la factura
  efectivo    integer not null check (efectivo >= 0), -- Cantidad de efectivo con la que se paga la factura (si el efectivo es cero es porue se uso alguna tarjeta)
  cancelada   boolean not null -- Indica si la factura está cancelada o no
);

create table plan (
  codigo_plan serial  not null primary key, -- Codigo del plan.
  nombre_plan text    not null -- Nombre del plan.
);

create table prepago (
  codigo_plan integer not null references plan(codigo_plan), -- Codigo del plan prepago.
  monto       integer not null check (monto >= 0)            -- Monto del prepago.
);

create table postpago (
  codigo_plan  integer not null references plan(codigo_plan), --Codigo del plan postpago.
  renta_basica integer not null -- Monto de la renta basica. En caso de ser cero es porque hay consumo ilimitado,
  -- si se tiene mayor a cero en cambio es porque se cobra renta basica mas tarifas por consumo extra.
);

create table paquete (
  codigo_paq serial not null primary key, -- Codigo del paquete.
  nombre     text   not null -- Nombre del paquete.
);

create table servicio (
  codigo_serv serial  not null primary key, -- Codigo del servicio.
  nombre      text    not null, -- Nombre del servicio
  tarifa      integer check (tarifa >= 0), -- Tarifa del servicio.
  cupo        integer check (cupo >= 0  )--Cupos disponibles del servicio
);

create table empresa (
  codigo_empresa serial not null primary key, -- Codigo de la empresa.
  nombre         text    not null -- Nombre de la empresa.
);

create table producto (
  nro_serie serial not null primary key, -- Numero de serie del producto.
  tipo      text   not null -- tipo de producto (decodificador, telefono, comida, etc.).
);

create table genera (
  nro_serie   serial  not null references producto(nro_serie), -- numero de serie del producto.
  fecha       date    not null, -- fecha de generacion de la factura
  nro_cliente integer not null references cliente -- Numero de cliente
);

create table consume (
  codigo_serv   integer   not null references servicio(codigo_serv), -- Codigo del servicio.
  nro_serie     integer   not null references producto(nro_serie), -- Numero de serie del producto
  cantidad      integer   not null, -- Cantidad que se consume
  nro_cliente   integer   not null references cliente, -- Numero de cliente
  fecha_consumo timestamp not null,--fecha donde se realizo el consumo
  primary key(codigo_serv, nro_serie, nro_cliente) -- La clave primaria es la combinacion del numero de serie con el codigo del servicio y el numero del cliente
);

create table tiene (
  nro_cliente   integer   not null references cliente, -- Numero de cliente
  numero        text      not null references tarjeta(numero), -- Numero de la tarjeta
  primary key (nro_cliente, numero) -- La clave es la combinacion del numero de tarjeta y el numero de cliente
);

create table contrata (
  nro_cliente integer not null references cliente, -- Numero de cliente
  nro_serie   integer not null references producto(nro_serie), -- numero de serie del producto
  codigo_plan integer not null references plan(codigo_plan), -- codigo del plan
  primary key (nro_serie, nro_cliente, codigo_plan)
);

create table posee (
  codigo_paq integer not null references paquete(codigo_paq),
  codigo_pla integer not null references plan(codigo_plan),
  primary key (codigo_paq, codigo_pla)
);

create table ofrece (
  codigo_empresa integer not null references empresa(codigo_empresa),
  nro_serie      integer not null references producto(nro_serie),
  primary key (codigo_empresa, nro_serie)
);

create table agrega (
  codigo_serv integer not null references servicio(codigo_serv), -- Codigo del servicio.
  nro_serie   integer not null references producto(nro_serie),
  primary key (codigo_serv, nro_serie)
);

create table brinda (
  codigo_serv integer not null references servicio(codigo_serv),
  codigo_paq  integer not null references paquete(codigo_paq),
  primary key(codigo_serv, codigo_paq)
);
commit;
