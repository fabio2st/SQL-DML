USE editorial
GO

-- Listar los generos de los titulos 
SELECT distinct genero
FROM titulos

-- Listar los generos de los libros y las editoriales
SELECT DISTINCT genero, editorial_id
FROM titulos

-- Informar los autores y los g�neros que han escrito
SELECT distinct a.*, genero
FROM autores as a, titulo_autor as ta, titulos as t
WHERE a.autor_id = ta.autor_id
	AND ta.titulo_id = t.titulo_id

-- Listar las primeras 5 tuplas de la relaci�n empleado.
SELECT top 5  *
FROM empleados

SELECT top 8  *
FROM autores
order by autor_nombre desc, autor_apellido

-- Listar el primer 5% de tuplas de la relaci�n empleado.
SELECT TOP 10 PERCENT *
FROM empleados
