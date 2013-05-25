CREATE OR REPLACE VIEW facturacion
AS
  SELECT *
  FROM vista_1_2_3 v6, vista_4_5 v7
  WHERE v6.codigo_serv = v5.codigo_servicio
        AND 
;
