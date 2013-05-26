begin;
--Empresa
INSERT INTO Empresa (nombre)
VALUES
  ('MOCEL');

--Productos
INSERT INTO Producto (tipo)
VALUES
  ('Iphone 9GS'),
  ('Blackberry'),
  ('Nokia N999'),
  ('Samsumg S7'),
  ('Vertu gold');

--Ofrece
INSERT INTO Ofrece (codigo_empresa, nro_serie)
SELECT Empresa.codigo_empresa, Producto.nro_serie
FROM
  Empresa,
  Producto,
  (VALUES
    ('MOCEL','Iphone 9GS'),
    ('MOCEL','Blackberry'),
    ('MOCEL','Nokia N999'),
    ('MOCEL','Samsumg S7'),
    ('MOCEL','Vertu gold')
  ) AS Datos (empresa, producto)
WHERE
  Empresa.nombre  = Datos.empresa AND
  Producto.tipo = Datos.producto
;


--Clientes
INSERT INTO Cliente(cedula, nombre, direccion, telefono) VALUES
(20309753,'John Mikel'      , 'Bosque Valle',04142342006),
(21030282,'Gabriela Claret' , 'Macaracuay'  ,04244666383),
(19379657,'Andrea Salcedo'  , 'California'  ,04263476562),
(20131092,'Marcos Antonio'  , 'Los Samanes' ,04241218886),
(19994366,'Catherine Elena' , 'Oripoto'     ,04129356911),
(22382687,'Reinaldo Enrique', 'Yo no se'    ,04142784945),
(01235689,'Joel Orlando'    , 'Yo no se'    ,04123093919),
(00122334,'Fernando Javier' , 'Montalban'   ,04123622646),
(11233445,'Jose Luis'       , 'Yo no se'    ,24124123164),
(12332141,'Ramon Marquez'   , 'Yo no se'    ,24124123123),
(09928313,'Manuel Gomez'    , 'Macaracuay'  ,11111111118),
(00912314,'Aguacate Guasy'  , 'Magickland'  ,11111111111),
(05232141,'Eduardo Blanco'  , 'Yo no se'    ,00000000000),
(35891247,'Angela di Serio' , 'Yo no se'    ,00000000000),
(12496710,'Oveja Negra'     , 'Hoyo negro'  ,66666666666);

--Tarjeta
INSERT INTO Tarjeta VALUES
(0000000000000000,'C','12-12-2020',000,'USB'),
(0000000000000001,'C','12-12-2020',001,'USB'),
(0000000000000002,'C','12-12-2020',002,'USB'),
(0000000000000003,'C','12-12-2020',003,'USB'),
(0000000000000004,'C','12-12-2020',004,'USB'),
(0000000000000005,'C','12-12-2020',005,'USB');


--Tiene
INSERT INTO Tiene (nro_cliente, numero)
SELECT Cliente.nro_cliente, Datos.tarjeta
FROM
  Cliente,
  (VALUES
    (20309753, 0000000000000000),
    (21030282, 0000000000000001),
    (20131092, 0000000000000002),
    (19379657, 0000000000000003)
  ) AS Datos (cedula, tarjeta)
WHERE
  Cliente.cedula = Datos.cedula
;

--Servicios
INSERT INTO Servicio(nombre, tarifa, cupo) VALUES
('Segundos moviles MOCEL incluidos',0       ,1000 ),
('Segundos moviles otras incluidos',0       ,1000 ),
('Buzon de voz'                    ,0       ,0    ),
('Mensajes texto incluidos'        ,0       ,200  ),
('Segundos moviles MOCEL incluidos',0       ,39000),
('Segundos moviles otras incluidos',0       ,2600 ),
('Segundos fijos a TODOS'          ,0       ,5000 ),
('Segundos moviles MOCEL'          ,0.01150 ,0    ),
('Segundos moviles otras'          ,0.01250 ,0    ),
('Segundos fijos a otras'          ,0.01150 ,0    ),
('Segundos a todos'                ,16      ,1500 ),
('Minutos a todos'                 ,19      ,30   ),
('Mensajes de texto'               ,38      ,800  );

--Paquetes
INSERT INTO Paquete(nombre) VALUES
('Paquete 01'),
('Paquete 02');

--Brindas
INSERT INTO Brinda(codigo_serv, codigo_paq)
SELECT Servicio.codigo_serv, Paquete.codigo_paq
FROM
  Servicio,
  Paquete,
  (VALUES
    ('Segundos moviles MOCEL incluidos','Paquete 01'),
    ('Segundos moviles otras incluidos','Paquete 01'),
    ('Buzon de voz'                    ,'Paquete 01'),
    ('Mensajes texto incluidos'        ,'Paquete 01'),
    ('Segundos moviles MOCEL incluidos','Paquete 02'),
    ('Segundos moviles otras incluidos','Paquete 02'),
    ('Segundos fijos a TODOS'          ,'Paquete 02'),
    ('Mensajes texto incluidos'        ,'Paquete 02'),
    ('Buzon de voz'                    ,'Paquete 02'),
    ('Segundos moviles MOCEL'          ,'Paquete 02'),
    ('Segundos moviles otras'          ,'Paquete 02'),
    ('Segundos fijos a otras'          ,'Paquete 02')
  ) AS Datos (nombre_servicio, nombre_paquete)
