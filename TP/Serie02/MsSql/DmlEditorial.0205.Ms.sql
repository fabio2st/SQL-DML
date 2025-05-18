USE editorial
go
SELECT t.titulo_id, titulo, autor_nombre
FROM titulos as t, autores as a, titulo_autor as ta
WHERE t.titulo_id = ta.titulo_id 
	and ta.autor_id = a.autor_id 
	and precio is null

SELECT t.titulo_id, titulo, editorial_nombre
FROM titulos as t, editoriales as e
WHERE t.editorial_id = e.editorial_id
	and precio is null

select *
from titulos
