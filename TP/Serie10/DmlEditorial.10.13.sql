use editorial
go

/* 10.13.	Informar el monto de regalías a pagar por cada autor, 
inclusive aquellos que no tengan ventas, 
de las ventas del año 2013 de la editorial “Binnet & Hardley”. 
Mostrar apellido y nombre del autor y monto a pagar. 
Tener en cuenta que hay que operar la regalía del título 
y sobre esta la regalía del autor respecto a ese libro. */

select autor_apellido, autor_nombre, v.regalias
from autores as a
inner join (
    select ta.autor_id, sum(isnull(cantidad,0) * precio * t.regalias / 100 * ta.porcentaje_regalias / 100) as regalias
    from titulo_autor as ta
    inner join titulos as t on t.titulo_id = ta.titulo_id
    inner join editoriales as e on e.editorial_id = t.editorial_id
    left join ventas as v on v.titulo_id = ta.titulo_id and fecha_orden between '20130101' and '20131231' 
    where e.editorial_nombre = 'Binnet & Hardley'
    group by ta.autor_id
) as v on v.autor_id = a.autor_id

select a.autor_nombre, a.autor_apellido, 
    regalias = sum(cantidad * precio * regalias / 100 * porcentaje_regalias / 100)
from autores as a
inner join titulo_autor as ta on a.autor_id = ta.autor_id
inner join titulos as t on t.titulo_id = ta.titulo_id
inner join editoriales as e on e.editorial_id = t.editorial_id
    and editorial_nombre = 'Binnet & Hardley'
left join ventas as v on v.titulo_id = ta.titulo_id
    and year(fecha_orden) = 2013
group by a.autor_id, a.autor_nombre, a.autor_apellido

select autor_apellido, autor_nombre, isnull(v.regalias,0)
from autores as a
inner join titulo_autor as ta on ta.autor_id = a.autor_id
inner join titulos as t on t.titulo_id = ta.titulo_id
inner join editoriales as e on e.editorial_id = t.editorial_id
left join (
select ta.autor_id, sum(cantidad * precio * t.regalias / 100 * ta.porcentaje_regalias / 100) as regalias
from ventas as v
inner join titulos as t on v.titulo_id = t.titulo_id
inner join titulo_autor as ta on ta.titulo_id = t.titulo_id
inner join editoriales as e on e.editorial_id = t.editorial_id
where fecha_orden between '20130101' and '20131231'
and e.editorial_nombre = 'Binnet & Hardley'
group by ta.autor_id
) as v on v.autor_id = a.autor_id
where e.editorial_nombre = 'Binnet & Hardley'