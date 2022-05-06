
USE [master]
GO
/****** Object:  Database [SoporteTecnico]    Script Date: 3/01/2021 17:45:38 ******/
CREATE DATABASE [SoporteTecnico]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SoporteTecnico].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SoporteTecnico] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SoporteTecnico] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SoporteTecnico] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SoporteTecnico] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SoporteTecnico] SET ARITHABORT OFF 
GO
ALTER DATABASE [SoporteTecnico] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SoporteTecnico] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SoporteTecnico] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SoporteTecnico] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SoporteTecnico] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SoporteTecnico] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SoporteTecnico] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SoporteTecnico] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SoporteTecnico] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SoporteTecnico] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SoporteTecnico] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SoporteTecnico] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SoporteTecnico] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SoporteTecnico] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [SoporteTecnico] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SoporteTecnico] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SoporteTecnico] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SoporteTecnico] SET RECOVERY FULL 
GO
ALTER DATABASE [SoporteTecnico] SET  MULTI_USER 
GO
ALTER DATABASE [SoporteTecnico] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SoporteTecnico] SET DB_CHAINING OFF 
GO
USE [SoporteTecnico]
GO
/****** Object:  UserDefinedFunction [dbo].[_generar_codigo_persona_juridica]    Script Date: 3/01/2021 17:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[_generar_codigo_persona_juridica] 
(
	
)
RETURNS varchar(max)
AS
BEGIN
	declare @numero int
	declare @_numero varchar(max) = ''
	SELECT  @numero = cast(SUBSTRING(MAX(CodgoPJ),3, LEN(MAX(CodgoPJ))) as int) FROM dbo.PersonaJuridica
	if (@numero is null)
	    set @_numero = 'PJ00000001'
	else
	    begin
	         set @numero = @numero + 1
	         if len( cast(@numero as varchar(max)))=1
	            set @_numero = 'PJ0000000' + cast(@numero as varchar(max))
	         if len( cast(@numero as varchar(max)))=2
	            set @_numero = 'PJ000000' + cast(@numero as varchar(max))
	         if len( cast(@numero as varchar(max)))=3
	            set @_numero = 'PJ00000' + cast(@numero as varchar(max))
	         if len( cast(@numero as varchar(max)))=4
	            set @_numero = 'PJ0000' + cast(@numero as varchar(max))
	         if len( cast(@numero as varchar(max)))=5
	            set @_numero = 'PJ000' + cast(@numero as varchar(max))
	         if len( cast(@numero as varchar(max)))=6
	            set @_numero = 'PJ00' + cast(@numero as varchar(max))
	         if len( cast(@numero as varchar(max)))=7
	            set @_numero = 'PJ0' + cast(@numero as varchar(max))
	         if len( cast(@numero as varchar(max)))=8
	            set @_numero = 'PJ' + cast(@numero as varchar(max))
	            
	    end    
	RETURN @_numero
END

GO
/****** Object:  UserDefinedFunction [dbo].[_generar_codigo_persona_natural]    Script Date: 3/01/2021 17:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[_generar_codigo_persona_natural] 
(
	
)
RETURNS varchar(max)
AS
BEGIN
	declare @numero int
	declare @_numero varchar(max) = ''
	SELECT  @numero = cast(SUBSTRING(MAX(CodgoPN),3, LEN(MAX(CodgoPN))) as int) FROM dbo.PersonaNatural
	if (@numero is null)
	    set @_numero = 'PN00000001'
	else
	    begin
	         set @numero = @numero + 1
	         if len( cast(@numero as varchar(max)))=1
	            set @_numero = 'PN0000000' + cast(@numero as varchar(max))
	         if len( cast(@numero as varchar(max)))=2
	            set @_numero = 'PN000000' + cast(@numero as varchar(max))
	         if len( cast(@numero as varchar(max)))=3
	            set @_numero = 'PN00000' + cast(@numero as varchar(max))
	         if len( cast(@numero as varchar(max)))=4
	            set @_numero = 'PN0000' + cast(@numero as varchar(max))
	         if len( cast(@numero as varchar(max)))=5
	            set @_numero = 'PN000' + cast(@numero as varchar(max))
	         if len( cast(@numero as varchar(max)))=6
	            set @_numero = 'PN00' + cast(@numero as varchar(max))
	         if len( cast(@numero as varchar(max)))=7
	            set @_numero = 'PN0' + cast(@numero as varchar(max))
	         if len( cast(@numero as varchar(max)))=8
	            set @_numero = 'PN' + cast(@numero as varchar(max))
	            
	    end    
	RETURN @_numero
END

GO
/****** Object:  Table [dbo].[Area]    Script Date: 3/01/2021 17:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Area](
	[CodigoA] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[CodigoA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Color]    Script Date: 3/01/2021 17:45:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Color](
	[CodigoCo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[CodigoCo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Componente]    Script Date: 3/01/2021 17:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Componente](
	[CodigoC] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Componente] PRIMARY KEY CLUSTERED 
(
	[CodigoC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Descripcion]    Script Date: 3/01/2021 17:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Descripcion](
	[CodigoE] [int] NOT NULL,
	[CodigoM] [int] NOT NULL,
	[CodigoMo] [int] NOT NULL,
	[CodigoCo] [int] NOT NULL,
	[Funciona] [bit] NOT NULL,
	[Observacion] [varchar](max) NULL,
 CONSTRAINT [PK_Descripcion] PRIMARY KEY CLUSTERED 
(
	[CodigoE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DestalleSolicitud]    Script Date: 3/01/2021 17:45:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DestalleSolicitud](
	[CodigoDS] [int] IDENTITY(1,1) NOT NULL,
	[CodigoS] [int] NOT NULL,
	[CodigoM] [int] NOT NULL,
 CONSTRAINT [PK_DestalleSolicitud] PRIMARY KEY CLUSTERED 
(
	[CodigoDS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[DetalleEquipo]    Script Date: 3/01/2021 17:45:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetalleEquipo](
	[CodigoDE] [int] IDENTITY(1,1) NOT NULL,
	[CodigoE] [int] NOT NULL,
	[CodigoC] [int] NOT NULL,
	[NroSerie] [varchar](max) NOT NULL,
	[CodigoM] [int] NOT NULL,
	[CodigoMo] [int] NOT NULL,
	[CodigoCo] [int] NOT NULL,
	[OtrasCaracteristicasComponente] [varchar](max) NOT NULL,
	[Funciona] [bit] NOT NULL,
	[Observacion] [varchar](max) NULL,
 CONSTRAINT [PK_DetalleEquipo] PRIMARY KEY CLUSTERED 
(
	[CodigoDE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Equipo]    Script Date: 3/01/2021 17:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipo](
	[CodigoE] [int] IDENTITY(1,1) NOT NULL,
	[CodigoV] [int] NOT NULL,
	[CodigoDS] [int] NOT NULL,
 CONSTRAINT [PK_Equipo] PRIMARY KEY CLUSTERED 
(
	[CodigoE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[EstadoSolicitud]    Script Date: 3/01/2021 17:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EstadoSolicitud](
	[CodigoES] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
 CONSTRAINT [PK_EstadoSolicitud] PRIMARY KEY CLUSTERED 
(
	[CodigoES] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 3/01/2021 17:45:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Marca](
	[CodigoM] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[CodigoM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Modalidad]    Script Date: 3/01/2021 17:45:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Modalidad](
	[CodigoM] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](17) NOT NULL,
	[CodigoS] [int] NOT NULL,
 CONSTRAINT [PK_Modalidad] PRIMARY KEY CLUSTERED 
(
	[CodigoM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Modelo]    Script Date: 3/01/2021 17:45:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Modelo](
	[CodigoMo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Modelo] PRIMARY KEY CLUSTERED 
(
	[CodigoMo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NivelTinta]    Script Date: 3/01/2021 17:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NivelTinta](
	[CodigoE] [int] NOT NULL,
	[PorcentajeCyan] [int] NOT NULL,
	[PorcentajeMagenta] [int] NOT NULL,
	[PorcentajeYellow] [int] NOT NULL,
	[PorcentajeBlack] [int] NOT NULL,
 CONSTRAINT [PK_NivelTinta_1] PRIMARY KEY CLUSTERED 
(
	[CodigoE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[PersonaJuridica]    Script Date: 3/01/2021 17:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PersonaJuridica](
	[CodgoPJ] [varchar](10) NOT NULL,
	[NroRUC] [varchar](11) NOT NULL,
	[RazonSocial] [varchar](max) NOT NULL,
	[Direccion] [varchar](max) NOT NULL,
	[TelefonoFijo] [varchar](6) NOT NULL,
	[TelefonoMovil] [varchar](9) NOT NULL,
	[Login] [varchar](max) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[Email] [varchar](max) NOT NULL,
	[Faceboock] [varchar](max) NULL,
	[Twiter] [varchar](max) NULL,
 CONSTRAINT [PK_PersonaJuridica] PRIMARY KEY CLUSTERED 
(
	[CodgoPJ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Personal]    Script Date: 3/01/2021 17:45:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Personal](
	[CodigoP] [int] IDENTITY(1,1) NOT NULL,
	[NroDNI] [varchar](8) NOT NULL,
	[ApellidoPaterno] [varchar](15) NOT NULL,
	[ApellidoMaterno] [varchar](15) NOT NULL,
	[Nombre] [varchar](15) NOT NULL,
	[Direccion] [varchar](max) NOT NULL,
	[TelefonoFijo] [varchar](6) NULL,
	[TelefonoMovil] [varchar](9) NOT NULL,
	[Login] [varchar](max) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[Email] [varchar](max) NULL,
	[Faceboock] [varchar](max) NULL,
	[Twiter] [varchar](max) NULL,
	[Estado] [bit] NOT NULL,
	[CodigoTP] [int] NOT NULL,
	[CodigoA] [int] NOT NULL,
 CONSTRAINT [PK_Personal] PRIMARY KEY CLUSTERED 
(
	[CodigoP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PersonaNatural]    Script Date: 3/01/2021 17:45:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PersonaNatural](
	[CodgoPN] [varchar](10) NOT NULL,
	[NroDNI] [varchar](8) NOT NULL,
	[ApellidoPaterno] [varchar](15) NOT NULL,
	[ApellidoMaterno] [varchar](15) NOT NULL,
	[Nombre] [varchar](15) NOT NULL,
	[Direccion] [varchar](max) NOT NULL,
	[TelefonoFijo] [varchar](6) NULL,
	[TelefonoMovil] [varchar](9) NULL,
	[Login] [varchar](max) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[Email] [varchar](max) NULL,
	[Faceboock] [varchar](max) NULL,
	[Twiter] [varchar](max) NULL,
 CONSTRAINT [PK_PersonaNatural_1] PRIMARY KEY CLUSTERED 
(
	[CodgoPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Servicios]    Script Date: 3/01/2021 17:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Servicios](
	[CodigoS] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](22) NOT NULL,
 CONSTRAINT [PK_Servicios] PRIMARY KEY CLUSTERED 
(
	[CodigoS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Solicitud]    Script Date: 3/01/2021 17:45:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Solicitud](
	[CodigoS] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[CodigoES] [int] NOT NULL,
	[CodigoPersona] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Solicitud] PRIMARY KEY CLUSTERED 
(
	[CodigoS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tarea]    Script Date: 3/01/2021 17:45:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tarea](
	[CodigoT] [int] IDENTITY(1,1) NOT NULL,
	[Diagnostico] [varchar](max) NULL,
	[Solucion] [varchar](max) NULL,
	[CodigoP] [int] NOT NULL,
	[CodigoE] [int] NOT NULL,
 CONSTRAINT [PK_Tarea] PRIMARY KEY CLUSTERED 
(
	[CodigoT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoEquipo]    Script Date: 3/01/2021 17:45:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoEquipo](
	[CodigoTE] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](max) NULL,
 CONSTRAINT [PK_TipoEquipo] PRIMARY KEY CLUSTERED 
(
	[CodigoTE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoPersonal]    Script Date: 3/01/2021 17:45:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoPersonal](
	[CodigoTP] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](13) NOT NULL,
 CONSTRAINT [PK_TipoPersonal] PRIMARY KEY CLUSTERED 
(
	[CodigoTP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Visita]    Script Date: 3/01/2021 17:45:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visita](
	[CodigoV] [int] IDENTITY(1,1) NOT NULL,
	[CodigoS] [int] NOT NULL,
	[CodigoP] [int] NOT NULL,
	[FechaAsignacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Visita] PRIMARY KEY CLUSTERED 
(
	[CodigoV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  View [dbo].[View_1]    Script Date: 3/01/2021 17:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT     dbo.Solicitud.CodigoS AS [NRO. SOLICITUD], dbo.Servicios.Descripcion AS SERVICIO, dbo.Modalidad.Descripcion AS MODALIDAD
FROM         dbo.PersonaNatural INNER JOIN
                      dbo.Solicitud ON dbo.PersonaNatural.CodgoPN = dbo.Solicitud.CodigoPersona INNER JOIN
                      dbo.EstadoSolicitud ON dbo.Solicitud.CodigoES = dbo.EstadoSolicitud.CodigoES INNER JOIN
                      dbo.DestalleSolicitud ON dbo.Solicitud.CodigoS = dbo.DestalleSolicitud.CodigoS INNER JOIN
                      dbo.Modalidad ON dbo.DestalleSolicitud.CodigoM = dbo.Modalidad.CodigoM INNER JOIN
                      dbo.Servicios ON dbo.Modalidad.CodigoS = dbo.Servicios.CodigoS
WHERE     (dbo.EstadoSolicitud.Descripcion = 'PENDIENTE')
GROUP BY dbo.Solicitud.CodigoS, dbo.Servicios.Descripcion, dbo.Modalidad.Descripcion
HAVING      (dbo.Solicitud.CodigoS = 194)

GO
SET IDENTITY_INSERT [dbo].[Area] ON 

INSERT [dbo].[Area] ([CodigoA], [Descripcion]) VALUES (1, N'ELECTRONICA')
INSERT [dbo].[Area] ([CodigoA], [Descripcion]) VALUES (2, N'PC Y LAPTOPS')
INSERT [dbo].[Area] ([CodigoA], [Descripcion]) VALUES (3, N'IMPRESORAS')
INSERT [dbo].[Area] ([CodigoA], [Descripcion]) VALUES (4, N'REDES')
INSERT [dbo].[Area] ([CodigoA], [Descripcion]) VALUES (5, N'ADMINISTRACION')
SET IDENTITY_INSERT [dbo].[Area] OFF
SET IDENTITY_INSERT [dbo].[Componente] ON 

INSERT [dbo].[Componente] ([CodigoC], [Descripcion]) VALUES (1, N'MONITOR')
INSERT [dbo].[Componente] ([CodigoC], [Descripcion]) VALUES (2, N'DISCO DURO')
SET IDENTITY_INSERT [dbo].[Componente] OFF
SET IDENTITY_INSERT [dbo].[DestalleSolicitud] ON 

INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (120, 134, 17)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (133, 143, 20)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (211, 189, 11)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (212, 189, 22)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (217, 194, 12)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (218, 194, 13)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (219, 194, 14)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (220, 194, 15)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (221, 194, 17)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (222, 194, 18)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (223, 194, 19)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (224, 194, 6)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (225, 194, 7)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (226, 194, 9)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (227, 194, 1)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (228, 194, 2)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (229, 195, 1)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (230, 195, 8)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (231, 195, 19)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (232, 195, 20)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (233, 195, 24)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (234, 196, 2)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (235, 197, 3)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (236, 198, 9)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (237, 199, 22)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (238, 200, 8)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (239, 201, 3)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (240, 202, 14)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (241, 203, 2)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (242, 204, 2)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (243, 204, 10)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (244, 205, 7)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (245, 206, 14)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (246, 207, 7)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (247, 208, 24)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (248, 208, 13)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (249, 209, 8)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (250, 210, 2)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (251, 211, 1)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (252, 212, 20)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (253, 212, 14)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (254, 213, 7)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (255, 214, 8)
INSERT [dbo].[DestalleSolicitud] ([CodigoDS], [CodigoS], [CodigoM]) VALUES (256, 217, 9)
SET IDENTITY_INSERT [dbo].[DestalleSolicitud] OFF
SET IDENTITY_INSERT [dbo].[EstadoSolicitud] ON 

INSERT [dbo].[EstadoSolicitud] ([CodigoES], [Descripcion]) VALUES (1, N'PENDIENTE')
INSERT [dbo].[EstadoSolicitud] ([CodigoES], [Descripcion]) VALUES (2, N'ATENDIDA')
INSERT [dbo].[EstadoSolicitud] ([CodigoES], [Descripcion]) VALUES (3, N'CANCELADA')
INSERT [dbo].[EstadoSolicitud] ([CodigoES], [Descripcion]) VALUES (4, N'EN PRROCESO')
SET IDENTITY_INSERT [dbo].[EstadoSolicitud] OFF
SET IDENTITY_INSERT [dbo].[Modalidad] ON 

INSERT [dbo].[Modalidad] ([CodigoM], [Descripcion], [CodigoS]) VALUES (1, N'PC', 1)
INSERT [dbo].[Modalidad] ([CodigoM], [Descripcion], [CodigoS]) VALUES (2, N'LAPTOP', 1)
INSERT [dbo].[Modalidad] ([CodigoM], [Descripcion], [CodigoS]) VALUES (3, N'IMPRESORA', 1)
INSERT [dbo].[Modalidad] ([CodigoM], [Descripcion], [CodigoS]) VALUES (4, N'CAMARA', 1)
INSERT [dbo].[Modalidad] ([CodigoM], [Descripcion], [CodigoS]) VALUES (5, N'RED', 1)
INSERT [dbo].[Modalidad] ([CodigoM], [Descripcion], [CodigoS]) VALUES (6, N'PC', 2)
INSERT [dbo].[Modalidad] ([CodigoM], [Descripcion], [CodigoS]) VALUES (7, N'LAPTOP', 2)
INSERT [dbo].[Modalidad] ([CodigoM], [Descripcion], [CodigoS]) VALUES (8, N'IMPRESORA', 2)
INSERT [dbo].[Modalidad] ([CodigoM], [Descripcion], [CodigoS]) VALUES (9, N'CAMARA', 2)
INSERT [dbo].[Modalidad] ([CodigoM], [Descripcion], [CodigoS]) VALUES (10, N'RED', 2)
INSERT [dbo].[Modalidad] ([CodigoM], [Descripcion], [CodigoS]) VALUES (11, N'PC', 3)
INSERT [dbo].[Modalidad] ([CodigoM], [Descripcion], [CodigoS]) VALUES (12, N'LAPTOP', 3)
INSERT [dbo].[Modalidad] ([CodigoM], [Descripcion], [CodigoS]) VALUES (13, N'IMPRESORA', 3)
INSERT [dbo].[Modalidad] ([CodigoM], [Descripcion], [CodigoS]) VALUES (14, N'CAMARA', 3)
INSERT [dbo].[Modalidad] ([CodigoM], [Descripcion], [CodigoS]) VALUES (15, N'RED', 3)
INSERT [dbo].[Modalidad] ([CodigoM], [Descripcion], [CodigoS]) VALUES (17, N'CABINA', 3)
INSERT [dbo].[Modalidad] ([CodigoM], [Descripcion], [CodigoS]) VALUES (18, N'SERVIDOR', 3)
INSERT [dbo].[Modalidad] ([CodigoM], [Descripcion], [CodigoS]) VALUES (19, N'INTERNET', 3)
INSERT [dbo].[Modalidad] ([CodigoM], [Descripcion], [CodigoS]) VALUES (20, N'SISTEMA OPERATIVO', 4)
INSERT [dbo].[Modalidad] ([CodigoM], [Descripcion], [CodigoS]) VALUES (22, N'PROGRAMAS', 4)
INSERT [dbo].[Modalidad] ([CodigoM], [Descripcion], [CodigoS]) VALUES (23, N'SISTEMA OPERATIVO', 5)
INSERT [dbo].[Modalidad] ([CodigoM], [Descripcion], [CodigoS]) VALUES (24, N'PROGRAMAS', 5)
SET IDENTITY_INSERT [dbo].[Modalidad] OFF
INSERT [dbo].[PersonaJuridica] ([CodgoPJ], [NroRUC], [RazonSocial], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PJ00000001', N'12345678901', N'SAR PERU ERL', N'HJHJHJJJHJHJ', N'123456', N'123456789', N'peru', N'tjx|', N'jane_19_07@hotmail.com', N'', N'')
INSERT [dbo].[PersonaJuridica] ([CodgoPJ], [NroRUC], [RazonSocial], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PJ00000002', N'10720262121', N'OSCAR MARTIN CAMASCA FERNANDEZ', N'SAN MARTIN 1020', N'252443', N'920531909', N'ocamasca', N'|yys|y„AC', N'camasca_martin@hotmail.com', N'oscar camasca', N'oscar camasca')
SET IDENTITY_INSERT [dbo].[Personal] ON 

INSERT [dbo].[Personal] ([CodigoP], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter], [Estado], [CodigoTP], [CodigoA]) VALUES (3, N'12345699', N'GUZMAN', N'LOPEZ', N'RICARDO ARTURO', N'DESCONOCIDA', N'', N'988305228', N'ricardo', N'yqlk}p|', N'josealvites@hotmail.com', N'', N'', 1, 1, 5)
INSERT [dbo].[Personal] ([CodigoP], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter], [Estado], [CodigoTP], [CodigoA]) VALUES (4, N'90785645', N'RODASU', N'GUZMAN', N'CARMEN DORIS', N'AV. MARISCAL CASTILLA NRO 708', N'', N'988305226', N'carmen', N'ml~zs}BADC', N'', N'', N'', 0, 2, 1)
INSERT [dbo].[Personal] ([CodigoP], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter], [Estado], [CodigoTP], [CodigoA]) VALUES (5, N'43986031', N'NERIA', N'CUEVA', N'ABRAHAM', N'.', N'.', N'950567068', N'SISTEMAS', N'468', N'', N'', N'', 1, 1, 5)
INSERT [dbo].[Personal] ([CodigoP], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter], [Estado], [CodigoTP], [CodigoA]) VALUES (6, N'12345678', N'BILLETON', N'RODRIGUEZ', N'ALFARDO', N'NEW YORK 685', N'254236', N'851203954', N'lburgos', N'vmu~ƒBDF', N'fenixrenace@hotmail.com', N'', N'', 1, 2, 2)
INSERT [dbo].[Personal] ([CodigoP], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter], [Estado], [CodigoTP], [CodigoA]) VALUES (7, N'46712355', N'RAMOS', N'VALENCIA', N'MARIO', N'CALLE LAS MARGARITAS 119 JLO', N'254674', N'979457654', N'rvalenciam', N'X89L:?', N'ramosvm11@gmail.com', N'ramosvm11@gmail.com', N'ramosvm11@gmail.com', 1, 2, 4)
INSERT [dbo].[Personal] ([CodigoP], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter], [Estado], [CodigoTP], [CodigoA]) VALUES (8, N'44487193', N'URPEQUE', N'GALLARDO', N'SHIRLEY', N'LOS ALAMOS', N'', N'980190640', N'Surpeque', N'79;=?A', N'Yulishe3@hotmail.com', N'', N'', 0, 2, 4)
INSERT [dbo].[Personal] ([CodigoP], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter], [Estado], [CodigoTP], [CodigoA]) VALUES (9, N'44274123', N'BENITES', N'YAMUNAQUE', N'JOSUE', N'MZ C LOTE 39 UR. SESQUICENTENARIO', N'123456', N'934477678', N'jbenites', N'79;=?A', N'jbenites@gmail.com', N'josuebenites', N'josuebenites', 1, 2, 4)
INSERT [dbo].[Personal] ([CodigoP], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter], [Estado], [CodigoTP], [CodigoA]) VALUES (10, N'71918576', N'SANTISTEBAN', N'TELLO', N'VICTOR', N'CALLE ARIZOLA 144', N'', N'912414783', N'victor', N'|pk}y}', N'santisteban1905@gmail.com', N'Víctor St', N'', 1, 2, 2)
SET IDENTITY_INSERT [dbo].[Personal] OFF
INSERT [dbo].[PersonaNatural] ([CodgoPN], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PN00000001', N'16777189', N'ALVITES', N'RODAS', N'JOSE SECUNDINO', N'AV MARISCAL ACSTILLA #708 REQUE', N'', N'988305228', N'jose', N'ntyl', N'', N'', N'')
INSERT [dbo].[PersonaNatural] ([CodgoPN], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PN00000002', N'43986031', N'NERIA', N'CUEVA', N'ABRAHAM', N'.', N'950567', N'950567068', N'sistemas', N'468', N'cuevas135@hotmail.com', N'.', N'.')
INSERT [dbo].[PersonaNatural] ([CodgoPN], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PN00000003', N'43861425', N'GUZMAN', N'LÓPEZ', N'RICARDO ARTURO', N'VICTOR FONSECA 208 URB. PRIMAVERA 2DA ETAPA', N'', N'946857945', N'glopezra', N'Z:;N<A8>', N'sp.headmaster@gmail.com', N'', N'')
INSERT [dbo].[PersonaNatural] ([CodgoPN], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PN00000004', N'46023071', N'GUZMAN', N'LOPEZ', N'FATIMA CAROLINA', N'JIRÓN PILCOMAYO 320 - HUANCHACO, TRUJILLO', N'', N'978718662', N'FatiGLop', N'pl€vA@CIJK', N'fatimaglop@gmail.com', N'fatimaglop@gmail.com', N'')
INSERT [dbo].[PersonaNatural] ([CodgoPN], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PN00000005', N'16624030', N'GUZMÁN', N'PAREDES', N'ANGEL ALFREDO', N'VÍCTOR FONSECA 208 URB PRIMAVERA II ETAPA', N'623426', N'979620465', N'Angel Guzmán', N'?><B4:', N'educarxmas@gmail.com', N'Angel Guzmán Asescon', N'')
INSERT [dbo].[PersonaNatural] ([CodgoPN], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PN00000006', N'73493459', N'LLONTOP', N'MENDOZA', N'ALEXIS', N'LOS GORRIONES 118 P.J 9 DE OCTUBRE', N'506878', N'996927947', N'alexis Mendoza', N'Iuoƒu€@?', N'alexisllontopmendoza@gmail.com', N'Alexis Llontop Mendoza', N'No')
INSERT [dbo].[PersonaNatural] ([CodgoPN], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PN00000007', N'77332034', N'CADENAS', N'TAPULLIMA', N'ANA MARIA', N'CALLE VICENTE DE LA VEGA 1700', N'498621', N'945319270', N'AnaCadenas', N'?@=>>=AC', N'amct_27_95@hotmail.com', N'', N'')
INSERT [dbo].[PersonaNatural] ([CodgoPN], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PN00000008', N'45156643', N'MENDOZA', N'YOVERA', N'JENIFFER', N'LOS GORRIONES', N'607989', N'946857945', N'myoverajm', N'X89L:?', N'JEmmy.2688@gmail.com', N'', N'')
INSERT [dbo].[PersonaNatural] ([CodgoPN], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PN00000009', N'16762828', N'MENDOZA', N'YOVERA', N'MILTON', N'LIMA', N'635245', N'978456889', N'myoverame', N'X89L:?', N'Rickyglop@gmail.com', N'', N'')
INSERT [dbo].[PersonaNatural] ([CodgoPN], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PN00000010', N'42016204', N'LÓPEZ', N'VILCHEZ', N'DIANA PATRICIA', N'LA GARITA PIMENTEL', N'', N'995841687', N'Dipalovi1582', N'~s…}v„€Œˆ‰Ž„†PWQV', N'dipalovi_15@hotmail.com', N'Diana López', N'')
INSERT [dbo].[PersonaNatural] ([CodgoPN], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PN00000011', N'76006827', N'LLONTOP', N'MENDOZA', N'JAMILET', N'LOS GORRIONES 118 - 9 DE OCTUBRE', N'601939', N'969477574', N'Jamilet Ll M', N'79;=?A', N'llontopmendozajamilet@gmail.com', N'', N'')
INSERT [dbo].[PersonaNatural] ([CodgoPN], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PN00000012', N'45156644', N'MENDOZA', N'YOVERA', N'JENIFFER', N'LOS GORRIONES 118 P. J. 9 DE OCTUBRE', N'506878', N'940224625', N'Jemmy', N'SOXYf@EAB', N'jemmy.2688@gmail.com', N'Jemmy MY', N'')
INSERT [dbo].[PersonaNatural] ([CodgoPN], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PN00000013', N'41438028', N'BARRERA', N'LÓPEZ', N'MÓNICA', N'PASAJE GRAU 190 - LA GARITA', N'', N'971805574', N'Monik', N'}|ysv€v‹{z', N'melb_sc@hotmail.com', N'', N'')
INSERT [dbo].[PersonaNatural] ([CodgoPN], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PN00000014', N'40272522', N'BARRERA', N'LOPEZ', N'MILAGROS', N'JR. LOS AMAUTAS 121 URB. ZARATE', N'', N'987539405', N'sbarreral', N'Mmy}sq‚‡|FL', N'milagro_barrera@hotmail.com', N'', N'')
INSERT [dbo].[PersonaNatural] ([CodgoPN], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PN00000015', N'16804372', N'RODOLFO', N'GARRIDO', N'LOZANO', N'LAS MAGNOLIAS 109 URB LOS PARQUES', N'678834', N'978234876', N'glozanor', N'79;=?A', N'glopzanor@gmaill.com', N'', N'')
INSERT [dbo].[PersonaNatural] ([CodgoPN], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PN00000016', N'76564600', N'MENDOZA', N'JULCAHUANCA', N'NICOLE ALEXANDR', N'PIURA Y COMBATIENTES', N'', N'914812421', N'Nicole', N'WKUbX', N'alemenjul14@gmail.com', N'Nicole Alexandra Mendoza Julcahuanca', N'')
INSERT [dbo].[PersonaNatural] ([CodgoPN], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PN00000017', N'76862069', N'TEZÉN', N'CABREJOS', N'ROSA VICTORIA D', N'COCOTEROS 250 PJ. SAN MIGUEL', N'', N'917802056', N'Rosa', N'8::?<<', N'Rouztc23@gmail.com', N'Rouz Tezén', N'')
INSERT [dbo].[PersonaNatural] ([CodgoPN], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PN00000018', N'16706788', N'MENDOZA', N'YOVERA', N'WILLIAM', N'MZ M LOTE 6 CIUDADELA', N'676688', N'978988464', N'myoverawa', N'X89L:?', N'myoverawa@gmail.com', N'', N'')
INSERT [dbo].[PersonaNatural] ([CodgoPN], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PN00000019', N'75462500', N'ALBURUQUEQUE', N'BAILA', N'MANUEL', N'EL CARMEN 141 U.V. SJB - FERREÑAFE', N'', N'988446866', N'Alburuqq03', N'Ik:><>GH', N'alburuqqmanuel@gmail.com', N'', N'')
INSERT [dbo].[PersonaNatural] ([CodgoPN], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PN00000020', N'46151214', N'LUNA', N'ESTRELLA', N'ELIZ', N'CALLE IQUITOS 123', N'', N'921920015', N'Elizabeth', N'6>8;C;', N'Jueli90@hotmail.com', N'', N'')
INSERT [dbo].[PersonaNatural] ([CodgoPN], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PN00000021', N'16777266', N'RAMOS', N'CISNEROS', N'SANTOS IDADIA', N'CALLE BOLÍVAR 682 URB EL PORVENIR', N'', N'958646988', N'IdadiaR', N'\nqpp|€p', N'', N'Idadia_s@hotmail.com', N'')
INSERT [dbo].[PersonaNatural] ([CodgoPN], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PN00000022', N'47080053', N'HORNA', N'HUERTAS', N'NATHALI YAHIRA', N'ALFONSO UGARTE 272', N'', N'975374727', N'Horna', N'Tm{.Yrƒˆƒ', N'nathyahira@gmail.com', N'NATHALI YAHIRA HORNA HUERTAS', N'')
INSERT [dbo].[PersonaNatural] ([CodgoPN], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PN00000023', N'33562811', N'RAFAEL', N'DELGADO', N'EMILIO', N'ROSE27_08@HOTMAIL.COM 9', N'', N'', N'Rafael', N'656<', N'', N'', N'')
INSERT [dbo].[PersonaNatural] ([CodgoPN], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PN00000024', N'42041577', N'TORRES', N'VARGAS', N'ESDRAS', N'VENEZUELA 435', N'', N'961282638', N'TVARGASEJ', N']€l~to‚u{', N'esdrastvj@gmail.com', N'', N'')
INSERT [dbo].[PersonaNatural] ([CodgoPN], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PN00000025', N'44960261', N'SAMPÉN', N'RODRÍGUEZ', N'MARILY', N'FUNDÓ LAS PAMPAS FRENTE AL CAMAL DE PIMENTEL', N'', N'956000384', N'Marily', N'Shzrv„', N'Marily16488@outlook.es', N'Marily788@hotmail.com', N'')
INSERT [dbo].[PersonaNatural] ([CodgoPN], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PN00000026', N'40833828', N'MENDOZA', N'YOVERA', N'EVELYN LISSETH', N'LOS GORRIONES 118, PJ 9 DE OCTUBRE', N'', N'975925929', N'myoverae', N'WPZQ]iQBDF', N'evelynarteyalma@gmail.com', N'', N'')
INSERT [dbo].[PersonaNatural] ([CodgoPN], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PN00000027', N'44436428', N'SÁNCHEZ', N'LARIOS', N'CARLOS ALBERTO', N'CARRETERA PIMENTEL KM 7', N'263671', N'968747503', N'Carlos', N'kwn‚qqƒv‚', N'carlsanchez24@gmail.com', N'Carlos Alberto Sanchez Larios', N'Elpatronus')
INSERT [dbo].[PersonaNatural] ([CodgoPN], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PN00000028', N'44263517', N'MORALES', N'ROJAS', N'ROSA', N'PIMENTEL', N'', N'945270870', N'Jovis', N'Ou}q|', N'jovis.rmr@gmail.com', N'', N'')
INSERT [dbo].[PersonaNatural] ([CodgoPN], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PN00000029', N'16509858', N'CAMACHO', N'BERNILLA', N'EMILIA YSABEL', N'CON. HAB. BATANGRANDE MZ B LT 03 FERREÑAFE', N'456145', N'949459449', N'Emilia Camacho', N'urmlrnz„', N'emiliacamber29@gmal.com', N'', N'')
INSERT [dbo].[PersonaNatural] ([CodgoPN], [NroDNI], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [Direccion], [TelefonoFijo], [TelefonoMovil], [Login], [Password], [Email], [Faceboock], [Twiter]) VALUES (N'PN00000030', N'12345678', N'CORDOVA', N'CORDO', N'JAMES', N'JOSE LEONARDO ORTIZ #695', N'', N'987654321', N'jacoc', N'kq;=?ACE', N'jamescor30@gmail.com', N'', N'')
SET IDENTITY_INSERT [dbo].[Servicios] ON 

INSERT [dbo].[Servicios] ([CodigoS], [Descripcion]) VALUES (1, N'REPARACION')
INSERT [dbo].[Servicios] ([CodigoS], [Descripcion]) VALUES (2, N'MANTENIMIENTO')
INSERT [dbo].[Servicios] ([CodigoS], [Descripcion]) VALUES (3, N'INSTALACION')
INSERT [dbo].[Servicios] ([CodigoS], [Descripcion]) VALUES (4, N'INSTALACION SOFTWARE')
INSERT [dbo].[Servicios] ([CodigoS], [Descripcion]) VALUES (5, N'ACTUALIZACION SOFTWARE')
SET IDENTITY_INSERT [dbo].[Servicios] OFF
SET IDENTITY_INSERT [dbo].[Solicitud] ON 

INSERT [dbo].[Solicitud] ([CodigoS], [Fecha], [CodigoES], [CodigoPersona]) VALUES (134, CAST(N'2020-11-04 06:49:47.210' AS DateTime), 3, N'PN00000001')
INSERT [dbo].[Solicitud] ([CodigoS], [Fecha], [CodigoES], [CodigoPersona]) VALUES (143, CAST(N'2020-11-04 08:47:09.613' AS DateTime), 3, N'PN00000001')
INSERT [dbo].[Solicitud] ([CodigoS], [Fecha], [CodigoES], [CodigoPersona]) VALUES (189, CAST(N'2020-11-04 18:49:30.510' AS DateTime), 1, N'PN00000001')
INSERT [dbo].[Solicitud] ([CodigoS], [Fecha], [CodigoES], [CodigoPersona]) VALUES (194, CAST(N'2020-11-10 13:49:37.650' AS DateTime), 1, N'PN00000001')
INSERT [dbo].[Solicitud] ([CodigoS], [Fecha], [CodigoES], [CodigoPersona]) VALUES (195, CAST(N'2020-11-10 19:04:25.367' AS DateTime), 1, N'PJ00000001')
INSERT [dbo].[Solicitud] ([CodigoS], [Fecha], [CodigoES], [CodigoPersona]) VALUES (196, CAST(N'2020-11-13 13:57:54.380' AS DateTime), 3, N'PN00000003')
INSERT [dbo].[Solicitud] ([CodigoS], [Fecha], [CodigoES], [CodigoPersona]) VALUES (197, CAST(N'2020-11-14 02:34:29.103' AS DateTime), 1, N'PN00000003')
INSERT [dbo].[Solicitud] ([CodigoS], [Fecha], [CodigoES], [CodigoPersona]) VALUES (198, CAST(N'2020-11-14 19:19:29.033' AS DateTime), 1, N'PN00000005')
INSERT [dbo].[Solicitud] ([CodigoS], [Fecha], [CodigoES], [CodigoPersona]) VALUES (199, CAST(N'2020-11-14 19:33:20.377' AS DateTime), 1, N'PN00000007')
INSERT [dbo].[Solicitud] ([CodigoS], [Fecha], [CodigoES], [CodigoPersona]) VALUES (200, CAST(N'2020-11-14 19:55:16.083' AS DateTime), 1, N'PN00000010')
INSERT [dbo].[Solicitud] ([CodigoS], [Fecha], [CodigoES], [CodigoPersona]) VALUES (201, CAST(N'2020-11-14 20:13:58.390' AS DateTime), 1, N'PN00000011')
INSERT [dbo].[Solicitud] ([CodigoS], [Fecha], [CodigoES], [CodigoPersona]) VALUES (202, CAST(N'2020-11-14 20:48:39.557' AS DateTime), 1, N'PN00000004')
INSERT [dbo].[Solicitud] ([CodigoS], [Fecha], [CodigoES], [CodigoPersona]) VALUES (203, CAST(N'2020-11-14 21:09:11.830' AS DateTime), 1, N'PN00000014')
INSERT [dbo].[Solicitud] ([CodigoS], [Fecha], [CodigoES], [CodigoPersona]) VALUES (204, CAST(N'2020-11-14 22:55:11.253' AS DateTime), 1, N'PN00000003')
INSERT [dbo].[Solicitud] ([CodigoS], [Fecha], [CodigoES], [CodigoPersona]) VALUES (205, CAST(N'2020-11-15 12:49:19.240' AS DateTime), 1, N'PN00000012')
INSERT [dbo].[Solicitud] ([CodigoS], [Fecha], [CodigoES], [CodigoPersona]) VALUES (206, CAST(N'2020-11-15 16:50:33.900' AS DateTime), 1, N'PN00000016')
INSERT [dbo].[Solicitud] ([CodigoS], [Fecha], [CodigoES], [CodigoPersona]) VALUES (207, CAST(N'2020-11-15 19:36:48.000' AS DateTime), 1, N'PN00000017')
INSERT [dbo].[Solicitud] ([CodigoS], [Fecha], [CodigoES], [CodigoPersona]) VALUES (208, CAST(N'2020-11-15 20:02:13.807' AS DateTime), 1, N'PN00000018')
INSERT [dbo].[Solicitud] ([CodigoS], [Fecha], [CodigoES], [CodigoPersona]) VALUES (209, CAST(N'2020-11-15 21:08:44.250' AS DateTime), 1, N'PN00000019')
INSERT [dbo].[Solicitud] ([CodigoS], [Fecha], [CodigoES], [CodigoPersona]) VALUES (210, CAST(N'2020-11-15 22:16:01.443' AS DateTime), 1, N'PN00000022')
INSERT [dbo].[Solicitud] ([CodigoS], [Fecha], [CodigoES], [CodigoPersona]) VALUES (211, CAST(N'2020-11-15 23:08:07.310' AS DateTime), 1, N'PJ00000002')
INSERT [dbo].[Solicitud] ([CodigoS], [Fecha], [CodigoES], [CodigoPersona]) VALUES (212, CAST(N'2020-11-16 02:06:57.640' AS DateTime), 1, N'PN00000026')
INSERT [dbo].[Solicitud] ([CodigoS], [Fecha], [CodigoES], [CodigoPersona]) VALUES (213, CAST(N'2020-11-16 02:38:22.377' AS DateTime), 1, N'PN00000027')
INSERT [dbo].[Solicitud] ([CodigoS], [Fecha], [CodigoES], [CodigoPersona]) VALUES (214, CAST(N'2020-11-16 02:42:40.583' AS DateTime), 1, N'PN00000003')
INSERT [dbo].[Solicitud] ([CodigoS], [Fecha], [CodigoES], [CodigoPersona]) VALUES (217, CAST(N'2020-11-22 00:17:09.947' AS DateTime), 1, N'PN00000003')
SET IDENTITY_INSERT [dbo].[Solicitud] OFF
SET IDENTITY_INSERT [dbo].[TipoEquipo] ON 

INSERT [dbo].[TipoEquipo] ([CodigoTE], [Descripcion]) VALUES (1, N'IMPRESORA')
INSERT [dbo].[TipoEquipo] ([CodigoTE], [Descripcion]) VALUES (2, N'LAPTOP')
INSERT [dbo].[TipoEquipo] ([CodigoTE], [Descripcion]) VALUES (3, N'PC')
SET IDENTITY_INSERT [dbo].[TipoEquipo] OFF
SET IDENTITY_INSERT [dbo].[TipoPersonal] ON 

INSERT [dbo].[TipoPersonal] ([CodigoTP], [Descripcion]) VALUES (1, N'ADMINISTRADOR')
INSERT [dbo].[TipoPersonal] ([CodigoTP], [Descripcion]) VALUES (2, N'TECNICO')
SET IDENTITY_INSERT [dbo].[TipoPersonal] OFF
ALTER TABLE [dbo].[Descripcion]  WITH CHECK ADD  CONSTRAINT [FK_Descripcion_Color] FOREIGN KEY([CodigoCo])
REFERENCES [dbo].[Color] ([CodigoCo])
GO
ALTER TABLE [dbo].[Descripcion] CHECK CONSTRAINT [FK_Descripcion_Color]
GO
ALTER TABLE [dbo].[Descripcion]  WITH CHECK ADD  CONSTRAINT [FK_Descripcion_Equipo] FOREIGN KEY([CodigoE])
REFERENCES [dbo].[Equipo] ([CodigoE])
GO
ALTER TABLE [dbo].[Descripcion] CHECK CONSTRAINT [FK_Descripcion_Equipo]
GO
ALTER TABLE [dbo].[Descripcion]  WITH CHECK ADD  CONSTRAINT [FK_Descripcion_Marca] FOREIGN KEY([CodigoM])
REFERENCES [dbo].[Marca] ([CodigoM])
GO
ALTER TABLE [dbo].[Descripcion] CHECK CONSTRAINT [FK_Descripcion_Marca]
GO
ALTER TABLE [dbo].[Descripcion]  WITH CHECK ADD  CONSTRAINT [FK_Descripcion_Modelo] FOREIGN KEY([CodigoMo])
REFERENCES [dbo].[Modelo] ([CodigoMo])
GO
ALTER TABLE [dbo].[Descripcion] CHECK CONSTRAINT [FK_Descripcion_Modelo]
GO
ALTER TABLE [dbo].[DestalleSolicitud]  WITH CHECK ADD  CONSTRAINT [FK_DestalleSolicitud_Modalidad] FOREIGN KEY([CodigoM])
REFERENCES [dbo].[Modalidad] ([CodigoM])
GO
ALTER TABLE [dbo].[DestalleSolicitud] CHECK CONSTRAINT [FK_DestalleSolicitud_Modalidad]
GO
ALTER TABLE [dbo].[DestalleSolicitud]  WITH CHECK ADD  CONSTRAINT [FK_DestalleSolicitud_Solicitud] FOREIGN KEY([CodigoS])
REFERENCES [dbo].[Solicitud] ([CodigoS])
GO
ALTER TABLE [dbo].[DestalleSolicitud] CHECK CONSTRAINT [FK_DestalleSolicitud_Solicitud]
GO
ALTER TABLE [dbo].[DetalleEquipo]  WITH CHECK ADD  CONSTRAINT [FK_DetalleEquipo_Color] FOREIGN KEY([CodigoCo])
REFERENCES [dbo].[Color] ([CodigoCo])
GO
ALTER TABLE [dbo].[DetalleEquipo] CHECK CONSTRAINT [FK_DetalleEquipo_Color]
GO
ALTER TABLE [dbo].[DetalleEquipo]  WITH CHECK ADD  CONSTRAINT [FK_DetalleEquipo_Componente] FOREIGN KEY([CodigoC])
REFERENCES [dbo].[Componente] ([CodigoC])
GO
ALTER TABLE [dbo].[DetalleEquipo] CHECK CONSTRAINT [FK_DetalleEquipo_Componente]
GO
ALTER TABLE [dbo].[DetalleEquipo]  WITH CHECK ADD  CONSTRAINT [FK_DetalleEquipo_Equipo] FOREIGN KEY([CodigoE])
REFERENCES [dbo].[Equipo] ([CodigoE])
GO
ALTER TABLE [dbo].[DetalleEquipo] CHECK CONSTRAINT [FK_DetalleEquipo_Equipo]
GO
ALTER TABLE [dbo].[DetalleEquipo]  WITH CHECK ADD  CONSTRAINT [FK_DetalleEquipo_Marca] FOREIGN KEY([CodigoM])
REFERENCES [dbo].[Marca] ([CodigoM])
GO
ALTER TABLE [dbo].[DetalleEquipo] CHECK CONSTRAINT [FK_DetalleEquipo_Marca]
GO
ALTER TABLE [dbo].[DetalleEquipo]  WITH CHECK ADD  CONSTRAINT [FK_DetalleEquipo_Modelo] FOREIGN KEY([CodigoMo])
REFERENCES [dbo].[Modelo] ([CodigoMo])
GO
ALTER TABLE [dbo].[DetalleEquipo] CHECK CONSTRAINT [FK_DetalleEquipo_Modelo]
GO
ALTER TABLE [dbo].[Equipo]  WITH CHECK ADD  CONSTRAINT [FK_Equipo_DestalleSolicitud] FOREIGN KEY([CodigoDS])
REFERENCES [dbo].[DestalleSolicitud] ([CodigoDS])
GO
ALTER TABLE [dbo].[Equipo] CHECK CONSTRAINT [FK_Equipo_DestalleSolicitud]
GO
ALTER TABLE [dbo].[Equipo]  WITH CHECK ADD  CONSTRAINT [FK_Equipo_Visita] FOREIGN KEY([CodigoV])
REFERENCES [dbo].[Visita] ([CodigoV])
GO
ALTER TABLE [dbo].[Equipo] CHECK CONSTRAINT [FK_Equipo_Visita]
GO
ALTER TABLE [dbo].[Modalidad]  WITH CHECK ADD  CONSTRAINT [FK_Modalidad_Servicios] FOREIGN KEY([CodigoS])
REFERENCES [dbo].[Servicios] ([CodigoS])
GO
ALTER TABLE [dbo].[Modalidad] CHECK CONSTRAINT [FK_Modalidad_Servicios]
GO
ALTER TABLE [dbo].[NivelTinta]  WITH CHECK ADD  CONSTRAINT [FK_NivelTinta_Equipo] FOREIGN KEY([CodigoE])
REFERENCES [dbo].[Equipo] ([CodigoE])
GO
ALTER TABLE [dbo].[NivelTinta] CHECK CONSTRAINT [FK_NivelTinta_Equipo]
GO
ALTER TABLE [dbo].[Personal]  WITH CHECK ADD  CONSTRAINT [FK_Personal_Area] FOREIGN KEY([CodigoA])
REFERENCES [dbo].[Area] ([CodigoA])
GO
ALTER TABLE [dbo].[Personal] CHECK CONSTRAINT [FK_Personal_Area]
GO
ALTER TABLE [dbo].[Personal]  WITH CHECK ADD  CONSTRAINT [FK_Personal_TipoPersonal1] FOREIGN KEY([CodigoTP])
REFERENCES [dbo].[TipoPersonal] ([CodigoTP])
GO
ALTER TABLE [dbo].[Personal] CHECK CONSTRAINT [FK_Personal_TipoPersonal1]
GO
ALTER TABLE [dbo].[Solicitud]  WITH CHECK ADD  CONSTRAINT [FK_Solicitud_EstadoSolicitud] FOREIGN KEY([CodigoES])
REFERENCES [dbo].[EstadoSolicitud] ([CodigoES])
GO
ALTER TABLE [dbo].[Solicitud] CHECK CONSTRAINT [FK_Solicitud_EstadoSolicitud]
GO
ALTER TABLE [dbo].[Solicitud]  WITH NOCHECK ADD  CONSTRAINT [FK_Solicitud_PersonaJuridica1] FOREIGN KEY([CodigoPersona])
REFERENCES [dbo].[PersonaJuridica] ([CodgoPJ])
GO
ALTER TABLE [dbo].[Solicitud] NOCHECK CONSTRAINT [FK_Solicitud_PersonaJuridica1]
GO
ALTER TABLE [dbo].[Solicitud]  WITH NOCHECK ADD  CONSTRAINT [FK_Solicitud_PersonaNatural1] FOREIGN KEY([CodigoPersona])
REFERENCES [dbo].[PersonaNatural] ([CodgoPN])
GO
ALTER TABLE [dbo].[Solicitud] NOCHECK CONSTRAINT [FK_Solicitud_PersonaNatural1]
GO
ALTER TABLE [dbo].[Tarea]  WITH CHECK ADD  CONSTRAINT [FK_Tarea_Equipo] FOREIGN KEY([CodigoE])
REFERENCES [dbo].[Equipo] ([CodigoE])
GO
ALTER TABLE [dbo].[Tarea] CHECK CONSTRAINT [FK_Tarea_Equipo]
GO
ALTER TABLE [dbo].[Tarea]  WITH CHECK ADD  CONSTRAINT [FK_Tarea_Personal] FOREIGN KEY([CodigoP])
REFERENCES [dbo].[Personal] ([CodigoP])
GO
ALTER TABLE [dbo].[Tarea] CHECK CONSTRAINT [FK_Tarea_Personal]
GO
ALTER TABLE [dbo].[Visita]  WITH CHECK ADD  CONSTRAINT [FK_Visita_Personal] FOREIGN KEY([CodigoP])
REFERENCES [dbo].[Personal] ([CodigoP])
GO
ALTER TABLE [dbo].[Visita] CHECK CONSTRAINT [FK_Visita_Personal]
GO
ALTER TABLE [dbo].[Visita]  WITH CHECK ADD  CONSTRAINT [FK_Visita_Solicitud] FOREIGN KEY([CodigoS])
REFERENCES [dbo].[Solicitud] ([CodigoS])
GO
ALTER TABLE [dbo].[Visita] CHECK CONSTRAINT [FK_Visita_Solicitud]
GO
/****** Object:  StoredProcedure [dbo].[_pa_Asignar_Solicitudes_Pendientes_Personal_Tecnico]    Script Date: 3/01/2021 17:45:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[_pa_Asignar_Solicitudes_Pendientes_Personal_Tecnico]

AS
BEGIN
--		  SELECT     dbo.PersonaNatural.Nombre + ' ' + dbo.PersonaNatural.ApellidoMaterno + ' ' + dbo.PersonaNatural.ApellidoPaterno AS CLIENTE, dbo.PersonaNatural.Direccion AS DIRECCION, 
--                      dbo.PersonaNatural.TelefonoFijo AS [TEL FIJO], dbo.PersonaNatural.TelefonoMovil AS [TEL MOVIL], dbo.Solicitud.CodigoS AS [NRO. SOLICITUD], dbo.Servicios.Descripcion AS SERVICIO, 
--                      dbo.Modalidad.Descripcion AS MODALIDAD
--FROM         dbo.PersonaNatural INNER JOIN
--                      dbo.Solicitud ON dbo.PersonaNatural.CodgoPN = dbo.Solicitud.CodigoPersona INNER JOIN
--                      dbo.EstadoSolicitud ON dbo.Solicitud.CodigoES = dbo.EstadoSolicitud.CodigoES INNER JOIN
--                      dbo.DestalleSolicitud ON dbo.Solicitud.CodigoS = dbo.DestalleSolicitud.CodigoS INNER JOIN
--                      dbo.Modalidad ON dbo.DestalleSolicitud.CodigoM = dbo.Modalidad.CodigoM INNER JOIN
--                      dbo.Servicios ON dbo.Modalidad.CodigoS = dbo.Servicios.CodigoS
--WHERE     (dbo.EstadoSolicitud.Descripcion = 'PENDIENTE')

SELECT     dbo.Solicitud.CodigoS AS [NRO. SOLICITUD], dbo.Solicitud.Fecha AS FECHA, 
                      dbo.PersonaNatural.Nombre + ' ' + dbo.PersonaNatural.ApellidoPaterno + ' ' + dbo.PersonaNatural.ApellidoMaterno  AS CLIENTE, dbo.PersonaNatural.Direccion AS DIRECCION, 
                      dbo.PersonaNatural.TelefonoFijo AS [TEL FIJO], dbo.PersonaNatural.TelefonoMovil AS [TEL MOVIL]
FROM         dbo.PersonaNatural INNER JOIN
                      dbo.Solicitud ON dbo.PersonaNatural.CodgoPN = dbo.Solicitud.CodigoPersona INNER JOIN
                      dbo.EstadoSolicitud ON dbo.Solicitud.CodigoES = dbo.EstadoSolicitud.CodigoES INNER JOIN
                      dbo.DestalleSolicitud ON dbo.Solicitud.CodigoS = dbo.DestalleSolicitud.CodigoS INNER JOIN
                      dbo.Modalidad ON dbo.DestalleSolicitud.CodigoM = dbo.Modalidad.CodigoM INNER JOIN
                      dbo.Servicios ON dbo.Modalidad.CodigoS = dbo.Servicios.CodigoS
WHERE     (dbo.EstadoSolicitud.Descripcion = 'PENDIENTE')
GROUP BY dbo.Solicitud.CodigoS, dbo.PersonaNatural.Nombre+ ' ' + dbo.PersonaNatural.ApellidoPaterno + ' ' + dbo.PersonaNatural.ApellidoMaterno , dbo.PersonaNatural.Direccion, 
                      dbo.PersonaNatural.TelefonoFijo, dbo.PersonaNatural.TelefonoMovil, dbo.Solicitud.Fecha
                      
                      union
                      SELECT     dbo.Solicitud.CodigoS AS [NRO. SOLICITUD], dbo.Solicitud.Fecha AS FECHA, dbo.PersonaJuridica.RazonSocial AS CLIENTE, dbo.PersonaJuridica.Direccion AS DIRECCION, 
                      dbo.PersonaJuridica.TelefonoFijo AS [TEL FIJO], dbo.PersonaJuridica.TelefonoMovil AS [TEL MOVIL]
FROM         dbo.Solicitud INNER JOIN
                      dbo.EstadoSolicitud ON dbo.Solicitud.CodigoES = dbo.EstadoSolicitud.CodigoES INNER JOIN
                      dbo.DestalleSolicitud ON dbo.Solicitud.CodigoS = dbo.DestalleSolicitud.CodigoS INNER JOIN
                      dbo.Modalidad ON dbo.DestalleSolicitud.CodigoM = dbo.Modalidad.CodigoM INNER JOIN
                      dbo.Servicios ON dbo.Modalidad.CodigoS = dbo.Servicios.CodigoS INNER JOIN
                      dbo.PersonaJuridica ON dbo.Solicitud.CodigoPersona = dbo.PersonaJuridica.CodgoPJ
WHERE     (dbo.EstadoSolicitud.Descripcion = 'PENDIENTE')
GROUP BY dbo.Solicitud.CodigoS, dbo.Solicitud.Fecha, dbo.PersonaJuridica.RazonSocial, dbo.PersonaJuridica.Direccion, dbo.PersonaJuridica.TelefonoFijo, dbo.PersonaJuridica.TelefonoMovil
End
GO
/****** Object:  StoredProcedure [dbo].[_pa_lista_Colaboradores]    Script Date: 3/01/2021 17:45:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[_pa_lista_Colaboradores]

AS
BEGIN
		  SELECT     dbo.Personal.CodigoP AS CODIGO, dbo.Area.Descripcion AS AREA, dbo.TipoPersonal.Descripcion AS [TIPO COLABORADOR], dbo.Personal.NroDNI AS DNI, 
                      dbo.Personal.ApellidoPaterno AS [APELLIDO PATERNO], dbo.Personal.ApellidoMaterno AS [APELLIDO MATERNO], dbo.Personal.Nombre AS NOMBRE, dbo.Personal.Direccion AS DIRECCION, 
                      dbo.Personal.TelefonoFijo AS TELEFONO, dbo.Personal.TelefonoMovil AS CELULAR, dbo.Personal.Login AS USUARIO, dbo.Personal.Password AS CONATRASEÑA, dbo.Personal.Email AS EMAIL, 
                      dbo.Personal.Faceboock AS FECEBOOCK, dbo.Personal.Twiter AS TWITER, CASE dbo.Personal.Estado when 1 then 'ACTIVO' ELSE 'INACTIVO' END  AS ESTADO
FROM         dbo.Personal INNER JOIN
                      dbo.Area ON dbo.Personal.CodigoA = dbo.Area.CodigoA INNER JOIN
                      dbo.TipoPersonal ON dbo.Personal.CodigoTP = dbo.TipoPersonal.CodigoTP
End

GO
/****** Object:  StoredProcedure [dbo].[_pa_mantenimiento_Detalle_Solicitud_Servicio]    Script Date: 3/01/2021 17:45:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[_pa_mantenimiento_Detalle_Solicitud_Servicio]
@CodigoDS						int=null,
@CodigoS						int=null,
@CodigoM						int=null,

@Opcion char(1),

@pRpta				int output,
@pMensaje			varchar(100) output
as
  
if (@Opcion='N')
    Begin
		   insert into dbo.DestalleSolicitud values
                                 ( @CodigoS,
                                   @CodigoM
								  )
			if (@@RowCount=1) 
			   Begin			    
				set @pRpta=1
				set @pMensaje='Solicitud se guardo satisfactorimente.'
			   End
			else
			   Begin
				set @pRpta=0   
				set @pMensaje='Solicitud no se guardo.'
			   End
	 End
else if (@Opcion='E')
      Begin
		   DECLARE  @Total int
		   SELECT @Total =   COUNT(*) FROM dbo.DestalleSolicitud WHERE CodigoS=@CodigoS
		   if(@Total>1)
		      begin
		         delete from dbo.DestalleSolicitud where CodigoDS=@CodigoDS
		         	if (@@RowCount=1) 
					   Begin
						set @pRpta=1
						set @pMensaje='Detalle se elimino satisfactorimente.'
					   End
					else
					   Begin
						set @pRpta=0   
						set @pMensaje='Detalle no se puede eliminar.'
					   End
		      end
		   else
		      begin
		           delete from dbo.DestalleSolicitud where CodigoDS=@CodigoDS
		           delete from dbo.Solicitud where CodigoS=@CodigoS
		           if (@@RowCount=1) 
					   Begin
						set @pRpta=1
						set @pMensaje='Solicitud se elimino satisfactorimente.'
					   End
					else
					   Begin
						set @pRpta=0   
						set @pMensaje='Solicitud no se puede eliminar.'
					   End
		      end
			 
		  
		--   BEGIN TRY

		--   delete from dbo.DestalleSolicitud where CodigoDS=@CodigoDS
		--	if (@@RowCount=1) 
		--	   Begin
		--		set @pRpta=1
		--		set @pMensaje='Detalle solicitud se elimino satisfactorimente.'
		--	   End
		--	else
		--	   Begin
		--		set @pRpta=0   
		--		set @pMensaje='Detalle solicitud no se puede eliminar.'
		--	   End
			   
		--  END TRY
		--  BEGIN CATCH
		--	    set @pRpta=0   
		--		set @pMensaje='Detalle solicitud no se puede eliminar porque esta siendo utilizado.'
		--END CATCH;

	   
     End

GO
/****** Object:  StoredProcedure [dbo].[_pa_mantenimiento_Persona_Juridica]    Script Date: 3/01/2021 17:45:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[_pa_mantenimiento_Persona_Juridica]
@CodgoPJ						varchar(10)=null,
@NroRUC						    varchar(11)=null,
@RazonSocial					varchar(MAX)=null,
@Direccion						varchar(MAX)=null,
@TelefonoFijo					varchar(6)=null,
@TelefonoMovil					varchar(9)=null,
@Login							varchar(MAX)=null,
@Password						varchar(MAX)=null,
@Email							varchar(MAX)=null,
@Faceboock						varchar(MAX)=null,
@Twiter							varchar(MAX)=null,

@Opcion char(1),

@pRpta				int output,
@pMensaje			varchar(100) output
as
  
if (@Opcion='N')
    Begin
		   if  EXISTS( select * from dbo.PersonaJuridica where NroRUC=@NroRUC)
			   Begin
				   set @pRpta=0
				   set @pMensaje='Nro. RUC ya existe.'
				   return 0
			   End
		   
		   insert into dbo.PersonaJuridica values
                                 ( [dbo].[_generar_codigo_persona_juridica] (),
                                   @NroRUC,
                                   @RazonSocial,
                                   @Direccion,
                                   @TelefonoFijo,
                                   @TelefonoMovil,
                                   @Login,
                                   @Password,
                                   @Email,
                                   @Faceboock,
                                   @Twiter  
								  )
			if (@@RowCount=1) 
			   Begin
			    
				set @pRpta=1
				set @pMensaje='Sus datos se guardaron satisfactorimente.'
			   End
			else
			   Begin
				set @pRpta=0   
				set @pMensaje='Sus datos no se guardaron.'
			   End
	 End
else if (@Opcion='M')
    Begin
           if  EXISTS( select * from dbo.PersonaJuridica where NroRUC=@NroRUC and CodgoPJ <> @CodgoPJ)
			   Begin
				   set @pRpta=0
				   set @pMensaje='Nro. RUC ya existe.'
				   return 0
			   End
			   
		   update dbo.PersonaJuridica
		          set    NroRUC          = @NroRUC,
		                 RazonSocial     = @RazonSocial,
		                 Direccion		 = @Direccion,
		                 TelefonoFijo	 = @TelefonoFijo,
		                 TelefonoMovil	 = @TelefonoMovil,
		                 Login			 = @Login,
		                 Password		 = @Password,
		                 Email			 = @Email,	
		                 Faceboock	     = @Faceboock,
		                 Twiter	         = @Twiter										   
            where CodgoPJ=@CodgoPJ
			if (@@RowCount=1) 
			   Begin
			    set @pRpta=1
				set @pMensaje='Sus datos se modificaron satisfactorimente.'
			   End
			else
			   Begin
				set @pRpta=0   
				set @pMensaje='Sus datos no se modificaron.'
			   End
	 End
	 
	  --====================================================================
	 -- CAMBIO DE CONTRASEÑA
	 else if (@Opcion='C')
    Begin
      --     if  EXISTS( select * from dbo.PersonaJuridica where NroRUC=@NroRUC and CodgoPJ <> @CodgoPJ)
			   --Begin
				  -- set @pRpta=0
				  -- set @pMensaje='Nro. RUC ya existe.'
				  -- return 0
			   --End
			   
		   update dbo.PersonaJuridica
		          set    --NroRUC          = @NroRUC,
		                 --RazonSocial     = @RazonSocial,
		                 --Direccion		 = @Direccion,
		                 --TelefonoFijo	 = @TelefonoFijo,
		                 --TelefonoMovil	 = @TelefonoMovil,
		                 --Login			 = @Login,
		                 Password		 = @Password
		                 --Email			 = @Email,	
		                 --Faceboock	     = @Faceboock,
		                 --Twiter	         = @Twiter										   
            where CodgoPJ=@CodgoPJ
			if (@@RowCount=1) 
			   Begin
			    set @pRpta=1
				set @pMensaje='Sus datos se modificaron satisfactorimente.'
			   End
			else
			   Begin
				set @pRpta=0   
				set @pMensaje='Sus datos no se modificaron.'
			   End
	 End
	 

	 --====================================================================

	 else if (@Opcion='E')
      Begin
		  
		   BEGIN TRY

		   delete from dbo.PersonaJuridica where CodgoPJ=@CodgoPJ
			if (@@RowCount=1) 
			   Begin
				set @pRpta=1
				set @pMensaje='Sus datos se eliminaron satisfactorimente.'
			   End
			else
			   Begin
				set @pRpta=0   
				set @pMensaje='Sus datos no se pueden eliminar.'
			   End
			   
		  END TRY
		  BEGIN CATCH
			    set @pRpta=0   
				set @pMensaje='Sus datos no se puede eliminar porque esta siendo utilizado.'
		END CATCH;

	   
     End

GO
/****** Object:  StoredProcedure [dbo].[_pa_mantenimiento_Persona_Natural]    Script Date: 3/01/2021 17:45:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[_pa_mantenimiento_Persona_Natural]
@CodgoPN						varchar(10)=null,
@NroDNI							varchar(8)=null,
@ApellidoPaterno				varchar(15)=null,
@ApellidoMaterno				varchar(15)=null,
@Nombre							varchar(15)=null,
@Direccion						varchar(MAX)=null,
@TelefonoFijo					varchar(6)=null,
@TelefonoMovil					varchar(9)=null,
@Login							varchar(MAX)=null,--
@Password						varchar(MAX)=null,--10
@Email							varchar(MAX)=null,
@Faceboock						varchar(MAX)=null,
@Twiter							varchar(MAX)=null,

@Opcion char(1),

@pRpta				int output,
@pMensaje			varchar(100) output
as
  
if (@Opcion='N')
    Begin
		   if  EXISTS( select * from dbo.PersonaNatural where NroDNI=@NroDNI)
			   Begin
				   set @pRpta=0
				   set @pMensaje='Nro. DNI ya existe.'
				   return 0
			   End
		   
		   insert into dbo.PersonaNatural values
                                 ( [dbo].[_generar_codigo_persona_natural](),
                                   @NroDNI,
                                   @ApellidoPaterno,
                                   @ApellidoMaterno,
                                   @Nombre,
                                   @Direccion,
                                   @TelefonoFijo,
                                   @TelefonoMovil,
                                   @Login,
                                   @Password,
                                   @Email,
                                   @Faceboock,
                                   @Twiter  
								  )
			if (@@RowCount=1) 
			   Begin
			    
				set @pRpta=1
				set @pMensaje='Sus datos se guardaron satisfactorimente.'
			   End
			else
			   Begin
				set @pRpta=0   
				set @pMensaje='Sus datos no se guardaron.'
			   End
	 End
else if (@Opcion='M')
    Begin
           if  EXISTS( select * from dbo.PersonaNatural where NroDNI=@NroDNI and CodgoPN <> @CodgoPN)
			   Begin
				   set @pRpta=0
				   set @pMensaje='Nro. DNI ya existe.'
				   return 0
			   End
			   
		   update dbo.PersonaNatural
		          set    NroDNI          = @NroDNI,
		                 ApellidoPaterno = @ApellidoPaterno,
		                 ApellidoMaterno = @ApellidoMaterno,
		                 Nombre			 = @Nombre,	
		                 Direccion		 = @Direccion,
		                 TelefonoFijo	 = @TelefonoFijo,
		                 TelefonoMovil	 = @TelefonoMovil,
		                 Login			 = @Login,
		                 Password		 = @Password,
		                 Email			 = @Email,	
		                 Faceboock	     = @Faceboock,
		                 Twiter	         = @Twiter										   
            where CodgoPN=@CodgoPN
			if (@@RowCount=1) 
			   Begin
			    set @pRpta=1
				set @pMensaje='Sus datos se modificaron satisfactorimente.'
			   End
			else
			   Begin
				set @pRpta=0   
				set @pMensaje='Sus datos no se modificaron.'
			   End
	 End
	 --====================================================================
	 -- CAMBIO DE CONTRASEÑA
	 else if (@Opcion='C')
    Begin
      --     if  EXISTS( select * from dbo.PersonaNatural where NroDNI=@NroDNI and CodgoPN <> @CodgoPN)
			   --Begin
				  -- set @pRpta=0
				  -- set @pMensaje='Nro. DNI ya existe.'
				  -- return 0
			   --End
			   
		   update dbo.PersonaNatural
		          set    
						 --NroDNI          = @NroDNI,
		     --            ApellidoPaterno = @ApellidoPaterno,
		     --            ApellidoMaterno = @ApellidoMaterno,
		     --            Nombre			 = @Nombre,	
		     --            Direccion		 = @Direccion,
		     --            TelefonoFijo	 = @TelefonoFijo,
		     --            TelefonoMovil	 = @TelefonoMovil,
		                 --Login			 = @Login,
		                 Password		 = @Password
		                 --Email			 = @Email,	
		                 --Faceboock	     = @Faceboock,
		                 --Twiter	         = @Twiter										   
            where CodgoPN=@CodgoPN
			if (@@RowCount=1) 
			   Begin
			    set @pRpta=1
				set @pMensaje='Sus datos se modificaron satisfactorimente.'
			   End
			else
			   Begin
				set @pRpta=0   
				set @pMensaje='Sus datos no se modificaron.'
			   End
	 End
	 --====================================================================

	 else if (@Opcion='E')
      Begin
		  
		   BEGIN TRY

		   delete from dbo.PersonaNatural where CodgoPN=@CodgoPN
			if (@@RowCount=1) 
			   Begin
				set @pRpta=1
				set @pMensaje='Sus datos se eliminaron satisfactorimente.'
			   End
			else
			   Begin
				set @pRpta=0   
				set @pMensaje='Sus datos no se pueden eliminar.'
			   End
			   
		  END TRY
		  BEGIN CATCH
			    set @pRpta=0   
				set @pMensaje='Sus datos no se puede eliminar porque esta siendo utilizado.'
		END CATCH;

	   
     End

GO
/****** Object:  StoredProcedure [dbo].[_pa_mantenimiento_Personal]    Script Date: 3/01/2021 17:45:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[_pa_mantenimiento_Personal]
@CodigoP						int=null,--1
@NroDNI							varchar(8)=null,--2
@ApellidoPaterno				varchar(15)=null,--3
@ApellidoMaterno				varchar(15)=null,--4
@Nombre							varchar(15)=null,--5
@Direccion						varchar(MAX)=null,--6
@TelefonoFijo					varchar(6)=null,--7
@TelefonoMovil					varchar(9)=null,--8
@Login							varchar(MAX)=null,--9
@Password						varchar(MAX)=null,--10
@Email							varchar(MAX)=null,--11
@Faceboock						varchar(MAX)=null,--12
@Twiter							varchar(MAX)=null,--13
@Estado							bit=null,--14
@CodigoTP						int=null,--15
@CodigoA						int=null,--16

@Opcion							char(1),
@pRpta							int output,
@pMensaje						varchar(100) output
as
  
if (@Opcion='N')
    Begin
		   if  EXISTS( select * from dbo.Personal where NroDNI=@NroDNI)
			   Begin
				   set @pRpta=0
				   set @pMensaje='Nro. DNI ya existe.'
				   return 0
			   End
		   
		   insert into dbo.Personal values
                                 ( @NroDNI,
                                   @ApellidoPaterno,
                                   @ApellidoMaterno,
                                   @Nombre,
                                   @Direccion,
                                   @TelefonoFijo,
                                   @TelefonoMovil,
                                   @Login,
                                   @Password,
                                   @Email,
                                   @Faceboock,
                                   @Twiter,
                                   @Estado,
                                   @CodigoTP,
                                   @CodigoA  
								  )
			if (@@RowCount=1) 
			   Begin
			    
				set @pRpta=1
				set @pMensaje='Datos del colaborador se guardaron satisfactorimente.'
			   End
			else
			   Begin
				set @pRpta=0   
				set @pMensaje='Datos del colaborador no se guardaron.'
			   End
	 End
else if (@Opcion='M')
    Begin
           if  EXISTS( select * from dbo.Personal where NroDNI=@NroDNI and CodigoP <> @CodigoP)
			   Begin
				   set @pRpta=0
				   set @pMensaje='Nro. DNI ya existe.'
				   return 0
			   End
			   
		   update dbo.Personal
		          set    NroDNI          = @NroDNI,
		                 ApellidoPaterno = @ApellidoPaterno,
		                 ApellidoMaterno = @ApellidoMaterno,
		                 Nombre			 = @Nombre,	
		                 Direccion		 = @Direccion,
		                 TelefonoFijo	 = @TelefonoFijo,
		                 TelefonoMovil	 = @TelefonoMovil,
		                 Login			 = @Login,
		                 Password		 = @Password,
		                 Email			 = @Email,	
		                 Faceboock	     = @Faceboock,
		                 Twiter	         = @Twiter,
		                 Estado          = @Estado,
		                 CodigoTP        = @CodigoTP,
		                 CodigoA         = @CodigoA										   
            where CodigoP=@CodigoP
			if (@@RowCount=1) 
			   Begin
			    set @pRpta=1
				set @pMensaje='Datos del colaborador se modificaron satisfactorimente.'
			   End
			else
			   Begin
				set @pRpta=0   
				set @pMensaje='Datos del colaborador no se modificaron.'
			   End
	 End

	  --====================================================================
	 -- CAMBIO DE CONTRASEÑA
	 else if (@Opcion='C')
    Begin
      --     if  EXISTS( select * from dbo.Personal where NroDNI=@NroDNI and CodigoP <> @CodigoP)
			   --Begin
				  -- set @pRpta=0
				  -- set @pMensaje='Nro. DNI ya existe.'
				  -- return 0
			   --End
			   
		   update dbo.Personal
		          set    --NroDNI          = @NroDNI,
		                 --ApellidoPaterno = @ApellidoPaterno,
		                 --ApellidoMaterno = @ApellidoMaterno,
		                 --Nombre			 = @Nombre,	
		                 --Direccion		 = @Direccion,
		                 --TelefonoFijo	 = @TelefonoFijo,
		                 --TelefonoMovil	 = @TelefonoMovil,
		                 --Login			 = @Login,
		                 Password		 = @Password--,
		                 --Email			 = @Email,	
		                 --Faceboock	     = @Faceboock,
		                 --Twiter	         = @Twiter,
		                 --Estado          = @Estado,
		                 --CodigoTP        = @CodigoTP,
		                 --CodigoA         = @CodigoA										   
            where CodigoP=@CodigoP
			if (@@RowCount=1) 
			   Begin
			    set @pRpta=1
				set @pMensaje='Datos del colaborador se modificaron satisfactorimente.'
			   End
			else
			   Begin
				set @pRpta=0   
				set @pMensaje='Datos del colaborador no se modificaron.'
			   End
	 End
	 --====================================================================

	 else if (@Opcion='E')
      Begin
		  
		   BEGIN TRY

		   delete from dbo.Personal where CodigoP=@CodigoP
			if (@@RowCount=1) 
			   Begin
				set @pRpta=1
				set @pMensaje='Datos del colaborador se eliminaron satisfactorimente.'
			   End
			else
			   Begin
				set @pRpta=0   
				set @pMensaje='Datos del colaborador no se pueden eliminar.'
			   End
			   
		  END TRY
		  BEGIN CATCH
			    set @pRpta=0   
				set @pMensaje='Sus datos no se puede eliminar porque esta siendo utilizado.'
		END CATCH;

	   
     End

GO
/****** Object:  StoredProcedure [dbo].[_pa_mantenimiento_Solicitud_Servicio]    Script Date: 3/01/2021 17:45:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[_pa_mantenimiento_Solicitud_Servicio]
@CodigoS						int=null,
@CodigoES						int=null,
@CodigoPersona					varchar(10)=null,

@Opcion char(1),

@pRpta				int output,
@pMensaje			varchar(100) output
as
  
if (@Opcion='N')
    Begin
		   DECLARE  @CodigoEstadoSolicitud int
		   SELECT @CodigoEstadoSolicitud =   CodigoES FROM dbo.EstadoSolicitud WHERE (Descripcion = 'PENDIENTE')
		   
		   insert into dbo.Solicitud values
                                 ( GETDATE(),
                                   @CodigoEstadoSolicitud,
                                   @CodigoPersona
								  )
			if (@@RowCount=1) 
			   Begin			    
				set @pRpta=@@IDENTITY
				set @pMensaje='Solicitud se guardo satisfactorimente.'
			   End
			else
			   Begin
				set @pRpta=0   
				set @pMensaje='Solicitud no se guardo.'
			   End
	 End
else if (@Opcion='M')
    Begin
           if(@CodigoES = 0) /*Cuando el cliente cancela una o mas solicitudes*/
              Begin
 		          DECLARE  @CANCELADA int
 		          SELECT @CANCELADA = CodigoES FROM dbo.EstadoSolicitud WHERE (Descripcion = 'CANCELADA')
 		          
 		          DECLARE  @PENDIENTE int
 		          SELECT @PENDIENTE = CodigoES FROM dbo.EstadoSolicitud WHERE (Descripcion = 'PENDIENTE')
 		          
                  update dbo.Solicitud  set    CodigoES          = @CANCELADA										   
                  where CodigoS=@CodigoS AND CodigoES = @PENDIENTE 
                  if (@@RowCount=1) 
					   Begin
							set @pRpta=1
							set @pMensaje='Solicitud se cancelo satisfactorimente.'
					   End
				 else
					   Begin
							set @pRpta=0   
							set @pMensaje='Solicitud no se cancelo.'
					   End
              End
	 End
	 
	 else if (@Opcion='E')
      Begin
		  
		  delete from dbo.DestalleSolicitud where CodigoS=@CodigoS
		  delete from dbo.Solicitud where CodigoS=@CodigoS
		  
		--   /*Pendiente, falta mas.....*/
		--   BEGIN TRY

		--   delete from dbo.Solicitud where CodigoS=@CodigoS
			if (@@RowCount=1) 
			   Begin
				set @pRpta=1
				set @pMensaje='Solicitud se elimino satisfactorimente.'
			   End
			else
			   Begin
				set @pRpta=0   
				set @pMensaje='Solicitud no se puede eliminar.'
			   End
			   
		--  END TRY
		--  BEGIN CATCH
		--	    set @pRpta=0   
		--		set @pMensaje='Solicitud no se puede eliminar porque esta siendo utilizado.'
		--END CATCH;

	   
     End

