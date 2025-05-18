use editorial
go

/* 10.2.	Informar las editoriales que no hayan contratados empleados 
en el año 2010 excepto que sean Director editorial, Diseñador o Editor. 
Mostrar nombre de editorial. Ordenar. */
select *
from editoriales as e
--inner join empleados on empleados.editorial_id = e.editorial_id
--inner join cargos as c on c.cargo_id = empleados.cargo_id
where e.editorial_id not in (
    select editorial_id
    from empleados as e
    inner join cargos as c on c.cargo_id = e.cargo_id
    where year(fecha_contratacion) = 2010
    and cargo_descripcion not in ('Director editorial', 'Diseñador', 'Editor')
    )

select *
from editoriales
where editorial_id not in (
    select distinct editorial_id
    from empleados as e
    inner join cargos as c on c.cargo_id = e.cargo_id
    where e.fecha_contratacion between '20100101' and '20101231'
    and cargo_descripcion not in ('Director editorial', 'Diseñador', 'Editor')
    )

select *
from editoriales as ed
where not exists (
    select 1
    from empleados as e
    inner join cargos as c on c.cargo_id = e.cargo_id
    where e.fecha_contratacion between '20100101' and '20101231'
    and cargo_descripcion not in ('Director editorial', 'Diseñador', 'Editor')
    and ed.editorial_id = e.editorial_id
    )