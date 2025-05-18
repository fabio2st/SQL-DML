use editorial
go

/* 10.3.	Informar los autores que han hecho algún título juntos. 
Mostrar los nombres y apellidos de a pares, 
o sea en una misma fila apellido y nombre de un autor 
seguido de apellido y nombre del otro autor. 
Ordenar por apellido y nombre de un autor seguido de apellido y nombre del otro autor. */
select a1.autor_apellido, a1.autor_nombre, a2.autor_apellido, a2.autor_nombre
from autores as a1, autores as a2,
(
    select ta1.autor_id autor1, ta2.autor_id autor2
    --, ta1.titulo_id, ta2.titulo_id
    from titulo_autor as ta1, titulo_autor as ta2
    where ta1.titulo_id = ta2.titulo_id
        and ta1.autor_id > ta2.autor_id
    ) as ta 
where ta.autor1 = a1.autor_id and ta.autor2 = a2.autor_id
order by a1.autor_apellido, a1.autor_nombre, a2.autor_apellido, a2.autor_nombre

select a1.autor_apellido, a1.autor_nombre, a2.autor_apellido, a2.autor_nombre
from autores as a1, autores as a2,
 (
     select ta1.autor_id autor1, ta2.autor_id autor2
    from titulo_autor as ta1, titulo_autor as ta2
    where ta1.titulo_id = ta2.titulo_id
        and ta1.autor_id <> ta2.autor_id
        and ta1.autor_orden < ta2.autor_orden
    ) as ta 
where ta.autor1 = a1.autor_id and ta.autor2 = a2.autor_id
order by a1.autor_apellido, a1.autor_nombre, a2.autor_apellido, a2.autor_nombre

select a1.autor_apellido, a1.autor_nombre, a2.autor_apellido, a2.autor_nombre
from autores as a1, autores as a2
where exists (
    select ta1.autor_id, ta2.autor_id
    from titulo_autor as ta1, titulo_autor as ta2
    where ta1.titulo_id = ta2.titulo_id
    and ta1.autor_id < ta2.autor_id
    and ta1.autor_id = a1.autor_id
    and ta2.autor_id = a2.autor_id
    )
order by a1.autor_apellido, a1.autor_nombre, a2.autor_apellido, a2.autor_nombre

select a1.autor_apellido, a1.autor_nombre, a2.autor_apellido, a2.autor_nombre
from autores as a1, autores as a2
where exists (
    select ta1.autor_id, ta2.autor_id
    from titulo_autor as ta1
    inner join titulo_autor as ta2 on ta1.titulo_id = ta2.titulo_id
    where ta1.autor_id < ta2.autor_id
    and ta1.autor_id = a1.autor_id
    and ta2.autor_id = a2.autor_id
    )
order by a1.autor_apellido, a1.autor_nombre, a2.autor_apellido, a2.autor_nombre

select a1.autor_apellido, a1.autor_nombre, a2.autor_apellido, a2.autor_nombre
from autores as a1, autores as a2
where exists (
    select ta1.autor_id, ta2.autor_id
    from titulo_autor as ta1
    inner join titulo_autor as ta2 on ta1.titulo_id = ta2.titulo_id
    where ta1.autor_id < ta2.autor_id
    and ta1.autor_id = a1.autor_id
    and ta2.autor_id = a2.autor_id
    )
order by a1.autor_apellido, a1.autor_nombre, a2.autor_apellido, a2.autor_nombre
go