CREATE OR REPLACE VIEW facturero (nombre_empresa, tipo_cliente, cliente_nro, cliente_nombre,direccion,efectivo,codigo_serv, tarifa, renta, monto,nro_serie, codigo_plan, acumulado, total) AS
  SELECT emp.nombre AS nombre_empresa, cl.tipo AS tipo_cliente, cl.nro AS cliente_nro, cl.nombre AS cliente_nombre, cl.direccion AS direccion ,cl.efectivo AS efectivo, ser.codigo_serv AS codigo_serv, ser.tarifa AS tarifa, post.renta_basica AS renta, pre.monto AS monto, pr.nro_serie AS nro_serie, pl.codigo_plan AS codigo_plan, sum(tarifa *  cast (con.cantidad as integer)) AS acumulado, ((cast (tarifa* cast (con.cantidad as integer) as integer) + cast((cast(monto as integer)+cast(post.renta_basica as integer)) as integer))) AS total
  FROM agrega ag, empresa emp, servicio ser, producto pr, plan pl, consume con, ofrece ofr,
     postpago post, prepago pre, contrata cont, cliente cl, tiene ti, tarjeta tar
  WHERE emp.codigo_empresa = ofr.codigo_empresa AND ofr.nro_serie = pr.nro_serie
    AND con.codigo_serv = ser.codigo_serv AND pr.nro_serie = con.nro_serie
    AND ag.codigo_serv = ser.codigo_serv AND ag.codigo_plan = pl.codigo_plan
    AND ((post.codigo_plan IN (SELECT pl2.codigo_plan
                                FROM plan pl2
                                WHERE pl2.codigo_plan = pl.codigo_plan))
    OR (pre.codigo_plan IN (SELECT pl2.codigo_plan
                                FROM plan pl2
                                WHERE pl2.codigo_plan = pl.codigo_plan)))
    AND cl.tipo = cont.tipo AND cl.nro = cont.nro AND cl.fecha = cont.fecha
    AND pr.nro_serie = cont.nro_serie AND cont.codigo_plan = pl.codigo_plan
    AND tar.numero = ti.numero AND ti.tipo = cl.tipo AND ti.nro = cl.nro
    AND ti.fecha = cl.fecha
GROUP BY (emp.nombre,cl.tipo,cl.nro,cl.nombre,cl.direccion,cl.efectivo,ser.codigo_serv, ser.tarifa, post.renta_basica, pre.monto, pr.nro_serie,pl.codigo_plan);
