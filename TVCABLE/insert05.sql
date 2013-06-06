-- Sin facturas
Begin;
--Empresa
INSERT INTO Empresa(nombre)
VALUES
  ('CABLETV');

--Clientes
INSERT INTO Cliente(cedula, nombre, direccion, telefono) VALUES
(09928313,'Manuel Gomez'    , 'Macaracuay'  ,11111111118),
(11233445,'Jose Luis'       , 'Yo no se'    ,24124123164),
(19379657,'Andrea Salcedo'  , 'California'  ,04263476562),
(19994366,'Catherine Elena' , 'Oripoto'     ,04129356911),
(20131092,'Marcos Antonio'  , 'Los Samanes' ,04241218886),
(20309753,'John Mikel'      , 'Bosque Valle',04142342006),
(21030282,'Gabriela Claret' , 'Macaracuay'  ,04244666383),
(22382687,'Reinaldo Enrique', 'Yo no se'    ,04142784945),
(00122334,'Fernando Javier' , 'Montalban'   ,04123622646),
(00912314,'Aguacate Guasy'  , 'Magickland'  ,11111111111),
(01235689,'Joel Orlando'    , 'Yo no se'    ,04123093919),
(05232141,'Eduardo Blanco'  , 'Yo no se'    ,00000000000),
(12332141,'Ramon Marquez'   , 'Yo no se'    ,24124123123),
(12496710,'Oveja Negra'     , 'Hoyo negro'  ,66666666666),
(35891247,'Angela di Serio' , 'Yo no se'    ,00000000000);

--Productos
INSERT INTO Producto(tipo)
VALUES
  ('Deco01'),
  ('Deco02'),
  ('Deco03'),
  ('Deco04'),
  ('Deco05');

--Ofrece
INSERT INTO Ofrece(codigo_empresa, nro_serie)
SELECT Empresa.codigo_empresa, Producto.nro_serie
FROM
  Empresa,
  Producto,
  (VALUES
    ('TVCABLE','Deco01'),
    ('TVCABLE','Deco02'),
    ('TVCABLE','Deco03'),
    ('TVCABLE','Deco04'),
    ('TVCABLE','Deco05')
  ) AS Datos (empresa, producto)
WHERE
  Empresa.nombre  = Datos.empresa AND
  Producto.tipo = Datos.producto
;

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
INSERT INTO Servicio (nombre) VALUES
 ('Nacional01'    ),
 ('Nacional02'    ),
 ('Nacional03'    ),
 ('Nacional04'    ),
 ('Nacional05'    ),
 ('Nacional06'    ),
 ('Nacional07'    ),
 ('Nacional08'    ),
 ('Nacional09'    ),
 ('Nacional10'    ),
 ('Nacional11'    ),
 ('Nacional12'    ),
 ('Nacional13'    ),
 ('Nacional14'    ),
 ('Variedad01'    ),
 ('Variedad02'    ),
 ('Variedad03'    ),
 ('Variedad04'    ),
 ('Variedad05'    ),
 ('Variedad06'    ),
 ('Variedad07'    ),
 ('Variedad08'    ),
 ('Variedad09'    ),
 ('Variedad10'    ),
 ('Variedad11'    ),
 ('Variedad12'    ),
 ('Variedad13'    ),
 ('Variedad14'    ),
 ('Variedad15'    ),
 ('Variedad16'    ),
 ('Variedad17'    ),
 ('Variedad18'    ),
 ('Variedad19'    ),
 ('Variedad20'    ),
 ('Variedad21'    ),
 ('Variedad22'    ),
 ('Variedad23'    ),
 ('Variedad24'    ),
 ('Variedad25'    ),
 ('Variedad26'    ),
 ('Variedad27'    ),
 ('Variedad28'    ),
 ('Kids01'        ),
 ('Kids02'        ),
 ('Kids03'        ),
 ('Kids04'        ),
 ('Kids05'        ),
 ('Kids06'        ),
 ('Kids07'        ),
 ('Cine01'        ),
 ('Cine02'        ),
 ('Cine03'        ),
 ('Cine04'        ),
 ('Cine05'        ),
 ('Cine06'        ),
 ('Cine07'        ),
 ('Cine08'        ),
 ('Cine09'        ),
 ('Cine10'        ),
 ('Deportes01'    ),
 ('Deportes02'    ),
 ('Deportes03'    ),
 ('Deportes04'    ),
 ('Deportes05'    ),
 ('Deportes06'    ),
 ('Deportes07'    ),
 ('Deportes08'    ),
 ('Deportes09'    ),
 ('Mundos01'      ),
 ('Mundos02'      ),
 ('Mundos03'      ),
 ('Mundos04'      ),
 ('Mundos05'      ),
 ('Mundos06'      ),
 ('Mundos07'      ),
 ('Mundos08'      ),
 ('Mundos09'      ),
 ('Mundos10'      ),
 ('Mundos11'      ),
 ('Mundos12'      ),
 ('Mundos13'      ),
 ('Mundos14'      ),
 ('Mundos15'      ),
 ('Mundos16'      ),
 ('Mundos17'      ),
 ('Mundos18'      ),
 ('Mundos19'      ),
 ('Mundos20'      ),
 ('Radio01'       ),
 ('Radio02'       ),
 ('Radio03'       ),
 ('Radio04'       ),
 ('Radio05'       ),
 ('Radio06'       ),
 ('Radio07'       ),
 ('Radio08'       ),
 ('Radio09'       ),
 ('Radio10'       ),
 ('Radio11'       ),
 ('Radio12'       ),
 ('Radio13'       ),
 ('Radio14'       ),
 ('Radio15'       ),
 ('Radio16'       ),
 ('Radio17'       ),
 ('Radio18'       ),
 ('Radio19'       ),
 ('Radio20'       );

