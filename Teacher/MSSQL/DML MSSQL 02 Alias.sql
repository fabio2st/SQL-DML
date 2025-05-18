USE editorial
GO

-- alias de columnas
SELECT cargo_id as cargo,
	nivel_cargo nivel,
    doble_cargo = nivel_cargo * 2
FROM empleados

SELECT cargo_id as cargo,
	nivel_cargo nivel,
    doble_cargo = nivel_cargo * 2
FROM empleados
WHERE cargo_id > 10

/* Informar las ventas de titulos. Por cada venta mostrar numero de orden,
	fecha de la operacion, el id del titulo, el titulo , la cantidad,
	el precio y el total de la operacion */
SELECT numero_orden, fecha_orden,
	v.titulo_id, titulo, cantidad, precio,
    total = cantidad * precio
FROM ventas as v, titulos as t
WHERE v.titulo_id = t.titulo_id