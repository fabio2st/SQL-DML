use editorial
go

/* 10.4.	Informar aquellos títulos
 que hayan tenido alguna venta mejor que las ventas del titulo 
 “Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean”. 
 Mostrar titulo y genero. Ordenar por titulo. */

 select *
 from titulos as t
 inner join ventas as v on v.titulo_id = t.titulo_id
 where cantidad > some (
     select cantidad
     from ventas as v
     inner join titulos as t on t.titulo_id = v.titulo_id
--	 where titulo = 'Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean'
    where titulo = 'Secrets of Silicon Valley'
     )

select distinct t.titulo, t.genero
from ventas as v
inner join titulos as t on t.titulo_id = v.titulo_id
where cantidad > some (
    select cantidad
    from ventas as v
    inner join titulos as t on t.titulo_id = v.titulo_id
    where titulo = 'Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean'
    )
order by titulo