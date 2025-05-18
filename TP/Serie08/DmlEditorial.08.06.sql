use editorial
go

/* 8.6. Informar todos los cargos y los empleados que le 
corresponden de la editorial 'New Moon Books', 
si algún cargo está vacante informar como 'Vacante' en apellido.
Mostrar descripción del cargo, apellido y nombre. 
Ordenar por descripción del cargo, apellido y nombre */
select * from cargos

select isnull(e.apellido,'Vacante') as apellido
    , ISNULL(e.nombre,'---') AS nombre
    , d.editorial_nombre
    ,c.cargo_descripcion
from empleados e
inner join editoriales d on d.editorial_id = e.editorial_id 
and d.editorial_nombre = 'New Moon Books'
right outer join cargos c on c.cargo_id = e.cargo_id
--where d.editorial_nombre = 'New Moon Books'
order by c.cargo_descripcion, apellido, e.nombre