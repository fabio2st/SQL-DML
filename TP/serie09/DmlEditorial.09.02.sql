use editorial
go

/* 9.2. Informar cuantos títulos se han publicado primer semestre del 2011
 y en el primer semestre del 2017. Mostrar dos columnas y dos filas: 
 en la primera columna la descripción del periodo y en la segunda 
 la cantidad de títulos. */
 --select *
select 'Primer semestre 2011' as periodo, 
    count(titulo_id) as cantidad
from titulos
where year(fecha_publicacion) = 2011
    and MONTH(fecha_publicacion) between 1 and 6
union
select 'Primer semestre 2017', count(titulo_id)
from titulos
where year(fecha_publicacion) = 2017
    and MONTH(fecha_publicacion) between 1 and 6 
;