GO
/****** Object:  StoredProcedure [dbo].[_pa_mantenimiento_Visita]    Script Date: 3/01/2021 17:45:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[_pa_mantenimiento_Visita]
@CodigoV						int=null,
@CodigoS						int=null,
@CodigoP						int=null,

@Opcion char(1),

@pRpta				int output,
@pMensaje			varchar(100) output
as
  
if (@Opcion='N')
    Begin
		   DECLARE  @ENPROCESO int
		   SELECT @ENPROCESO =   CodigoES FROM dbo.EstadoSolicitud WHERE (Descripcion = 'EN PRROCESO')
		   --print @@ENPROCESO
		   
		   DECLARE  @PENDIENTE int
 		   SELECT @PENDIENTE = CodigoES FROM dbo.EstadoSolicitud WHERE (Descripcion = 'PENDIENTE')
 		   --print @PENDIENTE
 		          
           update dbo.Solicitud  set    CodigoES          = @ENPROCESO										   
           where CodigoS=@CodigoS AND CodigoES = @PENDIENTE  
		   	   
		   
		   insert into dbo.Visita values
                                 ( @CodigoS,
                                   @CodigoP,
                                   GETDATE()                                  
								  )
			if (@@RowCount=1) 
			   Begin			    
				set @pRpta=1
				set @pMensaje='Visita se guardo satisfactorimente.'
			   End
			else
			   Begin
				set @pRpta=0   
				set @pMensaje='Visita no se guardo.'
			   End
	 End
else if (@Opcion='E')
      Begin
		  BEGIN TRY
		         SELECT @ENPROCESO =   CodigoES FROM dbo.EstadoSolicitud WHERE (Descripcion = 'EN PRROCESO')
		         SELECT @PENDIENTE = CodigoES FROM dbo.EstadoSolicitud WHERE (Descripcion = 'PENDIENTE')
		         
		         update dbo.Solicitud  set    CodigoES          = @PENDIENTE										   
                 where CodigoS=@CodigoS AND CodigoES = @ENPROCESO  
		         
				 delete from dbo.Visita where CodigoV=@CodigoV  
				if (@@RowCount=1) 
				   Begin
					set @pRpta=1
					set @pMensaje='Visita se elimino satisfactorimente.'
				   End
				else
				   Begin
					set @pRpta=0   
					set @pMensaje='Visita no se puede eliminar.'
				   End			   
			  END TRY
			  BEGIN CATCH
					set @pRpta=0   
					set @pMensaje='Visita no se puede eliminar porque esta siendo utilizado.'
			END CATCH;   
		  End

GO
/****** Object:  StoredProcedure [dbo].[_pa_obtener_areas]    Script Date: 3/01/2021 17:45:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[_pa_obtener_areas]
AS
BEGIN
		  select '-1' as Codigo, '-----Seleccione area-----' AS Nombre
		  union
		  SELECT     CodigoA AS Codigo, Descripcion AS Nombre
          FROM         dbo.Area
End

GO
/****** Object:  StoredProcedure [dbo].[_pa_obtener_colaboradores]    Script Date: 3/01/2021 17:45:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[_pa_obtener_colaboradores]
AS
BEGIN
		  select '-1' as Codigo, '-----Seleccione tipo colaborador-----' AS Nombre
		  union
		  SELECT     CodigoTP AS Codigo, Descripcion AS Nombre
          FROM         dbo.TipoPersonal
End

GO
/****** Object:  StoredProcedure [dbo].[_pa_obtener_Detalle_Solicitudes_Pendientes_Servicios_Solicitados]    Script Date: 3/01/2021 17:45:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[_pa_obtener_Detalle_Solicitudes_Pendientes_Servicios_Solicitados]
@CodgoSolicitud						int=null
AS
BEGIN
	SELECT     dbo.DestalleSolicitud.CodigoDS AS CODIGO_DETALLE_SOLICITUD, dbo.DestalleSolicitud.CodigoS AS CODIGO_SOLICITUD, dbo.Servicios.Descripcion AS SERVIVIO, 
                      dbo.Modalidad.Descripcion AS MODALIDAD
FROM         dbo.Solicitud INNER JOIN
                      dbo.DestalleSolicitud ON dbo.Solicitud.CodigoS = dbo.DestalleSolicitud.CodigoS INNER JOIN
                      dbo.Modalidad ON dbo.DestalleSolicitud.CodigoM = dbo.Modalidad.CodigoM INNER JOIN
                      dbo.Servicios ON dbo.Modalidad.CodigoS = dbo.Servicios.CodigoS
WHERE     (dbo.DestalleSolicitud.CodigoS = @CodgoSolicitud)
End

GO
/****** Object:  StoredProcedure [dbo].[_pa_obtener_Detalle_Solicitudes_Pendientes_Servicios_Solicitados_2]    Script Date: 3/01/2021 17:45:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[_pa_obtener_Detalle_Solicitudes_Pendientes_Servicios_Solicitados_2]
@CodgoSolicitud						int=null
AS
BEGIN
	SELECT     dbo.DestalleSolicitud.CodigoDS AS CODIGO_DETALLE_SOLICITUD, dbo.DestalleSolicitud.CodigoS AS CODIGO_SOLICITUD, dbo.Servicios.Descripcion AS SERVIVIO, 
                      dbo.Modalidad.Descripcion AS MODALIDAD
FROM         dbo.Solicitud INNER JOIN
                      dbo.DestalleSolicitud ON dbo.Solicitud.CodigoS = dbo.DestalleSolicitud.CodigoS INNER JOIN
                      dbo.Modalidad ON dbo.DestalleSolicitud.CodigoM = dbo.Modalidad.CodigoM INNER JOIN
                      dbo.Servicios ON dbo.Modalidad.CodigoS = dbo.Servicios.CodigoS
WHERE     (dbo.DestalleSolicitud.CodigoS = @CodgoSolicitud)
End

GO
/****** Object:  StoredProcedure [dbo].[_pa_obtener_modalidades]    Script Date: 3/01/2021 17:45:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[_pa_obtener_modalidades]
@CodigoS						int=null
AS
BEGIN
		  select '-1' as Codigo, '-----Seleccione modalidad-----' AS Nombre
		  union
		  SELECT     CodigoM as Codigo, Descripcion  AS Nombre
		  FROM         dbo.Modalidad
		  WHERE     (CodigoS = @CodigoS)
End

GO
/****** Object:  StoredProcedure [dbo].[_pa_obtener_servcios]    Script Date: 3/01/2021 17:45:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[_pa_obtener_servcios]
AS
BEGIN
		  select '-1' as Codigo, '-----Seleccione servicio-----' AS Nombre
		  union
		  SELECT     CodigoS AS Codigo, Descripcion AS Nombre
          FROM         dbo.Servicios
End

GO
/****** Object:  StoredProcedure [dbo].[_pa_obtener_Solicitudes_Pendientes_Servicios_Solicitados]    Script Date: 3/01/2021 17:45:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[_pa_obtener_Solicitudes_Pendientes_Servicios_Solicitados]
@CodgoPersona						varchar(10)=null
AS
BEGIN
	 SELECT dbo.Solicitud.CodigoS AS Codigo,
	 dbo.Solicitud.Fecha,
	 dbo.EstadoSolicitud.Descripcion AS Estado
     FROM dbo.Solicitud INNER JOIN dbo.EstadoSolicitud ON dbo.Solicitud.CodigoES = dbo.EstadoSolicitud.CodigoES
     WHERE (dbo.EstadoSolicitud.Descripcion = 'PENDIENTE') AND (dbo.Solicitud.CodigoPersona = @CodgoPersona)
End

GO
/****** Object:  StoredProcedure [dbo].[_pa_obtener_tecnico]    Script Date: 3/01/2021 17:45:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[_pa_obtener_tecnico]
AS
BEGIN
		  select '-1' as Codigo, '-----Seleccione tecnico-----' AS Nombre
		  union
		  SELECT     dbo.Personal.CodigoP AS Codigo, dbo.Personal.Nombre + ' ' + dbo.Personal.ApellidoPaterno + ' ' + dbo.Personal.ApellidoMaterno AS Nombre
FROM         dbo.TipoPersonal INNER JOIN
                      dbo.Personal ON dbo.TipoPersonal.CodigoTP = dbo.Personal.CodigoTP
WHERE     (dbo.TipoPersonal.Descripcion = 'TECNICO')
End

GO
/****** Object:  StoredProcedure [dbo].[_pa_validar_acceso_sistema_administracion]    Script Date: 3/01/2021 17:45:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[_pa_validar_acceso_sistema_administracion]
@Login							varchar(MAX)=null,
@Password						varchar(MAX)=null
AS
BEGIN  
			 if EXISTS(SELECT     CodigoP AS CODIGO, Nombre + ' ' + ApellidoPaterno + ' ' + ApellidoMaterno AS PERSONA
				 FROM         dbo.Personal
				 WHERE     (Login = @Login) AND (Password = @Password))
			     begin
			          SELECT     CodigoP AS CODIGO, Nombre + ' ' + ApellidoPaterno + ' ' + ApellidoMaterno AS COLABORADOR, 'CO' as TIPOPERSONA
					  FROM         dbo.Personal
					  WHERE     (Login = @Login) AND (Password = @Password)		      
			     end  
			   else
			       begin
			           select '' AS CODIGO, 'Usuario o contraseña no existen.' AS PERSONA	  
			       end   
	  
End

GO
/****** Object:  StoredProcedure [dbo].[_pa_validar_acceso_sistema_clientes]    Script Date: 3/01/2021 17:45:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[_pa_validar_acceso_sistema_clientes]
@Login							varchar(MAX)=null,
@Password						varchar(MAX)=null
AS
BEGIN  
			  if EXISTS(SELECT  CodgoPN AS CODIGO, Nombre  + ' ' + ApellidoPaterno+ ' ' + ApellidoMaterno AS CLIENTE,  Login AS USARIO, Password AS CONTRASEÑA
			     FROM    dbo.PersonaNatural
			     WHERE   (Login = @Login) AND (Password = @Password))
			     begin
			          SELECT  CodgoPN AS CODIGO, Nombre  + ' ' + ApellidoPaterno+ ' ' + ApellidoMaterno AS PERSONA, 'PN' as TIPOPERSONA 
			          FROM    dbo.PersonaNatural
			          WHERE   (Login = @Login) AND (Password = @Password)				      
			     end
			  else if EXISTS(SELECT     CodgoPJ AS CODIGO, RazonSocial AS CLIENTE, Login AS USARIO, Password AS CONTRASEÑA
				 FROM         dbo.PersonaJuridica
				 WHERE     (Login = @Login) AND (Password = @Password))
			     begin
			          SELECT     CodgoPJ AS CODIGO, RazonSocial AS PERSONA, 'PJ' as TIPOPERSONA  FROM         dbo.PersonaJuridica
				      WHERE     (Login = @Login) AND (Password = @Password)				      
			     end 
			   else if EXISTS(SELECT     CodigoP AS CODIGO, Nombre + ' ' + ApellidoPaterno + ' ' + ApellidoMaterno AS PERSONA
				 FROM         dbo.Personal
				 WHERE     (Login = @Login) AND (Password = @Password))
			     begin
			          SELECT     CodigoP AS CODIGO, Nombre + ' ' + ApellidoPaterno + ' ' + ApellidoMaterno AS COLABORADOR, 'CO' as TIPOPERSONA
					  FROM         dbo.Personal
					  WHERE     (Login = @Login) AND (Password = @Password)		      
			     end  
			   else
			       begin
			           select '' AS CODIGO, 'Usuario o contraseña no existen.' AS PERSONA	  
			       end   
	  
End
GO
/****** Object:  StoredProcedure [dbo].[_pa_verificar_Existencia_Solicitud_Servicio_Fecha_Actual]    Script Date: 3/01/2021 17:45:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[_pa_verificar_Existencia_Solicitud_Servicio_Fecha_Actual]
@_CODIGOPERSONA						varchar(10)=null,
@_CODIGOMODALIDAD					int=null,

@pRpta								int output,
@pMensaje							varchar(100) output
as
  
	if EXISTS(SELECT S.CodigoPersona AS CODIGO_PERSONA,
	                  S.Fecha AS FECHA_SERVICIO,
	                  dbo.DestalleSolicitud.CodigoM AS CODIGO_MODALIDAD
                     FROM dbo.Solicitud AS S INNER JOIN dbo.DestalleSolicitud ON S.CodigoS = dbo.DestalleSolicitud.CodigoS 
                                             INNER JOIN dbo.EstadoSolicitud ON S.CodigoES = dbo.EstadoSolicitud.CodigoES
               WHERE (S.CodigoPersona = @_CODIGOPERSONA) AND (dbo.DestalleSolicitud.CodigoM = @_CODIGOMODALIDAD) AND (dbo.EstadoSolicitud.Descripcion = 'PENDIENTE')
    )
		begin
			set @pRpta=1
			set @pMensaje=''
		end 
	else
		begin
			set @pRpta=0
			set @pMensaje=''
		end

GO
/****** Object:  StoredProcedure [dbo].[_pa_Visitas_Asignadas_Personal_Tecnico]    Script Date: 3/01/2021 17:45:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[_pa_Visitas_Asignadas_Personal_Tecnico]

AS
BEGIN
		  SELECT     dbo.Visita.CodigoV AS [CODIGO VISITA],
		              dbo.Visita.FechaAsignacion AS [FEC ASIGNACION], 
                      dbo.Personal.Nombre + ' ' + dbo.Personal.ApellidoMaterno + ' ' + dbo.Personal.ApellidoPaterno  AS TECNICO,
                      dbo.Visita.CodigoS AS [NRO SOLICITUD],
                      dbo.Solicitud.Fecha AS [FEC SOLICITUD], 
                      dbo.PersonaJuridica.RazonSocial AS CLIENTE,
                      dbo.PersonaJuridica.Direccion AS DIRECCION,
                      dbo.PersonaJuridica.TelefonoFijo AS [TEL FIJO],
                      dbo.PersonaJuridica.TelefonoMovil AS [TEL MOVIL], 
                      dbo.Visita.CodigoP AS [COD TECNICO]
		  FROM         dbo.Visita INNER JOIN
                      dbo.Personal ON dbo.Visita.CodigoP = dbo.Personal.CodigoP INNER JOIN
                      dbo.Solicitud ON dbo.Visita.CodigoS = dbo.Solicitud.CodigoS INNER JOIN
                      dbo.PersonaJuridica ON dbo.Solicitud.CodigoPersona = dbo.PersonaJuridica.CodgoPJ
                      UNION
          SELECT      dbo.Visita.CodigoV AS [CODIGO VISITA],
                      dbo.Visita.FechaAsignacion AS [FEC ASIGNACION], 
                      dbo.Personal.Nombre + ' ' + dbo.Personal.ApellidoPaterno + ' ' + dbo.Personal.ApellidoMaterno AS TECNICO,
                      dbo.Visita.CodigoS AS [NRO SOLICITUD],
                      dbo.Solicitud.Fecha AS [FEC SOLICITUD], 
                      dbo.PersonaNatural.Nombre + ' ' + dbo.PersonaNatural.ApellidoPaterno + ' ' + dbo.PersonaNatural.ApellidoMaterno AS CLIENTE,
                      dbo.PersonaNatural.Direccion AS DIRECCION,
                      dbo.PersonaNatural.TelefonoFijo AS [TEL FIJO],
                      dbo.PersonaNatural.TelefonoMovil AS [TEL MOVIL], 
                      dbo.Visita.CodigoP AS [COD TECNICO]
		  FROM        dbo.Visita INNER JOIN
                      dbo.Personal ON dbo.Visita.CodigoP = dbo.Personal.CodigoP INNER JOIN
                      dbo.Solicitud ON dbo.Visita.CodigoS = dbo.Solicitud.CodigoS INNER JOIN
                      dbo.PersonaNatural ON dbo.Solicitud.CodigoPersona = dbo.PersonaNatural.CodgoPN
					  end
GO
/****** Object:  StoredProcedure [dbo].[obtenerfechasistema]    Script Date: 3/01/2021 17:45:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[obtenerfechasistema]
as
set language spanish;
DECLARE @D AS datetimeoffset
SET @D = CONVERT(datetimeoffset, getdate()) AT TIME ZONE 'SA Pacific Standard Time'
select CONVERT(datetime, @D) AS Fecha;

-- select  getdate()  as Fecha

	-- exec [obtenerfechasistema]
GO
/****** Object:  StoredProcedure [dbo].[pa_ListarRecuperar_Clientes]    Script Date: 3/01/2021 17:45:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[pa_ListarRecuperar_Clientes]
@opcion varchar(1) = null,
@nroDcto varchar(10)=null,
@correo varchar(100)=null	
AS
BEGIN
	
	IF (@opcion='1')
    -- Insert statements for procedure here
	SELECT CodgoPN AS ID, [Nombre] +' '+[ApellidoPaterno]+' '+[ApellidoMaterno] as CLIENTE
      ,[Login]  AS USUARIO,[Password] AS PASS,[Email] AS CORREO
  FROM [dbo].[PersonaNatural]
  WHERE [NroDNI] = @nroDcto
END

IF (@opcion='2')
    -- Insert statements for procedure here
	SELECT [CodgoPJ] AS ID, [RazonSocial] as CLIENTE
      ,[Login]  AS USUARIO,[Password] AS PASS,[Email] AS CORREO
  FROM [dbo].[PersonaJuridica]
  WHERE [NroRUC] = @nroDcto

GO
/****** Object:  StoredProcedure [dbo].[pa_ListarRecuperar_Colaboradores]    Script Date: 3/01/2021 17:45:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [dbo].[pa_ListarRecuperar_Colaboradores]
@opcion varchar(1) = null,
@nroDcto varchar(10)=null,
@correo varchar(100)=null	
AS
BEGIN
IF (@opcion='1')
	SELECT     dbo.Personal.CodigoP AS ID, 
	dbo.Personal.Nombre + ' '+dbo.Personal.ApellidoPaterno +' '+ dbo.Personal.ApellidoMaterno AS NOMBRE, 
	[NroDNI],
	dbo.Personal.Login AS USUARIO, dbo.Personal.Password AS CONTRASEÑA, dbo.Personal.Email AS CORREO, 
	CASE dbo.Personal.Estado when 1 then 'ACTIVO' ELSE 'INACTIVO' END  AS ESTADO
	FROM         dbo.Personal 
	INNER JOIN dbo.Area ON dbo.Personal.CodigoA = dbo.Area.CodigoA 
	INNER JOIN dbo.TipoPersonal ON dbo.Personal.CodigoTP = dbo.TipoPersonal.CodigoTP
	WHERE [NroDNI] = @nroDcto
End

-- EXEC [pa_ListarRecuperar_Colaboradores] '1', '43986031',''

GO
USE [master]
GO
ALTER DATABASE [SoporteTecnico] SET  READ_WRITE 
GO
