use editorial
go
/* . Informar la última orden generada por cada almacén 
con forma de pago a 30 días y 60 días.
Mostrar código de almacén, fecha de la orden y forma de pago. 
Ordenar por fecha de orden. */

select *
from ventas
WHERE forma_pago LIKE '%30 días%'
	or forma_pago LIKE '%60 días%'
order by almacen_id, fecha_orden


SELECT almacen_id,'Fecha orden' = MAX(fecha_orden), max(forma_pago)
FROM ventas
--WHERE ventas.almacen_id = almacenes.almacen_id
WHERE forma_pago LIKE '%30 días%'
	or forma_pago LIKE '%60 días%'
GROUP BY almacen_id
ORDER BY 'Fecha orden'
