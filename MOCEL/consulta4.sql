select empresa.nombre, sum(prepago.monto)

from
  empresa
  natural join ofrece
  natural join producto
  natural join consume
  natural join contrata
  natural join plan
  inner join cliente using(nro_cliente)
  natural join prepago
  inner   join factura using(nro_cliente)
where factura.cancelada = FALSE

group by empresa.nombre

--having consume.fecha_consumo > max(factura.fecha)

;


------------------------------------
-- Consulta que por ahora lo logra:
------------------------------------
-- no logra aun hacer la parte de la renta basica
-- los gastos de tarifa extra están bien. Creo.

select sum(p.monto) - sum(c.cantidad * s.tarifa)
from consume c natural join servicio s, prepago p
where c.fecha_consumo > ( select max(fecha)
                          from factura )
      and
      c.nro_cliente in ( select nro_cliente
                         from contrata
                         where codigo_plan = p.codigo_plan
                               and
                               nro_serie = c.nro_serie)
