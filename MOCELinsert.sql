--Empresa
INSERT INTO Empresa VALUES (00001,'MOCEL');

--Productos
INSERT INTO Producto VALUES (0000000001,'Iphone 9GS');
INSERT INTO Producto VALUES (0000000002,'Blackberry');
INSERT INTO Producto VALUES (0000000003,'Nokia N999');
INSERT INTO Producto VALUES (0000000004,'Samsumg S7');
INSERT INTO Producto VALUES (0000000005,'Vertu gold');

--Ofrece
INSERT INTO Ofrece VALUES (00001,0000000001);
INSERT INTO Ofrece VALUES (00001,0000000002);
INSERT INTO Ofrece VALUES (00001,0000000003);
INSERT INTO Ofrece VALUES (00001,0000000004);
INSERT INTO Ofrece VALUES (00001,0000000005);


--Clientes
INSERT INTO Cliente VALUES ('C',20309753,'John Mikel'      , 'Bosque Valle',04142342006, CURRENT_DATE,0,0,'ninguna'  );
INSERT INTO Cliente VALUES ('C',21030282,'Gabriela Claret' , 'Macaracuay'  ,04244666383, CURRENT_DATE,0,0,'ninguna'  );
INSERT INTO Cliente VALUES ('C',19379657,'Andrea Salcedo'  , 'California'  ,04263476562, CURRENT_DATE,0,0,'la cucha' );
INSERT INTO Cliente VALUES ('C',20131092,'Marcos Antonio'   , 'Los Samanes' ,04241218886, CURRENT_DATE,0,0,'el lil'   );
INSERT INTO Cliente VALUES ('C',19994366,'Catherine Elena' , 'Oripoto'     ,04129356911, CURRENT_DATE,0,0,'la sis'   );
INSERT INTO Cliente VALUES ('C',22382687,'Reinaldo Enrique', 'Yo no se'    ,04142784945, CURRENT_DATE,0,0,'ninguna'  );
INSERT INTO Cliente VALUES ('R',01235689,'Joel Orlando'    , 'Yo no se'    ,04123093919, CURRENT_DATE,0,0,'ninguna'  );
INSERT INTO Cliente VALUES ('R',00122334,'Fernando Javier' , 'Montalban'   ,04123622646, CURRENT_DATE,0,0,'fercho'   );
INSERT INTO Cliente VALUES ('C',11233445,'Jose Luis'       , 'Yo no se'    ,24124123164, CURRENT_DATE,0,0,'oso'      );
INSERT INTO Cliente VALUES ('R',12332141,'Ramon Marquez'   , 'Yo no se'    ,24124123123, CURRENT_DATE,0,0,'moncho'   );
INSERT INTO Cliente VALUES ('C',09928313,'Manuel Gomez'    , 'Macaracuay'  ,11111111118, CURRENT_DATE,0,0,'elefante' );
INSERT INTO Cliente VALUES ('R',00912314,'Aguacate Guasy'  , 'Magickland'  ,11111111111, CURRENT_DATE,0,0,':)'       );
INSERT INTO Cliente VALUES ('R',05232141,'Eduardo Blanco'  , 'Yo no se'    ,00000000000, CURRENT_DATE,0,0,'ninguna'  );
INSERT INTO Cliente VALUES ('R',35891247,'Angela di Serio' , 'Yo no se'    ,00000000000, CURRENT_DATE,0,0,'ninguna'  );
INSERT INTO Cliente VALUES ('R',12496710,'Oveja Negra'     , 'Hoyo negro'  ,66666666666, CURRENT_DATE,0,0,'malo D:'  );

--Tarjeta
INSERT INTO Tarjeta VALUES (0000000000000000,'C','12-12-2020',000,'USB');
INSERT INTO Tarjeta VALUES (0000000000000001,'C','12-12-2020',001,'USB');
INSERT INTO Tarjeta VALUES (0000000000000002,'C','12-12-2020',002,'USB');
INSERT INTO Tarjeta VALUES (0000000000000003,'C','12-12-2020',003,'USB');
INSERT INTO Tarjeta VALUES (0000000000000004,'C','12-12-2020',004,'USB');
INSERT INTO Tarjeta VALUES (0000000000000005,'C','12-12-2020',005,'USB');


--Tiene
INSERT INTO Tiene VALUES ('C',20309753,CURRENT_DATE,0000000000000000);
INSERT INTO Tiene VALUES ('C',21030282,CURRENT_DATE,0000000000000001);
INSERT INTO Tiene VALUES ('C',20131092,CURRENT_DATE,0000000000000002);
INSERT INTO Tiene VALUES ('C',19379657,CURRENT_DATE,0000000000000003);

