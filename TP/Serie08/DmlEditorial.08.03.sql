use editorial
go

/* 8.3. Informar los autores que hayan escrito varios géneros de libros. 
Mostrar nombre y cantidad de géneros ordenados por esta última columna
 empezando por el mayor */

select autor_nombre, count(distinct genero) as cantidad
from autores as a
inner join titulo_autor as ta on a.autor_id = ta.autor_id
inner join titulos as t on ta.titulo_id = t.titulo_id
--order by a.autor_id
group by a.autor_id, autor_nombre
having count(distinct genero) > 1
order by cantidad desc

/* 8.3. Informar para que editorial ha trabajado cada autor. 
Mostrar Apellido y nombre del autor y nombre de la editorial. 
Ordenar por Apellido y nombre del autor y nombre de la editorial */
select distinct autor_apellido, autor_nombre, editorial_nombre
from autores as a
inner join titulo_autor as ta on ta.autor_id = a.autor_id
inner join titulos as t on t.titulo_id = ta.titulo_id
inner join editoriales as e on e.editorial_id = t.editorial_id
order by autor_apellido, autor_nombre, editorial_nombre