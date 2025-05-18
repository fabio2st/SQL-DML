use editorial
go

/*9.1. Informar las ciudades y estado donde residen 
los autores, las editoriales y los almacenes descartando 
valores duplicados. Ordenar por nombre de ciudad. */
select ciudad, estado
from autores as a
union
select ciudad, estado
from editoriales
union
select ciudad, estado
from almacenes
order by ciudad;