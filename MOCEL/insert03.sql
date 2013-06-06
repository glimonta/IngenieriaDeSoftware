-- No hay clientes
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
('Plan Mocel 2000'),
('Plan Mixto Plus');

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

commit;