--Servicios
INSERT INTO Servicio VALUES (00001,'Segundos moviles MOCEL incluidos',0       ,1000 );
INSERT INTO Servicio VALUES (00002,'Segundos moviles otras incluidos',0       ,1000 );
INSERT INTO Servicio VALUES (00003,'Buzon de voz'                    ,0       ,0    );
INSERT INTO Servicio VALUES (00004,'Mensajes texto incluidos'        ,0       ,200  );
INSERT INTO Servicio VALUES (00005,'Segundos moviles MOCEL incluidos',0       ,39000);
INSERT INTO Servicio VALUES (00006,'Segundos moviles otras incluidos',0       ,2600 );
INSERT INTO Servicio VALUES (00007,'Segundos fijos a TODOS'          ,0       ,5000 );
INSERT INTO Servicio VALUES (00008,'Segundos moviles MOCEL'          ,0.01150 ,0    );
INSERT INTO Servicio VALUES (00009,'Segundos moviles otras'          ,0.01250 ,0    );
INSERT INTO Servicio VALUES (00010,'Segundos fijos a otras'          ,0.01150 ,0    );
INSERT INTO Servicio VALUES (00011,'Segundos a todos'                ,16      ,1500 );
INSERT INTO Servicio VALUES (00012,'Minutos a todos'                 ,19      ,30   );
INSERT INTO Servicio VALUES (00013,'Mensajes de texto'               ,38      ,800  );

--Paquetes
INSERT INTO Paquete VALUES (00001, 'Paquete 01');
INSERT INTO Paquete VALUES (00002, 'Paquete 02');
INSERT INTO Paquete VALUES (00003, 'Paquete 03');

--Brindas
INSERT INTO Brinda VALUES (00001,00001);
INSERT INTO Brinda VALUES (00002,00001);
INSERT INTO Brinda VALUES (00003,00001);
INSERT INTO Brinda VALUES (00004,00001);
INSERT INTO Brinda VALUES (00005,00002);
INSERT INTO Brinda VALUES (00006,00002);
INSERT INTO Brinda VALUES (00007,00002);
INSERT INTO Brinda VALUES (00004,00002);
INSERT INTO Brinda VALUES (00003,00002);
INSERT INTO Brinda VALUES (00008,00002);
INSERT INTO Brinda VALUES (00009,00002);
INSERT INTO Brinda VALUES (00010,00002);

--Planes
INSERT INTO Plan VALUES (00001,'Plan Mocel 2000' );
INSERT INTO Plan VALUES (00002,'Plan Mixto Plus' );
INSERT INTO Plan VALUES (00003,'Plan Mixto Vacio');

--Prepagos
INSERT INTO Prepago VALUES (00001,49   );

--Postpagos
INSERT INTO Postpago VALUES (00002,211   );

--Posees
INSERT INTO Posee VALUES (00001,00001);
INSERT INTO Posee VALUES (00002,00002);

--Contratas
INSERT INTO Tiene VALUES ('C',20309753,CURRENT_DATE,0000000001,00001);
INSERT INTO Tiene VALUES ('C',21030282,CURRENT_DATE,0000000001,00002);
INSERT INTO Tiene VALUES ('C',20131092,CURRENT_DATE,0000000003,00001);
INSERT INTO Tiene VALUES ('C',19379657,CURRENT_DATE,0000000002,00002);
INSERT INTO Tiene VALUES ('C',19994366,CURRENT_DATE,0000000001,00001);
INSERT INTO Tiene VALUES ('C',22382687,CURRENT_DATE,0000000004,00001);
INSERT INTO Tiene VALUES ('R',01235689,CURRENT_DATE,0000000001,00002);
INSERT INTO Tiene VALUES ('R',00122334,CURRENT_DATE,0000000001,00001);
INSERT INTO Tiene VALUES ('C',11233445,CURRENT_DATE,0000000003,00001);
INSERT INTO Tiene VALUES ('R',12332141,CURRENT_DATE,0000000001,00002);
INSERT INTO Tiene VALUES ('C',09928313,CURRENT_DATE,0000000002,00001);
INSERT INTO Tiene VALUES ('R',00912314,CURRENT_DATE,0000000001,00002);
INSERT INTO Tiene VALUES ('R',05232141,CURRENT_DATE,0000000001,00001);
INSERT INTO Tiene VALUES ('R',35891247,CURRENT_DATE,0000000002,00002);
INSERT INTO Tiene VALUES ('R',12496710,CURRENT_DATE,0000000003,00001);
INSERT INTO Tiene VALUES ('C',20131092,CURRENT_DATE,0000000002,00002);

--Cosume
INSERT INTO Consume VALUES (00001,0000000003,50,'C',20131092,CURRENT_DATE,CURRENT_TIMESTAMP);
INSERT INTO Consume VALUES (00002,0000000003,54,'C',20131092,CURRENT_DATE,CURRENT_TIMESTAMP);
INSERT INTO Consume VALUES (00003,0000000003,44,'C',20131092,CURRENT_DATE,CURRENT_TIMESTAMP);
INSERT INTO Consume VALUES (00004,0000000003,52,'C',20131092,CURRENT_DATE,CURRENT_TIMESTAMP);
INSERT INTO Consume VALUES (00001,0000000003,63,'C',20131092,CURRENT_DATE,CURRENT_TIMESTAMP);
