USE editorial

select *
from titulos

-- obtener los titulos que no tienen precio
SELECT *
FROM titulos
WHERE precio is null

-- obtener los titulos que tienen precio
SELECT *
FROM titulos
WHERE precio is not null

-- mostrar todos los titulos, su precio y notas
-- aquellos que no tengan precio mostrar el mismo en 0
SELECT titulo, isnull(precio,0) as precio, isnull(notas,'') as notas
FROM titulos