--Servicio de enunciado
INSERT INTO Servicio(nombre, tarifa)
VALUES
  ('TVBRAZIL'       ,42),
  ('SPN'            ,30),
  ('NoticiasMundial',35),
  ('PeliculasPPV'   ,35);

--Paquetes
INSERT INTO Paquete(nombre)
VALUES
  ('Paquete 01'),
  ('Paquete 02'),
  ('Paquete 03');

--Brindas
INSERT INTO Brinda
SELECT codigo_serv, codigo_paq
FROM
  Servicio, Paquete,
  (VALUES
    ('Nacional01','Paquete01'),
    ('Nacional02','Paquete01'),
    ('Nacional03','Paquete01'),
    ('Nacional04','Paquete01'),
    ('Nacional05','Paquete01'),
    ('Nacional06','Paquete01'),
    ('Nacional07','Paquete01'),
    ('Nacional08','Paquete01'),
    ('Nacional09','Paquete01'),
    ('Nacional10','Paquete01'),
    ('Nacional14','Paquete01'),
    ('Nacional13','Paquete01'),
    ('Nacional12','Paquete01'),
    ('Nacional11','Paquete01'),
    ('Variedad01','Paquete01'),
    ('Variedad02','Paquete01'),
    ('Variedad03','Paquete01'),
    ('Variedad04','Paquete01'),
    ('Variedad05','Paquete01'),
    ('Variedad06','Paquete01'),
    ('Variedad07','Paquete01'),
    ('Variedad08','Paquete01'),
    ('Variedad09','Paquete01'),
    ('Variedad10','Paquete01'),
    ('Variedad14','Paquete01'),
    ('Variedad13','Paquete01'),
    ('Variedad12','Paquete01'),
    ('Variedad11','Paquete01'),
    ('Variedad15','Paquete01'),
    ('Kids01'    ,'Paquete01'),
    ('Kids02'    ,'Paquete01'),
    ('Kids03'    ,'Paquete01'),
    ('Kids04'    ,'Paquete01'),
    ('Deportes01','Paquete01'),
    ('Deportes02','Paquete01'),
    ('Deportes03','Paquete01'),
    ('Deportes04','Paquete01'),
    ('Cine01'    ,'Paquete01'),
    ('Cine02'    ,'Paquete01'),
    ('Cine03'    ,'Paquete01'),
    ('Cine04'    ,'Paquete01'),
    ('Radio01'   ,'Paquete01'),
    ('Radio02'   ,'Paquete01'),
    ('Radio08'   ,'Paquete01'),
    ('Radio03'   ,'Paquete01'),
    ('Radio04'   ,'Paquete01'),
    ('Radio05'   ,'Paquete01'),
    ('Radio06'   ,'Paquete01'),
    ('Radio07'   ,'Paquete01'),
    ('Radio09'   ,'Paquete01'),
    ('Mundos01'  ,'Paquete01'),
    ('Mundos02'  ,'Paquete01'),
    ('Mundos08'  ,'Paquete01'),
    ('Mundos03'  ,'Paquete01'),
    ('Mundos04'  ,'Paquete01'),
    ('Mundos05'  ,'Paquete01'),
    ('Mundos06'  ,'Paquete01'),
    ('Mundos07'  ,'Paquete01'),
    ('Mundos09'  ,'Paquete01'),
    ('Nacional01','Paquete02'),
    ('Nacional02','Paquete02'),
    ('Nacional03','Paquete02'),
    ('Nacional04','Paquete02'),
    ('Nacional05','Paquete02'),
    ('Nacional06','Paquete02'),
    ('Nacional07','Paquete02'),
    ('Nacional08','Paquete02'),
    ('Nacional09','Paquete02'),
    ('Nacional10','Paquete02'),
    ('Nacional14','Paquete02'),
    ('Nacional13','Paquete02'),
    ('Nacional12','Paquete02'),
    ('Nacional11','Paquete02'),
    ('Variedad01','Paquete02'),
    ('Variedad02','Paquete02'),
    ('Variedad03','Paquete02'),
    ('Variedad04','Paquete02'),
    ('Variedad05','Paquete02'),
    ('Variedad06','Paquete02'),
    ('Variedad07','Paquete02'),
    ('Variedad08','Paquete02'),
    ('Variedad09','Paquete02'),
    ('Variedad10','Paquete02'),
    ('Variedad14','Paquete02'),
    ('Variedad13','Paquete02'),
    ('Variedad12','Paquete02'),
    ('Variedad11','Paquete02'),
    ('Variedad15','Paquete02'),
    ('Variedad16','Paquete02'),
    ('Variedad17','Paquete02'),
    ('Variedad18','Paquete02'),
    ('Variedad19','Paquete02'),
    ('Variedad20','Paquete02'),
    ('Variedad21','Paquete02'),
    ('Variedad22','Paquete02'),
    ('Variedad23','Paquete02'),
    ('Variedad24','Paquete02'),
    ('Variedad25','Paquete02'),
    ('Variedad26','Paquete02'),
    ('Variedad27','Paquete02'),
    ('Variedad28','Paquete02'),
    ('Kids01'    ,'Paquete02'),
    ('Kids02'    ,'Paquete02'),
    ('Kids03'    ,'Paquete02'),
    ('Kids04'    ,'Paquete02'),
    ('Kids05'    ,'Paquete02'),
    ('Kids06'    ,'Paquete02'),
    ('Kids07'    ,'Paquete02'),
    ('Deportes01','Paquete02'),
    ('Deportes02','Paquete02'),
    ('Deportes03','Paquete02'),
    ('Deportes04','Paquete02'),
    ('Deportes05','Paquete02'),
    ('Deportes06','Paquete02'),
    ('Deportes07','Paquete02'),
    ('Deportes08','Paquete02'),
    ('Deportes09','Paquete02'),
    ('Cine01'    ,'Paquete02'),
    ('Cine02'    ,'Paquete02'),
    ('Cine03'    ,'Paquete02'),
    ('Cine04'    ,'Paquete02'),
    ('Cine05'    ,'Paquete02'),
    ('Cine06'    ,'Paquete02'),
    ('Cine07'    ,'Paquete02'),
    ('Cine08'    ,'Paquete02'),
    ('Cine09'    ,'Paquete02'),
    ('Cine10'    ,'Paquete02'),
    ('Radio01'   ,'Paquete02'),
    ('Radio02'   ,'Paquete02'),
    ('Radio08'   ,'Paquete02'),
    ('Radio03'   ,'Paquete02'),
    ('Radio04'   ,'Paquete02'),
    ('Radio05'   ,'Paquete02'),
    ('Radio06'   ,'Paquete02'),
    ('Radio07'   ,'Paquete02'),
    ('Radio09'   ,'Paquete02'),
    ('Radio10'   ,'Paquete02'),
    ('Radio11'   ,'Paquete02'),
    ('Radio12'   ,'Paquete02'),
    ('Radio18'   ,'Paquete02'),
    ('Radio13'   ,'Paquete02'),
    ('Radio14'   ,'Paquete02'),
    ('Radio15'   ,'Paquete02'),
    ('Radio16'   ,'Paquete02'),
    ('Radio17'   ,'Paquete02'),
    ('Radio19'   ,'Paquete02'),
    ('Radio20'   ,'Paquete02'),
    ('Radio21'   ,'Paquete02'),
    ('Radio22'   ,'Paquete02'),
    ('Radio28'   ,'Paquete02'),
    ('Radio23'   ,'Paquete02'),
    ('Radio24'   ,'Paquete02'),
    ('Radio25'   ,'Paquete02'),
    ('Radio26'   ,'Paquete02'),
    ('Radio27'   ,'Paquete02'),
    ('Radio29'   ,'Paquete02'),
    ('Radio31'   ,'Paquete02'),
    ('Radio32'   ,'Paquete02'),
    ('Radio38'   ,'Paquete02'),
    ('Radio33'   ,'Paquete02'),
    ('Radio34'   ,'Paquete02'),
    ('Radio35'   ,'Paquete02'),
    ('Radio36'   ,'Paquete02'),
    ('Radio37'   ,'Paquete02'),
    ('Radio39'   ,'Paquete02'),
    ('Radio30'   ,'Paquete02'),
    ('Mundos01'  ,'Paquete02'),
    ('Mundos02'  ,'Paquete02'),
    ('Mundos08'  ,'Paquete02'),
    ('Mundos03'  ,'Paquete02'),
    ('Mundos04'  ,'Paquete02'),
    ('Mundos05'  ,'Paquete02'),
    ('Mundos06'  ,'Paquete02'),
    ('Mundos07'  ,'Paquete02'),
    ('Mundos09'  ,'Paquete02'),
    ('Mundos10'  ,'Paquete02'),
    ('Mundos12'  ,'Paquete02'),
    ('Mundos11'  ,'Paquete02'),
    ('Mundos13'  ,'Paquete02'),
    ('Mundos14'  ,'Paquete02'),
    ('Mundos15'  ,'Paquete02'),
    ('Mundos16'  ,'Paquete02'),
    ('Mundos17'  ,'Paquete02'),
    ('Mundos18'  ,'Paquete02'),
    ('Mundos19'  ,'Paquete02'),
    ('Mundos20'  ,'Paquete02')
  ) AS Datos (servicio, paquete)
