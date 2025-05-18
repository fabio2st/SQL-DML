use editorial
go

/* 8.9. Informar los totales de ventas (pesos) al contado 
entre abril y septiembre del 2014 por cada almacén. 
Mostrar nombre de almacén, y total de venta. Si un almacén no
tiene ventas mostrar en cero. */
select *
from ventas as v 
where year(fecha_orden) = 2014 
    and MONTH(fecha_orden) between 4 and 9
    and v.forma_pago = 'Al contado'

select almacen_nombre, total=isnull(sum(cantidad * precio),0)
from almacenes as al
left join ventas as v on v.almacen_id = al.almacen_id
left join titulos as t on t.titulo_id = v.titulo_id
and year(fecha_orden) = 2014 
    and MONTH(fecha_orden) between 4 and 9
    and v.forma_pago = 'Al contado'
group by al.almacen_id, almacen_nombre

select almacen_nombre, total=isnull(sum(cantidad * precio),0)
from ventas as v 
inner join titulos as t on t.titulo_id = v.titulo_id
    and year(fecha_orden) = 2014 
    and MONTH(fecha_orden) between 4 and 9
    and v.forma_pago = 'Al contado'
right join almacenes as al on v.almacen_id = al.almacen_id
group by al.almacen_id, almacen_nombre