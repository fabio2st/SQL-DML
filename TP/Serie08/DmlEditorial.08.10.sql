use editorial
go

/*8.10. Informar el monto de regalías a pagar por cada autor, 
inclusive aquellos que no tengan ventas, de las ventas del año 2013
de la editorial “Binnet & Hardley”. Mostrar apellido y nombre 
del autor y monto a pagar. Tener en cuenta que hay que operar la
regalía del título y sobre esta la regalía del autor respecto 
a ese libro. */
select a.autor_nombre, a.autor_apellido
    ,regalias = sum(cantidad * precio * regalias / 100 * porcentaje_regalias / 100)
--select *
from autores as a
inner join titulo_autor as ta on ta.autor_id = a.autor_id
inner join titulos as t on t.titulo_id = ta.titulo_id
inner join editoriales as e on e.editorial_id = t.editorial_id
    and editorial_nombre = 'Binnet & Hardley'
left join ventas as v on v.titulo_id = ta.titulo_id
    and year(fecha_orden) = 2013
group by a.autor_id, a.autor_nombre, a.autor_apellido

select *
from ventas
where year(fecha_orden) = 2013

select a.autor_nombre, a.autor_apellido, --sum(cantidad * precio),
    regalias = isnull( sum((cantidad * precio) * t.regalias / 100 * ta.porcentaje_regalias / 100), 0)
--select *
from autores as a
inner join titulo_autor as ta on a.autor_id = ta.autor_id
inner join titulos as t on t.titulo_id = ta.titulo_id
inner join editoriales as e on e.editorial_id = t.editorial_id
    and editorial_nombre = 'Binnet & Hardley'
left join ventas as v on v.titulo_id = ta.titulo_id
    and year(fecha_orden) = 2013
group by a.autor_id, a.autor_nombre, a.autor_apellido

select a.autor_nombre, a.autor_apellido, 
    regalias = sum(cantidad * precio * regalias / 100 * porcentaje_regalias / 100)
--select *
from ventas as v
inner join titulos as t on t.titulo_id = v.titulo_id
inner join editoriales as e on e.editorial_id = t.editorial_id
and year(fecha_orden) = 2013
inner join titulo_autor as ta on ta.titulo_id = t.titulo_id
    and editorial_nombre = 'Binnet & Hardley'
right join autores as a on a.autor_id = ta.autor_id
group by a.autor_id, a.autor_nombre, a.autor_apellido