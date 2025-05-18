use editorial
go
/* . Informar la �ltima orden generada por cada almac�n 
con forma de pago a 30 d�as y 60 d�as.
Mostrar c�digo de almac�n, fecha de la orden y forma de pago. 
Ordenar por fecha de orden. */

select *
from ventas
WHERE forma_pago LIKE '%30 d�as%'
	or forma_pago LIKE '%60 d�as%'
order by almacen_id, fecha_orden


SELECT almacen_id,'Fecha orden' = MAX(fecha_orden), max(forma_pago)
FROM ventas
--WHERE ventas.almacen_id = almacenes.almacen_id
WHERE forma_pago LIKE '%30 d�as%'
	or forma_pago LIKE '%60 d�as%'
GROUP BY almacen_id
ORDER BY 'Fecha orden'
