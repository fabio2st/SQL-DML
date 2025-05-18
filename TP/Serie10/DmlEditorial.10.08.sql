use editorial
go

/* 10.8.	Informar cuantos títulos tiene cada autor. 
Mostrar código de autor, nombre y cantidad de libros. */
select a.autor_id, a.autor_apellido, a.autor_nombre, cantidad
from autores as a
inner join (
    select autor_id, cantidad=COUNT(titulo_id)
    from titulo_autor
    group by autor_id
) as ta on ta.autor_id = a.autor_id

select autor_nombre, autor_apellido, cantidad
from autores as a
inner join (
    select autor_id, COUNT(*) as cantidad
    from titulo_autor
    group by autor_id
) as ta on ta.autor_id = a.autor_id