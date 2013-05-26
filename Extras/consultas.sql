--1
SELECT  cl.nombre, pr.tipo, pl.nombre_plan
FROM contrata co, producto pr, plan pl, cliente cl
WHERE co.tipo = cl.tipo AND co.nro = cl.nro AND co.fecha = cl.fecha
   AND co.nro_serie = pr.nro_serie AND co.codigo_plan= pl.codigo_plan;
--2
SELECT pl.nombre_plan, cl.nombre
FROM contrata co, producto pr, plan pl, cliente cl
WHERE co.tipo = cl.tipo AND co.nro = cl.nro AND co.fecha = cl.fecha
   AND co.nro_serie = pr.nro_serie AND co.codigo_plan= pl.codigo_plan;
--3
SELECT emp.nombre, sum(post.renta_basica) AS adeudado, sum(pre.monto) AS adelantado
FROM agrega ag, empresa emp, servicio ser, producto pr, plan pl, consume con, ofrece ofr,
     postpago post, prepago pre, contrata cont
WHERE emp.codigo_empresa = ofr.codigo_empresa AND ofr.nro_serie = pr.nro_serie
   AND con.codigo_serv = ser.codigo_serv AND pr.nro_serie = con.nro_serie
   AND ag.codigo_serv = ser.codigo_serv AND ag.codigo_plan = pl.codigo_plan
   AND post.codigo_plan IN (SELECT pl2.codigo_plan
                                FROM plan pl2
                                WHERE pl2.codigo_plan = pl.codigo_plan)
   OR pre.codigo_plan IN (SELECT pl2.codigo_plan
                                FROM plan pl2
                                WHERE pl2.codigo_plan = pl.codigo_plan)
GROUP BY emp.nombre;

