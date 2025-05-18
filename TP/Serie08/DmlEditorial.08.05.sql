use editorial
go

/* 8.5. Informar los autores que no tienen títulos. 
Mostrar nombre y apellido */

select autor_nombre, autor_apellido, ta.autor_id
from autores as a
left outer join titulo_autor as ta on ta.autor_id = a.autor_id
where ta.titulo_id is null

select autor_nombre, autor_apellido--, ta.autor_orden
from titulo_autor as ta 
right join autores as a on a.autor_id = ta.autor_id
group by a.autor_id, autor_nombre, autor_apellido
having count(titulo_id) = 0