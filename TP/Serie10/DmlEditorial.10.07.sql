use editorial
go

/* 10.7.	Informar el o los títulos que se vendieron 
más que cualquier otro con forma de pago a 60 días. */
select t.titulo
from titulos as t
inner join (
    select titulo_id
    from ventas as v1
    where forma_pago = '60 días'
    group by titulo_id
    having sum(cantidad) >= all (
        select sum(cantidad)
        from ventas as v2
        where forma_pago = '60 días'
        and v1.titulo_id <> v2.titulo_id
        group by titulo_id
    )
) as v on v.titulo_id = t.titulo_id

select *
from titulos as t
inner join (
    select titulo_id, cantidad = sum(cantidad)
    from ventas as v
    where forma_pago = '60 días'
    group by titulo_id
    having sum(cantidad) >= all(
        select sum(cantidad)
        from ventas as t
        where forma_pago = '60 días'
        and t.titulo_id <> v.titulo_id
        group by titulo_id
    )
) as v on v.titulo_id = t.titulo_id