use editorial
go

/* 8.1 	Mostrar los tres primeros géneros más vendidos. 
Mostrar género y total de ventas ordenado por mayor total de venta. */
SELECT top 3 genero,'Total ventas' = SUM(cantidad*precio) --, sum(cantidad)
FROM titulos,ventas
WHERE titulos.titulo_id = ventas.titulo_id
GROUP BY genero
ORDER BY 'Total ventas' DESC

SELECT TOP 3 genero, total=SUM(cantidad*precio)
FROM titulos as t
INNER JOIN ventas as v on v.titulo_id = t.titulo_id
GROUP BY genero
ORDER BY total desc
go 