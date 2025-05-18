use editorial
go

-- select * from titulos

--  Mostrar el promedio de venta anual de todos los títulos
SELECT 'Promedio venta anual' = AVG(venta_anual) --, sum(venta_anual)
FROM titulos
