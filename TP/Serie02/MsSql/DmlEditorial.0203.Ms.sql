USE EDITORIAL
go
SELECT nombre, apellido, cargo_id, nivel_cargo
FROM empleados 
WHERE cargo_id between 10 and 13 
	and nivel_cargo < 100
	--and nivel_cargo !> 99
	--AND NOT nivel_cargo >= 100

select *
from cargos
