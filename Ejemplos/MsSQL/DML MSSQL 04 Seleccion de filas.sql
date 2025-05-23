﻿USE editorial
go

-- Obtener los descuentos mayores de 5%
SELECT * 
FROM descuentos
WHERE descuento > 5

-- obtener los titulos publicados el 12 de junio del 2011
select *
from titulos
where fecha_publicacion = '20110612'

-- Obtener los empleados contratados en enero del 2013
SELECT *
FROM empleados 
WHERE year(fecha_contratacion) = 2013 AND month(fecha_contratacion) = 1

-- mostrar los empleados contratados en agosto 
SELECT *
FROM empleados
WHERE MONTH( fecha_contratacion) = 8

-- mostrar los empleados contratados en el 2009 y el 2013
SELECT *
FROM empleados
WHERE YEAR( fecha_contratacion) = 2009
	OR YEAR( fecha_contratacion) = 2013

-- mostrar los empleados contratados entre el 2009 y el 2013
SELECT *
FROM empleados
WHERE YEAR( fecha_contratacion) BETWEEN 2009 AND 2013

SELECT *
FROM empleados
WHERE YEAR( fecha_contratacion) >= 2009
	AND YEAR( fecha_contratacion) <= 2013
-- mostrar los empleados contratados en los últimos 10 años
SELECT *, YEAR(GETDATE()) - 10
FROM empleados
WHERE YEAR( fecha_contratacion) > YEAR(GETDATE()) - 11

-- Obtener los autores contratados
SELECT *
FROM autores
WHERE contratado = 'True'	-- conversión implícita de la cadena a 1 ('False' = 0)

SELECT *
FROM autores
WHERE contratado = 0

-- obtener los titulos publicados 
-- entre el 10 y 20 de junio del 2011
select *
from titulos
where fecha_publicacion between '20110610' and '20110620'

-- obtener los titulos publicados antes del 10 de junio del 2011 
-- o despues del 20 del mismo mes
select *
from titulos
where fecha_publicacion not between '20110610' and '20110620'

-- listar los libros sin precio establecido
select *
from titulos
where precio is null

-- listar los libros con precio establecido
select *
from titulos
where precio is not null

-- listar los titulos con sus notas, 
-- si no tiene nota, mostrar una leyenda "Sin datos"
SELECT titulo, titulo_id, ISNULL(notas, 'SIN DATOS') AS Notas
FROM titulos


-- obtener las ventas superiores a $1000 o con mas de 50 unidades. 
-- Informar titulo, almacen id, numero orden, fecha orden, cantidad, precio y total
select t.titulo, almacen_id, numero_orden, fecha_orden, cantidad, precio,
	total=precio*cantidad, titulo
from ventas as v, titulos as t
where v.titulo_id = t.titulo_id
	and (precio*cantidad > 500
		or cantidad > 50)
