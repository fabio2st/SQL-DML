use editorial
go

/*8.2. Informar las ventas a 60 días. Mostrar el id de título,
 el título y el total de ventas
(cantidad por precio). Renombrar a la columna calculada.*/
select *
from titulos

select *
from ventas
where forma_pago = '60 días'

select t.titulo_id, titulo, sum(cantidad*precio) as total_venta
from titulos as t
inner join ventas as v on v.titulo_id = t.titulo_id
where forma_pago = '60 días'
group by t.titulo_id, titulo