WHERE
  Servicio.nombre  = Datos.nombre_servicio AND
  Paquete.nombre = Datos.nombre_paquete
;

--Planes
INSERT INTO Plan(nombre_plan) VALUES
('Plan Mocel 2000' ),
('Plan Mixto Plus' );

--Prepagos
INSERT INTO Prepago(codigo_plan, monto)
SELECT Plan.codigo_plan, Datos.monto
FROM
  Plan,
  (VALUES
    ('Plan Mocel 2000', 49)
  ) AS Datos (nombre_plan, monto)
WHERE
  Plan.nombre_plan = Datos.nombre_plan
;

--Postpagos
INSERT INTO Postpago(codigo_plan, renta_basica)
SELECT Plan.codigo_plan, Datos.renta_basica
FROM
  Plan,
  (VALUES
    ('Plan Mixto Plus', 211)
  ) AS Datos (nombre_plan, renta_basica)
WHERE
  Plan.nombre_plan = Datos.nombre_plan
;

--Posees
INSERT INTO Posee(codigo_paq, codigo_pla)
SELECT Paquete.codigo_paq, Plan.codigo_plan
FROM
  Paquete,
  Plan,
  (VALUES
    ('Paquete 01', 'Plan Mocel 2000'),
    ('Paquete 02', 'Plan Mixto Plus')
  ) AS Datos (nombre_paq, nombre_plan)
WHERE
  Paquete.nombre = Datos.nombre_paq AND
  Plan.nombre_plan = Datos.nombre_plan
;

--Contratas
INSERT INTO Contrata(nro_cliente, nro_serie, codigo_plan)
SELECT Cliente.nro_cliente, Producto.nro_serie, Plan.codigo_plan
FROM
  Cliente,
  Producto,
  Plan,
  (VALUES
    (20309753,'Iphone 9GS','Plan Mocel 2000'),
    (21030282,'Iphone 9GS','Plan Mixto Plus'),
    (20131092,'Nokia N999','Plan Mocel 2000'),
    (19379657,'Blackberry','Plan Mixto Plus'),
    (19994366,'Iphone 9GS','Plan Mocel 2000'),
    (22382687,'Samsung S7','Plan Mocel 2000'),
    (01235689,'Iphone 9GS','Plan Mixto Plus'),
    (00122334,'Iphone 9GS','Plan Mocel 2000'),
    (11233445,'Nokia N999','Plan Mocel 2000'),
    (12332141,'Iphone 9GS','Plan Mixto Plus'),
    (09928313,'Blackberry','Plan Mocel 2000'),
    (00912314,'Iphone 9GS','Plan Mixto Plus'),
    (05232141,'Iphone 9GS','Plan Mocel 2000'),
    (35891247,'Blackberry','Plan Mixto Plus'),
    (12496710,'Nokia N999','Plan Mocel 2000'),
    (20131092,'Blackberry','Plan Mixto Plus')
  ) AS Datos (cedula, nombre_producto, nombre_plan)
WHERE
  Cliente.cedula   = Datos.cedula AND
  Producto.tipo    = Datos.nombre_producto AND
  Plan.nombre_plan = Datos.nombre_plan
;

--Cosume
INSERT INTO Consume(codigo_serv, nro_serie, cantidad, nro_cliente, fecha_consumo)
SELECT Servicio.codigo_serv, Producto.nro_serie, Datos.cantidad, Cliente.nro_cliente, Datos.fecha
FROM
  Servicio,
  Producto,
  Cliente,
  (VALUES
    ('Segundos moviles MOCEL incluidos','Nokia N999',50,20131092,CURRENT_TIMESTAMP),
    ('Segundos moviles otras incluidos','Nokia N999',54,20131092,CURRENT_TIMESTAMP),
    ('Buzon de voz'                    ,'Nokia N999',44,20131092,CURRENT_TIMESTAMP),
    ('Mensajes de texto incluidos'     ,'Nokia N999',52,20131092,CURRENT_TIMESTAMP)
  ) AS Datos (nombre_serv, nombre_producto, cantidad, cedula, fecha)
WHERE
  Cliente.cedula  = Datos.cedula AND
  Producto.tipo   = Datos.nombre_producto AND
  Servicio.nombre = Datos.nombre_serv
;
commit;
