use editorial
go

/* 10.5.	Informar los almacenes que hayan vendido 
más del doble que cualquier otro almacén. 
Mostrar Nombre de almacén y cantidad. 
Ordenar por mayor venta primero. */

select a.almacen_nombre, v.cantidad
from almacenes as a
inner join (
    select almacen_id, sum(cantidad) as cantidad
    from ventas
    group by almacen_id
    ) as v on v.almacen_id = a.almacen_id
where v.cantidad > (
    select top 1 sum(cantidad*2)
    from ventas
    group by almacen_id
    order by sum(cantidad*2) asc
    )
order by cantidad desc

select almacen_nombre, cantidad
from almacenes as a
inner join (
    select almacen_id, cantidad=sum(cantidad)
    from ventas
    group by almacen_id
    having sum(cantidad) > some( 
        select sum(cantidad) * 2
        from ventas
        group by almacen_id
    )
) as v on v.almacen_id = a.almacen_id
order by cantidad desc