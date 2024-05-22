
--Video 06 Creacion Base de datos
CREATE DATABASE BD_Curso_Udemy
GO
-------------------------------------------------------------------------------------------
--Video 07 Eliminación Base de datos
DROP DATABASE BD_Curso_Udemy
GO
-------------------------------------------------------------------------------------------
--Video 08 Poner en Uso la Base de Datos SQL Server
USE BD_Curso_Udemy
GO
-------------------------------------------------------------------------------------------
--Video 09 Tipos de datos mas usados en SQL server (FALTAN MAS DATOS)
--Tipo de datos alfanumericos:
varchar()
text --(guarda mucha informacion)
--Tipos de datos numericos:
int
decimal --(guardas mas cantidades de numeros)
numeric
--Tipos de fecha y hora
-datetime
-smalldatetime
-date
-------------------------------------------------------------------------------------------
--Video 10 Crear tabla Parte 1 (Nos muestra como crearla atravez del diseño) - [VIDEO 11 Parte2 mediante codigo]
CREATE TABLE Nombre_Tabla (
	Columna1 Tipo_Dato(Longitud),
	Columna2 Tipo_Dato(Longitud)
)
GO

CREATE TABLE Usuarios(
	Codigo VARCHAR(3) NULL,
	Nombres VARCHAR(50) NULL,
	Apellidos VARCHAR(50) NULL,
	Fecha_Naci DATE NULL,
	Edad INT NULL
)
GO
-------------------------------------------------------------------------------------------
--Video 12 ACTUALIZAR ESTRUCTURA DE TABLA (Nos muestra como anadir en formato diseño, interfaz gráfica)
-------------------------------------------------------------------------------------------
--Video 13 Insertar registros en tabla [Click derecho --> Edit TOP 200] parte 01 interfaz gráfica
-------------------------------------------------------------------------------------------
--Video 14 Insertar registros en tabla parte02, mediante codigo
INSERT INTO Nombre_Tabla(COLUMNA1,COLUMNA2) VALUES(DATO1,DATO2)

INSERT INTO Usuarios (
	Codigo, Nombres, Apellidos,Fecha_Naci,Edad) VALUES	--DATO: La informacion despues del VALUES, debe encajar tal cual sea el tipo de dato.
	('001','Lucia','Rimasa','01/07/1996','27')
GO
-------------------------------------------------------------------------------------------
--Video 15 Insertar registros en tabla parte03, mediante codigo 
INSERT INTO Usuarios VALUES(						--ACA aplicamos direcamente el values, y este tomara la informacion sabiendo que colocar en cada columna
	'004','Solar','Este','05/12/1998','28')		--En el mismo orden		
GO										
-------------------------------------------------------------------------------------------
--Video 16 Actualizar registros en las tablas (Click derecho -> Edit Top 200)

UPDATE NOMBRE_TABLA SET Columna1= DATO1 WHERE Columna2=DATO2;

UPDATE Usuarios SET Fecha_Naci='02/10/2005', Edad= 19 WHERE Codigo = '002'

UPDATE Usuarios SET Nombres='Luis' WHERE Codigo='002'
-------------------------------------------------------------------------------------------
--Video 17 Eliminar Registros de tablas [Interfaz grafica] Click derecho -> edit TOP 200
DELETE FROM Nombre_Tabla WHERE Columna1=dato1

DELETE FROM Usuarios WHERE Codigo= '003'

DELETE FROM Usuarios WHERE Apellidos='rementeria'; --Tener cuidado con este tipo de consultas, xq pueden eliminar mas de una fila pueden haber varios apellidos.
-------------------------------------------------------------------------------------------
--Video 18 CONSULTAS DE REGISTROS, Se agregaron registros y se vio el codigo que genero
-------------------------------------------------------------------------------------------
--Video 19 CONSULTAS DE REGISTROS -

SELECT Codigo, Nombres, Apellidos 
FROM Usuarios
GO

SELECT * FROM Usuarios		-- * "COMODIN" Nos trae todos los campos de la tabla seleccionada.
-------------------------------------------------------------------------------------------
--Video 20 SELECT Distintc a tabla -- FILTRA LA INFORMACION que esta duplicada, muestra una sola

SELECT DISTINCT Apellidos FROM Usuarios
-------------------------------------------------------------------------------------------
--VIDEO 21 SELECT CLAUSULA WHERE : ESTA MANERA NOS PERMITE HACER UNA CONSULTA CON UNA CONDICION

SELECT * FROM Usuarios WHERE Nombres= 'Lucia'

SELECT * FROM Usuarios WHERE Edad >= 29
SELECT * FROM Usuarios WHERE Edad = 27

--Evaluacion de diferencia/diferente
SELECT * FROM Usuarios WHERE Edad <> 32

-------------------------------------------------------------------------------------------
--Video 22 SELECT CLAUSULA WHERE BETWEEN 