WHERE
  Datos.servicio = Servicio.nombre
  AND Datos.paquete = Paquete.nombre
;

--Planes
INSERT INTO Plan(nombre_plan)
VALUES
  ('TVCABLE Bronce' ),
  ('TVCABLE Plata'  ),
  ('TVCABLE Oro'    );

--Prepagos
INSERT INTO Prepago(codigo_plan, monto)
SELECT Plan.codigo_plan, Datos.monto
FROM
  Plan,
  (VALUES
    ('TVCABLE Bronce', 140),
    ('TVCABLE Plata' , 220)
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
    ('TVCABLE Bronce', 140),
    ('TVCABLE Plata' , 220)
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
    ('Paquete 01', 'TVCABLE Bronce'),
    ('Paquete 02', 'TVCABLE Plata' )
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
    (20309753,'Deco01','TVCABLE Bronce'),
    (21030282,'Deco01','TVCABLE Plata' ),
    (20131092,'Deco03','TVCABLE Bronce'),
    (19379657,'Deco02','TVCABLE Plata' ),
    (19994366,'Deco01','TVCABLE Bronce'),
    (22382687,'Deco04','TVCABLE Bronce'),
    (01235689,'Deco01','TVCABLE Plata' ),
    (00122334,'Deco01','TVCABLE Bronce'),
    (11233445,'Deco03','TVCABLE Bronce'),
    (12332141,'Deco01','TVCABLE Plata' ),
    (09928313,'Deco02','TVCABLE Bronce'),
    (00912314,'Deco01','TVCABLE Plata' ),
    (05232141,'Deco01','TVCABLE Bronce'),
    (35891247,'Deco02','TVCABLE Plata' ),
    (12496710,'Deco03','TVCABLE Bronce'),
    (20131092,'Deco02','TVCABLE Plata' )
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
    ('TVBRAZIL'       ,'Deco03',50,20131092,CURRENT_TIMESTAMP),
    ('SPN'            ,'Deco03',54,20131092,CURRENT_TIMESTAMP),
    ('NoticiasMundial','Deco03',44,20131092,CURRENT_TIMESTAMP),
    ('PeliculasPPV'   ,'Deco03',52,20131092,CURRENT_TIMESTAMP)
  ) AS Datos (nombre_serv, nombre_producto, cantidad, cedula, fecha)
WHERE
  Cliente.cedula  = Datos.cedula AND
  Producto.tipo   = Datos.nombre_producto AND
  Servicio.nombre = Datos.nombre_serv
;

commit;
