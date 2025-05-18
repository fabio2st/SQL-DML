USE editorial
GO
select *
from plan_regalias
-- informar el mínimo porcentaje de plan de regalias
select min(regalias)
from plan_regalias

-- informar el máximo porcentaje de plan de regalias
select max(regalias)
from plan_regalias

-- informar la sumatoria de planes de regalias
select sum(regalias) as suma
from plan_regalias

-- informar la cantidad de planes de regalias
select count(regalias) as conteo_regalias, count(*) as conteo_filas
from plan_regalias

-- informar el porcentaje promedio de planes de regalias
select avg(regalias), sum(regalias) / count(regalias)
from plan_regalias

-- informar cuantos porcentajes de plan de regalias existen

select distinct regalias
from plan_regalias

select count(distinct regalias)
from plan_regalias

-- informar cuantos porcentajes de plan de regalias existen 
-- para el título "Is Anger the Enemy?"
select COUNT(*)
from plan_regalias as p, titulos as t
where p.titulo_id = t.titulo_id
and titulo = 'Is Anger the Enemy?'

-- cuantos empleados hay en cada cargo
select *
from empleados
order by cargo_id

select cargo_id, COUNT(*)
from empleados
group by cargo_id

select e.cargo_id, c.cargo_descripcion, cantidad_empleados = COUNT(*)
from empleados as e, cargos as c
where e.cargo_id = c.cargo_id
group by e.cargo_id, cargo_descripcion
order by COUNT(*) desc

-- informar cuantos empleados fueron contratados cada año
select * 
from empleados

SELECT year(fecha_contratacion), COUNT(*)
FROM empleados
GROUP BY year(fecha_contratacion)


-- informar cuales años se han contratado mas de cuatro empleado
SELECT year(fecha_contratacion), COUNT(*)
FROM empleados
GROUP BY year(fecha_contratacion)
HAVING COUNT(*) > 4

--informar los cargos que tengan un solo empleado
select e.cargo_id, COUNT(*) AS cantidad
from empleados as e, cargos as c
where e.cargo_id = c.cargo_id
GROUP BY e.cargo_id
HAVING COUNT(*) = 1

