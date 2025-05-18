use editorial
go

/* 10.10.	Informar los autores que hayan escrito varios géneros de libros. 
Mostrar nombre y cantidad de géneros 
ordenados por esta última columna empezando por el mayor. */

select autor_nombre, cantidad
from autores as a
inner join (
    select ta.autor_id, COUNT(distinct genero) as cantidad
    from titulo_autor as ta
    inner join titulos as t on ta.titulo_id = t.titulo_id
    group by autor_id
    having COUNT(distinct genero) > 1
) as g on g.autor_id = a.autor_id
order by cantidad desc

select autor_nombre, count(distinct genero) as cantidad
from autores as a
inner join titulo_autor as ta on a.autor_id = ta.autor_id
inner join titulos as t on ta.titulo_id = t.titulo_id
group by a.autor_id, autor_nombre
having count(distinct genero) > 1
order by cantidad desc