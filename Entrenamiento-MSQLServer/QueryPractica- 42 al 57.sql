--Clase 42 FUNCIONES AVANZADAS

--CAST : Convierte un valor de cualquier tipo a otro especificado.

SELECT CAST(125.30 AS INT)

SELECT 150+'50'
SELECT TRIM(CAST(150 AS CHAR))+'50'

--COALESCE: Devuelve el primer valor NO NULLO de una lista
SELECT COALESCE(NULL,'HOLA',null,'DEVELOPER')

--CONVERT: Convierte un valor de cualquier tipo en un dato especifico
SELECT TRIM(CONVERT(char,125.60))+ ' HOLA FUTURO DEVELOPER'

--IFF Nos indica si un valor es verdadera o otra falsa

SELECT IIF(10 < 11, 'SI ES VERDADERO','ES FALSO')
SELECT IIF(10 > 11, 'SI ES VERDADERO','ES FALSO')

--IS NULL Devuelve el valor verdadero si es nullo

SELECT ISNULL(NULL,'DEVELOPER')

--ISNUMERIC: Evaluamos si el contenido es una expresión numérica, si es numerico = 1, sino es = 0

SELECT ISNUMERIC('HOLA')
SELECT ISNUMERIC('124')
SELECT ISNUMERIC('124HOLA')

--NULLIF: Devuelve NULL si dos expresiones son iguales.

SELECT NULLIF('HOLA','HOLA')
SELECT NULLIF('HOLA','hola')
SELECT NULLIF('HOLA','DEVELOPER')

--SESSION USER : nos devuelve el nombre del usuario de la BD

SELECT SESSION_USER

--SYSTEM USER : DEVUELVE el nombre de inicio de sesion del usuario actual

SELECT SYSTEM_USER

-------------------------------------------------------------------------------------
--Clase 43 CREACIONES DE VISTAS SQL - PARTE 01

--VISTAS: Es una recoleccion de informacion de una determinada tabla. Nos permite recolectar una info de manera indicada depende el resultado que querramos obtener.
--Hay 2 formas de crearlas por interfaz gráfica y a travez de código

--Para poder generar una vista debemos por un lado, seleccionar la tabla, por otro seleccionar la informacion que deseamos para crear la vista
--Las vistas son tablas virtuales partiendo de la info recolectada entre otros objetos

SELECT * FROM View_AlumnosPráctica
SELECT * FROM Alumnos

-------------------------------------------------------------------------------------
--Clase 44 CREACIONES DE VISTAS SQL - PARTE 02
--Se trabaja con la interfaz gráfica
-------------------------------------------------------------------------------------
--Clase 45 CREACIONES DE VISTAS SQL - PARTE 03

CREATE VIEW Vista_Ejemplo --Creacion de la vista
AS
SELECT * FROM Alumnos

SELECT * FROM Vista_Ejemplo --LLamada a la vista
-------------------------------------------------------------------------------------
--Clase 46 CREACIONES DE VISTAS SQL - PARTE 04
--El objetivo de la vista es realizar un resumen para encapsular toda la información compleja en la vista la cual llamaremos.

--Usar filtro en la interfaz gráfica: me posiciono en la Columna que deseo filtrar
--EJ: ='003'

--Vamos a crear una lista de elementos que pueda ser bucado en la columna codigo
-- IN('001';'003')

-------------------------------------------------------------------------------------
--Clase 47 CREACIONES DE VISTAS SQL - PARTE 05
--interfaz gráfica:
--GROUP BY (click derecho)
-------------------------------------------------------------------------------------
--Clase 48 CREACIONES DE VISTAS SQL - PARTE 06
--interfaz gráfica:
--Seguimos trabajando con los filtros, nos posicionamos en la edad y colocamos > 27 nos trae todos los datos mayores a 27

ALTER VIEW Vista_Ejemplo
AS
SELECT Codigo,Nombres,Apellidos FROM Alumnos WHERE Codigo IN ('001', '004')

SELECT * FROM Vista_Ejemplo WHERE Codigo = '001'

-------------------------------------------------------------------------------------
--Clase 49 CREACIONES DE VISTAS SQL - PARTE 07
CREATE VIEW VISTA_EJEMPLO_02
AS
SELECT  A.Codigo,
		A.Nombres,
		A.Apellidos,
		A.Fecha_Naci,
		A.Edad,
		A.codigo_gra,
		N.nota_1,
		N.nota_2,
		N.nota_3
FROM Alumnos A 
INNER JOIN Notas N ON A.Codigo = N.codigo
WHERE        (A.codigo_gra = '003')

SELECT * FROM VISTA_EJEMPLO_02

-------------------------------------------------------------------------------------
--Clase 50 CREAR PROCEDIMIENTOS ALMACENADO - PARTE 01
--El procedimiento almacenado es una serie de codificaciones por el cual podemos llevar a cabo diferentes tareas/proceso
--al resultado que queremos obtener o cargar una info determinada

