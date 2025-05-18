use editorial
go

/* 10.12.	Informar cuantos títulos escribió cada autor 
inclusive aquellos que no lo hayan hecho aún. 
Mostrar nombre y apellido del autor y cantidad. 
Ordenar por cantidad mayor primero, apellido y nombre. */

select autor_nombre, autor_apellido, isnull(cantidad,0) as cantidad
from autores as a
left join (
    select autor_id, COUNT(titulo_id) as cantidad
    from titulo_autor
    group by autor_id
) as ta on ta.autor_id = a.autor_id
order by cantidad desc, autor_apellido, autor_nombre

select autor_nombre, autor_apellido, COUNT(titulo_id) as cantidad
from autores as a
left join titulo_autor as ta on ta.autor_id = a.autor_id
GROUP BY a.autor_id, autor_nombre, autor_apellido
order by cantidad desc, autor_apellido, autor_nombre