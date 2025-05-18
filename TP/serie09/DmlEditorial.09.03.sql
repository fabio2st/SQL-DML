use editorial
go

/* 9.3. Emitir un informe comparativo entre las ventas del año 2012 
y el año 2014. El informe debe tener las siguientes columnas: 
código de título, titulo, año y cantidad de vendida en el año 
(cada uno correspondiente al código de título de la fila correspondiente).
Tener presente que un título puede tener ventas en un año y no en el otro, 
en cuyo caso debe aparecer igual en el informe el año sin ventas. 
Ordenar por título y año */
select t.titulo_id, titulo, 2012 as anio, isnull(sum(cantidad),0) as cantidad
from titulos as t
left join ventas as v on v.titulo_id = t.titulo_id
    and year(fecha_orden) = 2012
group by t.titulo_id, titulo
union
select t.titulo_id, titulo, 2014, isnull(sum(cantidad),0)
from titulos as t
left join ventas as v on v.titulo_id = t.titulo_id
    and year(fecha_orden) = 2014
group by t.titulo_id, titulo
order by titulo_id, anio
;