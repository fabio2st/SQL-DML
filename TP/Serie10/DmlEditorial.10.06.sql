use editorial
go

/* 10.6.	Informar el almacén o los almacenes 
que haya vendido más que todos los otros. 
Mostrar Nombre de almacén y cantidad. */

select almacen_nombre, cantidad
from almacenes as a
inner join (
    select almacen_id, cantidad=sum(cantidad)
    from ventas as v
    group by almacen_id
    having sum(cantidad) > all( 
        select sum(cantidad)
        from ventas as t
        where t.almacen_id <> v.almacen_id
        group by almacen_id
    )
) as v on v.almacen_id = a.almacen_id