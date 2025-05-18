use editorial
go

/* 8.7. Informar cuantos títulos escribió cada autor 
inclusive aquellos que no lo hayan hecho
aún. Mostrar nombre y apellido del autor y cantidad. 
Ordenar por cantidad mayor primero, apellido y nombre */

select autor_nombre, autor_apellido
    , COUNT(ta.titulo_id) as cantidad
    --, ta.autor_id
from autores as a
left join titulo_autor as ta on ta.autor_id = a.autor_id
GROUP BY a.autor_id, autor_nombre, autor_apellido
order by cantidad desc, autor_apellido, autor_nombre