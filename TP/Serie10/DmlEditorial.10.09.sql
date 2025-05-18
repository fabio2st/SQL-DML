use editorial
go

/* 10.9.	Informar el nivel de cargo más alto alcanzado 
por algún empleado de cada editorial. 
Mostrar Nombre de la editorial y nivel de cargo. 
Ordenar por nivel de cargo máximo empezando por el mayor. */
select ed.editorial_nombre, max_nivel
from editoriales as ed
inner join (
    select editorial_id, MAX(nivel_cargo) as max_nivel
    from empleados
    group by editorial_id
) as e on e.editorial_id = ed.editorial_id
order by max_nivel desc

-- mostrando el apellido
select editorial_nombre, Maximo_Nivel_cargo, e2.apellido
from editoriales as ed
inner join (
    select editorial_id, Maximo_Nivel_cargo = max(nivel_Cargo)
    from empleados
    group by editorial_id
) as em on em.editorial_id = ed.editorial_id
inner join empleados as e2 on e2.editorial_id = ed.editorial_id 
    and e2.nivel_cargo = em.Maximo_Nivel_cargo
order by Maximo_Nivel_cargo desc