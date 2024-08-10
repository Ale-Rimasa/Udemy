USE BD_Curso_Udemy
GO
--cambiamos el nombre de la tabla usuarios por alumnos.

--Clase 32 SQL INNER JOIN: Nos permite unificar información cumpliendo ciertos parametros.
	--Inner: nos devuelve registros que tienen valores coincidentes en ambas tablas.
	--LEFT: Devuelve todos los registros de la tabla izquierda y los registros coincidentes de la tabla derecha
	--RIGHT: Devuelve todos los registros de la tabla derecha y los registros coincidentes de la tabla izquierda.
	--FULL: Devuelve todos los registros cuando hay una coincidencia en la tabla izquierda o derecha.

Select * FROM Alumnos
--Actualizamos la informacion
UPDATE Alumnos SET Fecha_Naci= '01/01/2011'

--CREAMOS NUEVA TABLA

CREATE TABLE Grados (
	CodigoGrado VARCHAR(3) NOT NULL,
	DescripcionGrado TEXT NOT NULL,
	CONSTRAINT PK_CodigoGrado PRIMARY KEY (CodigoGrado)
)
GO

INSERT INTO Grados VALUES ('001','1er Grado'),('002','2do Grado'),('003','3er Grado'),('004','4to Grado'),('005','5to Grado')
SELECT * FROM Alumnos
SELECT * FROM Grados
GO

--Actualizamos tabla de alumnos colocando codigoGrado.


SELECT A.Codigo, A.Nombres, A.Apellidos,A.Fecha_Naci,A.Edad, G.DescripcionGrado 
FROM Alumnos A
INNER JOIN Grados G 
ON A.Codigo = G.CodigoGrado
GO

-------------------------------------------------------------------------------------------------
--Clase 33 LEFT JOIN: nos devuelve todos los registro de la tabla izquierda y los registros COINCIDENTES
					-- de la tabla derecha. (EL resultado es NULL desde el lado derecho, si no hay coincidencia.
--Se agrega un registro nuevo con el codigo de grado 008(no existe) para que no coincida.

SELECT A.Codigo, A.Nombres, A.Apellidos, G.DescripcionGrado
FROM Alumnos A
LEFT JOIN Grados G
ON A.Codigo = G.CodigoGrado
GO
--VENTAJA: Vemos que informacion esta sujeta a la relacion y cual es la info o fila que no coinciden

-------------------------------------------------------------------------------------------------
--CLASE 34 RIGHT JOIN:  nos devuelve todos los registro de la tabla derecha y los registros COINCIDENTES
					-- de la tabla izquierda. (EL resultado es NULL desde el lado izquierdo, si no hay coincidencia.
SELECT * FROM Alumnos
SELECT * FROM Grados
SELECT A.Codigo, A.Nombres, G.DescripcionGrado
FROM Alumnos A
RIGHT JOIN Grados G 
ON A.Codigo = G.CodigoGrado
GO

-------------------------------------------------------------------------------------------------
--CLASE 34 FULL JOIN: Nos muestra la informacion coincidente como la informacion no coincidente, las unificas todas  en un resultado.
						--Se ocupa muy poca este parametro

SELECT * FROM Alumnos A
FULL OUTER JOIN Grados G
ON A.Codigo = G.CodigoGrado
GO

-------------------------------------------------------------------------------------------------
--Clase 36 FUNCIONES STRING
