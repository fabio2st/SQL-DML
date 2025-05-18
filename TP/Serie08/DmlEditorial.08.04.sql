use editorial
go

/* 8.4. Informar las ventas por título. Mostrar título, 
fecha de orden y cantidad, si no tienen venta al menos 
mostrar una fila que indique la cantidad en 0. 
Ordenar por título y mayor cantidad vendida primero. */

select t.titulo_id, t.titulo, fecha_orden, ISNULL( cantidad, 0) as ventas_cantidad
from titulos as t 
left join ventas as v on t.titulo_id = v.titulo_id
order by titulo, cantidad desc

select t.titulo_id, titulo, fecha_orden, isnull(cantidad, 0) as ventas_cantidad
from ventas as v 
right join titulos as t on t.titulo_id = v.titulo_id
order by titulo, ventas_cantidad desc

select *
from ventas
order by titulo_id, fecha_orden