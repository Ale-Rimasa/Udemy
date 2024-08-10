--Clase 36 FUNCIONES STRING parte 01

--la funcion ASCII nos devuelve un valor numerico partiendo de un dato caracter
SELECT ASCII('B') -- = 66
SELECT ASCII('@') -- = 64

--La funcion CHAR nos devuelve un caracter a partir de un codigo ASCII
SELECT CHAR(66)
SELECT CHAR(64)

--La funcion LEFT extrae una cantidad de caracteres de un string del lado izquierdo
SELECT LEFT('ALEJANDRO',2)

--LEN devuelve una longitud de la cadena string, contempla los espacios en blancos tambien
SELECT LEN('ALEJANDRO R')

--LOWER nos devuelve una cadena string que esta en MAYUS la devuelve en minus
SELECT LOWER('ALEJANDRO R')

--LTRIM nos quita los espacios en blanco del lado izquierdo
SELECT LTRIM ('     ALEJANDRO R')
SELECT  ('     ALEJANDRO R')


-------------------------------------------------------------------------------------
--Clase 37 FUNCIONES STRING parte 02
--RIGHT: Nos permite extraer una cantidad de caracteres del lado derecho, hayque aplicar que cantidad de caracteres
SELECT RIGHT('DEVELOPER BASE DE DATOS',13)

--RTRIM Limpia los espacios del lado derecho
SELECT RTRIM('HTML                    ') +'  CSS'

--SPACE Nos genera espacios en blancos
SELECT 'JAVASCRIPT'+SPACE(10)+'C#'

--STR: se encarga de un dato numero lo transfore a alfanumerico, hay que indicarle el volumen o longitud para sacar el espacio en blanco
SELECT 5+11
SELECT STR(5)+STR(11)
SELECT STR(5,1)+STR(11,2)

--SUBSTRING Se encarga de tomar una cantidad de caracteres de la posicion que uno indique
--el segundo parametro es la posición donde me paro y el 3er parámetro es la cantidad de letras
SELECT SUBSTRING('QUIERO TRABAJAR COMO DEVELOPER, ESTOY ESTUDIANDO',22,9)

--TRIM: Reemplaza o cumple doble funcion de limpiar los espacios en blanco tanto como la derecha e izquierda

SELECT TRIM('              DEVELOPER              ') + ' DESARROLLADOR'

--UPPER: Convierte las minusculas en mayusculas
SELECT UPPER('CURSO DE BaSE De DaTos')

-------------------------------------------------------------------------------------
--Clase 38 FUNCIONES NUMERICAS parte 01

--AVG: PROMEDIO

SELECT * FROM ALUMNOS

INSERT INTO Notas VALUES('003',11,13,16)
SELECT * FROM Notas
SELECT avg(nota_1) FROM Notas

--COUNT: Devuelve la cantidad de registros de una consulta

SELECT COUNT (codigo) FROM NOTAS

--MAX: nos retorna el maximo dato

SELECT MAX(nota_1) AS [Mayor Nota] FROM NOTAS

-------------------------------------------------------------------------------------
--Clase 39 FUNCIONES NUMERICAS parte 02

--MIN: Devuelve el valor minimo dentro de una columna de informacion

SELECT MIN(nota_1) AS [Menor Nota]FROM NOTAS

--ROUND: Redondea un numero en especifico
SELECT 125.326
SELECT ROUND(125.326,2)
SELECT ROUND(125.326,2,1)

--SUM: Suma la columna que pidas

SELECT SUM(nota_1) FROM NOTAS


-------------------------------------------------------------------------------------
--Clase 40 FUNCIONES FECHAS parte 01

--CURRENT TIMESTAMP(sistema) y SYSDATETIME(sql server) : Dan el mismo resultado por lo general la fecha y hora del sistema

SELECT CURRENT_TIMESTAMP
SELECT SYSDATETIME()

--DATEADD: nos permite hacer controles de fechas, medicion de fecha con la que uno proponga se incrementa la fecha

SELECT DATEADD(year,2,'10/08/2024') --Se modifica solo el año
SELECT DATEADD(MONTH,2,'10/08/2024')
SELECT DATEADD(DAY,2,'10/08/2024')

-------------------------------------------------------------------------------------
--Clase 41 FUNCIONES FECHAS parte 01

--DATEDIFF: Nos devuelve la diferencia entre 2 fechas
SELECT DATEDIFF(YEAR,'01/07/1992','10/08/2024')
SELECT DATEDIFF(MONTH,'01/07/1992','10/08/2024')
SELECT DATEDIFF(DAY,'01/07/2024','10/08/2024')

--DAY Nos devuelve el dia de una fecha específica

SELECT DAY('07/01/1992')

--GETDATE: nos devuelve la fecha del sistema o del dia que estamos parados.

SELECT GETDATE()

--ISDATE: 
SELECT ISDATE('10/08/2024')
SELECT ISDATE('Hola Developer') -- Nos devuelve 0 xq el formato no es de fecha

--MONTH: Nos retorna el mes de una fecha

SELECT MONTH('08/10/2024')

--YEAR Devuelve el año

SELECT YEAR('08/10/2024')