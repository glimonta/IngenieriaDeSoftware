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


