--Solo hay clientes
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

commit;