CREATE PROCEDURE PRUEBA -- CREACION
AS
SELECT * FROM Alumnos
GO

EXEC PRUEBA  --Ejecutar

EXEC BD_Curso_Udemy.DBO.PRUEBA	--Si estoy en otra base de dato y quiero ejecutar un SP asi es la forma

-------------------------------------------------------------------------------------
--Clase 51 CREAR PROCEDIMIENTOS ALMACENADO - PARTE 02
--Ver contenido del SP
sp_helptext prueba

CREATE PROCEDURE PRUEBA  
AS  
SELECT * FROM Alumnos  

-------------------------------------------------------------------------------------
--Clase 52 CREAR PROCEDIMIENTOS ALMACENADO - PARTE 03

CREATE PROCEDURE SP_Buscar_Alumno
@dato varchar(10) --Parametro
AS
SELECT * FROM Alumnos WHERE Codigo=@dato
GO

EXEC SP_Buscar_Alumno '001'

-------------------------------------------------------------------------------------
--Clase 53 CREAR PROCEDIMIENTOS ALMACENADO - PARTE 04
CREATE PROCEDURE SP_NuevoAlumno
@xCodigo varchar(3),
@xNombres varchar(100),
@xApellidos varchar(100),
@xfecha_Nac date,
@xEdad int,
@xCodigo_gra varchar(3)
AS
	insert into Alumnos(Codigo,Nombres,Apellidos,Fecha_Naci,Edad,codigo_gra)
	Values(@xCodigo,@xNombres,@xApellidos,@xfecha_Nac,@xEdad,@xCodigo_gra);
GO

--CREAMOS NUEVO ALUMNO
EXEC SP_NuevoAlumno '006','Luis','Ramos','11/07/1992',32,'001'

-------------------------------------------------------------------------------------
--Clase 54 CREAR PROCEDIMIENTOS ALMACENADO - ACTUALIZAR REGISTRO.

CREATE PROCEDURE SP_ActualizarAlumno
@xCodigo varchar(3),
@xNombres varchar(100),
@xApellidos varchar(100),
@xfecha_Nac date,
@xEdad int,
@xCodigo_gra varchar(3)
AS
	UPDATE Alumnos set Nombres=@xNombres,
					   Apellidos=@xApellidos,
					   Fecha_Naci=@xfecha_Nac,
					   Edad=@xEdad,
					   codigo_gra=@xCodigo_gra
				WHERE Codigo=@xCodigo
GO


EXEC SP_ActualizarAlumno '001','Susana','Gimenez','08-01-1983',41,'001'

SELECT * FROM Alumnos

-------------------------------------------------------------------------------------
--Clase 55 CREAR PROCEDIMIENTOS ALMACENADO - ELIMINAR REGISTRO.

CREATE PROCEDURE SP_EliminarAlumno
@xCodigo varchar(3)
AS
	DELETE FROM Alumnos WHERE Codigo = @xCodigo
GO

EXEC SP_EliminarAlumno '006'

-------------------------------------------------------------------------------------
--Clase 56 CREAR PROCEDIMIENTOS ALMACENADO - CON CONDICIONANTES IF ELSE.
CREATE PROCEDURE SP_Prueba_IF
@xNum int
AS
	if @xNum = 1
		SELECT 'Es el valor de uno'
	else
		SELECT 'Es un valor diferente a uno'
GO

EXEC SP_Prueba_IF 1
EXEC SP_Prueba_IF 55

-------------------------------------------------------------------------------------
--Clase 57 CREAR PROCEDIMIENTOS ALMACENADO - CON CONDICIONANTES IF ELSE COMBINACION DE PROCESOS
CREATE PROCEDURE SP_Mantenimiento_Alumno
@xOpcion int,
@xCodigo varchar(3),
@xNombres varchar(100),
@xApellidos varchar(100),
@xfecha_Nac date,
@xEdad int,
@xCodigo_gra varchar(3)
AS
	if @xOpcion = 1 -- Nuevo registro
	insert into Alumnos(Codigo,
						Nombres,
						Apellidos,
						Fecha_Naci,
						Edad,
						codigo_gra)
				Values(@xCodigo,
					   @xNombres,
					   @xApellidos,
					   @xfecha_Nac,
					   @xEdad,
					   @xCodigo_gra);

	else --Actualizar registro
	UPDATE Alumnos set Nombres=@xNombres,
					   Apellidos=@xApellidos,
					   Fecha_Naci=@xfecha_Nac,
					   Edad=@xEdad,
					   codigo_gra=@xCodigo_gra
				WHERE Codigo=@xCodigo
GO

SELECT * FROM Alumnos

EXEC SP_Mantenimiento_Alumno 2, '002','Melanie','Rodriguez','10-07-2024',0,'001'

