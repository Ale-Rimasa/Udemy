use BD_Curso_Udemy
GO
SELECT * FROM Usuarios
-----------------------------------------------------------------------------
--Clase 22 Select Clausula WHERE Between: Nos indica que tenemos que colocar un valor entre 

SELECT * FROM Usuarios WHERE Edad BETWEEN 30 AND 35
GO

-----------------------------------------------------------------------------
--Clase 23 Select Clausula WHERE LIKE: Busqueda de patrones, busca posible informacion "cercana", %= te trae la info restante.
SELECT * FROM Usuarios WHERE Nombres LIKE 'S%' --Ejemplo: recuerdo la primer palabra el resto no
GO

-----------------------------------------------------------------------------
--Clase 24 Select Clausula WHERE LIKE: Parte2
SELECT * FROM Usuarios WHERE Nombres LIKE '%l%'  --Ejemplo: NO recuerdo la primer palabra pero recuerdo la segunda
GO

-----------------------------------------------------------------------------
--Clase 25 Select Clausula WHERE IN : Nos permite buscar multiples valores dentro de la info, que existe en la tabla
SELECT * FROM Usuarios WHERE Nombres IN('Alejandro','Lucia')
GO

-----------------------------------------------------------------------------
--Clase 26  Select Clausula WHERE AND: Operadores condicionantes (AND,OR,NOT) AND: Debe cumplirse las 2 condiciones para mostrar
SELECT * FROM Usuarios WHERE Nombres= 'Alejandro' AND Edad=31
GO

--Clase 27 Select Clausula WHERE OR : Debe Cumplirse una condicion al menos para que se muestre, te puede traer resultados diferentes depende de la condicion
SELECT * FROM Usuarios WHERE Nombres= 'Lucia' OR Edad=28
GO

SELECT * FROM Usuarios WHERE Nombres= 'Lucia' OR Edad IN (29,32) -- Nos trae el nombre y el 32
GO

SELECT * FROM Usuarios WHERE Codigo='001' OR Apellidos='Floridia'
GO
--Clase 28 Select Clausula WHERE NOT : Adicionandole el operador, no me va a traer el registro de apellido RIMASA
SELECT * FROM Usuarios WHERE NOT Apellidos='Rimasa'
GO

SELECT * FROM Usuarios WHERE NOT Apellidos='Rimasa' AND (NOT Nombres='Nancy') --Aca me trae todos los resultados menos rimasa y floridia
GO

--Clase 29 SELECT ORDER BY: Ordena la informacion atravez de dicha tabla ASC|DESC

SELECT * FROM Usuarios ORDER BY Apellidos --Predeterminado viene de forma ASC

SELECT * FROM Usuarios ORDER BY Edad DESC
GO

SELECT Codigo, Nombres, Apellidos, Edad
FROM Usuarios ORDER BY 1; --Este 1 nos va a marcar que lo ordene por la columna 1 (Codigo)
GO

-- Clase 30 COUNT- AVG-SUM: COUNT: Nos devuelve el numero de filas que coinciden con un criterio específico.
							--AVG: Nos devuelve el promedio de una columna numerica.
							--SUM: devuelve la suma total de una columna numerica.
SELECT COUNT (Codigo) AS Total
FROM Usuarios

SELECT COUNT (Edad) AS PersonasTotales
FROM Usuarios
WHERE Apellidos = 'Rimasa'

-----------AVG-----PROMEDIO---------- Se debe hacer en base a una informacion numerica	
SELECT * FROM Usuarios

SELECT AVG(Edad) AS [Promedio edades]
FROM Usuarios


----------SUM---------SUMA------ Se debe aplicar a informacion nunmerica
SELECT SUM(Edad) AS [Suma edades]
FROM Usuarios WHERE Apellidos= 'Rimasa'

--------------------------------------------------------------------------------------------------
--Clase 31 SELECT GROUP BY : Agrupacion de informacion mediante en cuanto a las filas o registros de dicha tablas
SELECT Apellidos
FROM Usuarios GROUP BY Apellidos   --Todos los datos coincidentes, te va a mostrar un solo resultado. Esta funcion se puede suplementar con AVG,COUNT,SUM

SELECT Apellidos, COUNT(Apellidos) AS [Cantidad Apellidos]
FROM Usuarios
GROUP BY Apellidos

SELECT Apellidos, COUNT(Apellidos) AS [Cantidad Apellidos]
FROM Usuarios WHERE Edad> 28
GROUP BY Apellidos ORDER BY Apellidos DESC