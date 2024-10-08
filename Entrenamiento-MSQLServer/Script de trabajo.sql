USE [master]
GO
/****** Object:  Database [BD_Curso_Udemy]    Script Date: 12/8/2024 12:03:44 ******/
CREATE DATABASE [BD_Curso_Udemy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_Curso_Udemy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\BD_Curso_Udemy.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD_Curso_Udemy_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\BD_Curso_Udemy_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BD_Curso_Udemy] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_Curso_Udemy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_Curso_Udemy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_Curso_Udemy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_Curso_Udemy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_Curso_Udemy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_Curso_Udemy] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_Curso_Udemy] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BD_Curso_Udemy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_Curso_Udemy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_Curso_Udemy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_Curso_Udemy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_Curso_Udemy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_Curso_Udemy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_Curso_Udemy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_Curso_Udemy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_Curso_Udemy] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BD_Curso_Udemy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_Curso_Udemy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_Curso_Udemy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_Curso_Udemy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_Curso_Udemy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_Curso_Udemy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_Curso_Udemy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_Curso_Udemy] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BD_Curso_Udemy] SET  MULTI_USER 
GO
ALTER DATABASE [BD_Curso_Udemy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_Curso_Udemy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_Curso_Udemy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_Curso_Udemy] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BD_Curso_Udemy] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BD_Curso_Udemy] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BD_Curso_Udemy] SET QUERY_STORE = OFF
GO
USE [BD_Curso_Udemy]
GO
/****** Object:  Table [dbo].[Alumnos]    Script Date: 12/8/2024 12:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumnos](
	[Codigo] [varchar](3) NOT NULL,
	[Nombres] [varchar](50) NULL,
	[Apellidos] [varchar](50) NULL,
	[Fecha_Naci] [date] NULL,
	[Edad] [int] NULL,
	[codigo_gra] [varchar](3) NULL,
 CONSTRAINT [PK_Alumnos] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_AlumnosPráctica]    Script Date: 12/8/2024 12:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_AlumnosPráctica]
AS
SELECT        TOP (100) PERCENT Codigo, Nombres, Apellidos, Fecha_Naci, Edad, codigo_gra
FROM            dbo.Alumnos
GO
/****** Object:  View [dbo].[Vista_Ejemplo]    Script Date: 12/8/2024 12:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vista_Ejemplo]
AS
SELECT Codigo,Nombres,Apellidos FROM Alumnos WHERE Codigo IN ('001', '004')
GO
/****** Object:  Table [dbo].[Notas]    Script Date: 12/8/2024 12:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notas](
	[codigo] [varchar](3) NOT NULL,
	[nota_1] [numeric](5, 2) NULL,
	[nota_2] [numeric](5, 2) NULL,
	[nota_3] [numeric](5, 2) NULL,
 CONSTRAINT [PK_Notas] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VISTA_EJEMPLO_02]    Script Date: 12/8/2024 12:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VISTA_EJEMPLO_02]
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
GO
/****** Object:  Table [dbo].[Grados]    Script Date: 12/8/2024 12:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grados](
	[CodigoGrado] [varchar](3) NOT NULL,
	[DescripcionGrado] [text] NOT NULL,
 CONSTRAINT [PK_CodigoGrado] PRIMARY KEY CLUSTERED 
(
	[CodigoGrado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[PRUEBA]    Script Date: 12/8/2024 12:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRUEBA]
AS
SELECT * FROM Alumnos
GO
/****** Object:  StoredProcedure [dbo].[SP_ActualizarAlumno]    Script Date: 12/8/2024 12:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ActualizarAlumno]
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
/****** Object:  StoredProcedure [dbo].[SP_Buscar_Alumno]    Script Date: 12/8/2024 12:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Buscar_Alumno]
@dato varchar(10) --Parametro
AS
SELECT * FROM Alumnos WHERE Codigo=@dato
GO
/****** Object:  StoredProcedure [dbo].[SP_EliminarAlumno]    Script Date: 12/8/2024 12:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_EliminarAlumno]
@xCodigo varchar(3)
AS
	DELETE FROM Alumnos WHERE Codigo = @xCodigo
GO
/****** Object:  StoredProcedure [dbo].[SP_Mantenimiento_Alumno]    Script Date: 12/8/2024 12:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Mantenimiento_Alumno]
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
/****** Object:  StoredProcedure [dbo].[SP_NuevoAlumno]    Script Date: 12/8/2024 12:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_NuevoAlumno]
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
/****** Object:  StoredProcedure [dbo].[SP_Prueba_IF]    Script Date: 12/8/2024 12:03:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Prueba_IF]
@xNum int
AS
	if @xNum = 1
		SELECT 'Es el valor de uno'
	else
		SELECT 'Es un valor diferente a uno'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[10] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Alumnos"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 213
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1065
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AlumnosPráctica'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AlumnosPráctica'
GO
USE [master]
GO
ALTER DATABASE [BD_Curso_Udemy] SET  READ_WRITE 
GO
