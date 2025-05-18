use editorial
go
-- Informar cuantas formas de pago existen
select distinct forma_pago
from ventas

--select distinct forma_pago
SELECT 'Cantidad formas de pago' = COUNT(distinct forma_pago)
FROM ventas

select * from ventas
