use editorial
go

/* 8.8. Informar cuantos títulos “Is Anger the Enemy?” 
vendió cada almacén. Si un almacén no tuvo ventas del mismo 
informar con un cero. Mostrar código de almacén y cantidad*/
--select *
select a.almacen_id, total=isnull(sum(cantidad),0)
from ventas as v
inner join titulos as t on t.titulo_id = v.titulo_id
    and titulo = 'Is Anger the Enemy?'
right join almacenes as a on a.almacen_id = v.almacen_id
group by a.almacen_id