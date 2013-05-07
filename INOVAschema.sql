CREATE TABLE TARJETA (
  NUMERO INTEGER NOT NULL PRIMARY KEY,
  TIPO VARCHAR(1) NOT NULL,
  FECHA_VENC DATE NOT NULL,
  COD_SEGURIDAD INTEGER NOT NULL
);

CREATE TABLE CLIENTE (
  TIPO VARCHAR(1) NOT NULL,
  NRO INTEGER NOT NULL,
  NOMBRE VARCHAR(30) NOT NULL,
  DIRECCION VARCHAR(140) NOT NULL,
  PRIMARY KEY(TIPO, NRO)
);

create table tlfs_cliente (
  tipo varchar(1) not null,
  nro integer not null,
  valor integer not null,
  primary key(tipo, nro, valor)
);

create table plan (
  nombre varchar(15) not null primary key
);

create table prepago (
  nombre varchar(15) not null references plan(nombre),
  monto integer not null
);

create table postpago (
  nombre varchar(15) not null references plan(nombre)
);

create table es_variante (
  nombre1 varchar(15) not null references postpago(nombre),
  nombre2 varchar(15) not null references postpago(nombre),
  primary key(nombre1, nombre2)
);

create table paquete (
  nombre varchar(15) not null primary key
);

create table servicio (
  nombre varchar(15) not null primary key,
  tarifa integer
);

create table empresa (
  nombre varchar(15) not null primary key
);

create table producto (
  nro_serie integer not null primary key,
  tipo varchar(10) not null
);

create table factura (
  fecha date not null,
  tipo varchar(1) not null,
  nro integer not null,
  efectivo integer not null,
  total integer not null,
  primary key (fecha, tipo, nro),
  foreign key (tipo, nro) references cliente(tipo, nro)
);

create table genera (
  nro_serie  integer not null references producto(nro_serie),
  fecha date not null,
  tipo varchar(1) not null,
  nro integer not null,
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
  nro_serie number not null references producto(nombre),
  primary key (nombre, nro_serie)
);

create table brinda (
  nombre_ser varchar(15) not null references servicio(nombre),
  nombre_paq varchar(15) not null references paquete(nombre),
  primary key(nombre_ser, nombre_paq)
);
