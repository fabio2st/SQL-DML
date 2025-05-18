-- 1.9. Listar los nombres de almacén 
--que hayan tenido ventas sin repetirlos.

select *
from ventas

USE editorial
GO
SELECT DISTINCT almacen_nombre
FROM almacenes as a, ventas as v
WHERE a.almacen_id = v.almacen_id

select almacen_nombre
from almacenes