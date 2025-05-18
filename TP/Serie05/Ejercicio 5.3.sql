use editorial
go

SELECT top 1 almacen_nombre,numero_orden,fecha_orden,titulo
FROM ventas,almacenes,titulos
WHERE ventas.titulo_id = titulos.titulo_id 
AND ventas.almacen_id = almacenes.almacen_id
AND forma_pago LIKE '60 días'
order by cantidad * precio desc

SELECT top 1 almacen_nombre,numero_orden,fecha_orden,titulo
,cantidad * precio as mayor_venta
FROM ventas
inner join almacenes on ventas.almacen_id = almacenes.almacen_id
inner join titulos on ventas.titulo_id = titulos.titulo_id 
WHERE forma_pago = '60 días'
order by mayor_venta desc
