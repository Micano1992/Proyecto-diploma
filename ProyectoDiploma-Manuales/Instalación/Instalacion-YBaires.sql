USE [master]
GO
/****** Object:  Database [ProyectoAnalista]    Script Date: 25/11/2019 0:39:00 ******/
CREATE DATABASE [ProyectoAnalista]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProyectoAnalista', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ProyectoAnalista.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ProyectoAnalista_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ProyectoAnalista_log.ldf' , SIZE = 2816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ProyectoAnalista] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProyectoAnalista].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProyectoAnalista] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProyectoAnalista] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProyectoAnalista] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProyectoAnalista] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProyectoAnalista] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProyectoAnalista] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProyectoAnalista] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProyectoAnalista] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProyectoAnalista] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProyectoAnalista] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProyectoAnalista] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProyectoAnalista] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProyectoAnalista] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProyectoAnalista] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProyectoAnalista] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProyectoAnalista] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProyectoAnalista] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProyectoAnalista] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProyectoAnalista] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProyectoAnalista] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProyectoAnalista] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProyectoAnalista] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProyectoAnalista] SET RECOVERY FULL 
GO
ALTER DATABASE [ProyectoAnalista] SET  MULTI_USER 
GO
ALTER DATABASE [ProyectoAnalista] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProyectoAnalista] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProyectoAnalista] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProyectoAnalista] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ProyectoAnalista] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ProyectoAnalista]
GO
/****** Object:  User [usr_tp]    Script Date: 25/11/2019 0:39:00 ******/
CREATE USER [usr_tp] FOR LOGIN [usr_tp] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [usr_tp]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 25/11/2019 0:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora](
	[Id_log] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion_log] [nvarchar](100) NULL,
	[Cod_usuario] [nvarchar](50) NULL,
	[Fecha] [datetime] NULL,
	[Criticidad] [nvarchar](50) NULL,
	[Funcionalidad] [nvarchar](30) NULL,
	[DVH] [int] NULL,
 CONSTRAINT [PK_Bitácora] PRIMARY KEY CLUSTERED 
(
	[Id_log] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Conductor]    Script Date: 25/11/2019 0:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conductor](
	[id_conductor] [int] IDENTITY(1,1) NOT NULL,
	[apellido] [nvarchar](20) NULL,
	[nombre] [nvarchar](20) NULL,
	[habilitado] [bit] NULL,
	[patente] [nvarchar](12) NULL,
	[NroDocumento] [nvarchar](10) NULL,
 CONSTRAINT [PK_Conductor] PRIMARY KEY CLUSTERED 
(
	[id_conductor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Documento]    Script Date: 25/11/2019 0:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documento](
	[nroDocumento] [int] NOT NULL,
	[nroPedido] [int] NULL,
	[cantidad] [int] NULL,
	[DVH] [int] NULL,
	[producto] [nvarchar](10) NULL,
	[tanque] [int] NULL,
	[tipoDocumento] [nchar](2) NOT NULL,
	[documentoAnulador] [int] NULL,
 CONSTRAINT [PK_Documento] PRIMARY KEY CLUSTERED 
(
	[nroDocumento] ASC,
	[tipoDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DVV]    Script Date: 25/11/2019 0:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DVV](
	[entidad] [nvarchar](50) NOT NULL,
	[valor_dv] [int] NULL,
 CONSTRAINT [PK_DVV] PRIMARY KEY CLUSTERED 
(
	[entidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Familia]    Script Date: 25/11/2019 0:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Familia](
	[Id_familia] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion_familia] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Familia] PRIMARY KEY CLUSTERED 
(
	[Id_familia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FamiliaPatente]    Script Date: 25/11/2019 0:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FamiliaPatente](
	[Id_familia] [int] NOT NULL,
	[Id_patente] [int] NOT NULL,
	[DVH] [int] NULL,
 CONSTRAINT [PK_FamiliaPatente] PRIMARY KEY CLUSTERED 
(
	[Id_familia] ASC,
	[Id_patente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FamiliaUsuario]    Script Date: 25/11/2019 0:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FamiliaUsuario](
	[Id_familia] [int] NOT NULL,
	[Cod_usuario] [nchar](6) NOT NULL,
 CONSTRAINT [PK_FamiliaUsuario] PRIMARY KEY CLUSTERED 
(
	[Id_familia] ASC,
	[Cod_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Idioma]    Script Date: 25/11/2019 0:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Idioma](
	[Id_idioma] [int] NOT NULL,
	[Descripcion_idioma] [nvarchar](40) NULL,
 CONSTRAINT [PK_Idioma] PRIMARY KEY CLUSTERED 
(
	[Id_idioma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IdiomaMensaje]    Script Date: 25/11/2019 0:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdiomaMensaje](
	[id_idioma] [int] NULL,
	[id_idioma_mi] [int] NULL,
	[mensaje] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IdiomaMI]    Script Date: 25/11/2019 0:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdiomaMI](
	[id_idioma_mi] [int] NULL,
	[descripcion] [nchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Patente]    Script Date: 25/11/2019 0:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Patente](
	[Id_patente] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion_patente] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Patente] PRIMARY KEY CLUSTERED 
(
	[Id_patente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 25/11/2019 0:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[nroPedido] [int] NOT NULL,
	[anulado] [bit] NULL,
	[cantidad] [int] NULL,
	[idConductor] [int] NULL,
	[codProducto] [nvarchar](10) NULL,
	[entregado] [bit] NULL,
	[domicilio] [nvarchar](50) NULL,
	[codTerminal] [int] NULL,
	[documentoAnulador] [int] NULL,
 CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED 
(
	[nroPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producto]    Script Date: 25/11/2019 0:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[Cod_Producto] [nvarchar](10) NOT NULL,
	[Descripcion_producto] [nvarchar](20) NULL,
	[Temperatura_natural] [nvarchar](5) NULL,
	[Magnitud_medida] [nvarchar](2) NULL,
	[Activo] [int] NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[Cod_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rel_producto_terminal]    Script Date: 25/11/2019 0:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rel_producto_terminal](
	[codProducto] [int] NULL,
	[codTerminal] [int] NULL,
	[habilitado] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tanque]    Script Date: 25/11/2019 0:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tanque](
	[codProducto] [nvarchar](10) NULL,
	[DVH] [int] NULL,
	[activo] [bit] NULL,
	[cantidadMaxima] [int] NULL,
	[codTanque] [nvarchar](10) NOT NULL,
	[codTerminal] [int] NOT NULL,
	[stock] [int] NULL,
	[descripcion] [nvarchar](30) NULL,
	[id_tanque] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Tanque_1] PRIMARY KEY CLUSTERED 
(
	[id_tanque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Terminal]    Script Date: 25/11/2019 0:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Terminal](
	[codTerminal] [int] NOT NULL,
	[descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_Terminal] PRIMARY KEY CLUSTERED 
(
	[codTerminal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 25/11/2019 0:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Cod_usuario] [nchar](6) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Apellido] [nvarchar](20) NOT NULL,
	[Contraseña] [nchar](32) NULL,
	[Nro_documento] [nvarchar](20) NULL,
	[Tipo_documento] [nvarchar](4) NULL,
	[Cantidad_ingresos_incorrectos] [int] NOT NULL,
	[Bloqueado] [bit] NULL,
	[Idioma] [int] NULL,
	[DVH] [int] NULL,
	[Email] [nvarchar](40) NULL,
	[Terminal] [int] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Cod_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsuarioPatente]    Script Date: 25/11/2019 0:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsuarioPatente](
	[Id_patente] [int] NOT NULL,
	[cod_usuario] [varchar](6) NOT NULL,
	[DVH] [int] NULL,
	[Negado] [int] NULL,
 CONSTRAINT [PK_UsuarioPatente] PRIMARY KEY CLUSTERED 
(
	[Id_patente] ASC,
	[cod_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Bitacora] ON 

INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (120, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-03 23:00:22.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (121, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-03 23:04:50.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (122, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-03 23:05:10.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (123, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-03 23:15:55.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (124, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-03 23:16:46.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (125, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-03 23:23:21.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (126, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-03 23:23:45.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (127, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-03 23:27:01.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (128, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-03 23:28:11.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (129, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-03 23:29:31.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (130, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-03 23:30:26.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (131, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-03 23:32:01.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (132, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-03 23:46:39.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (133, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-03 23:47:51.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (134, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-03 23:50:24.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (135, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-03 23:50:57.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (136, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-03 23:51:46.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (137, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-03 23:53:07.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (138, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-03 23:53:45.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (139, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-03 23:54:43.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (140, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-03 23:56:34.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (141, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-03 23:59:07.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (142, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 00:03:20.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (143, N'Asignación de familia rgrthrthty al usuario A10021', N'A10001', CAST(N'2019-11-04 00:03:34.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 143430)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (144, N'Asignación de familia pruebdasd al usuario A10021', N'A10001', CAST(N'2019-11-04 00:03:36.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 136227)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (145, N'Bloqueo al usuario A10021', N'A10001', CAST(N'2019-11-04 00:03:44.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 42473)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (146, N'Desbloqueo al usuario A10021', N'A10001', CAST(N'2019-11-04 00:03:45.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 51286)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (147, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 00:06:34.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (148, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 00:25:04.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (149, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 00:26:19.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (150, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 00:28:38.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (151, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 00:29:40.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (152, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 00:32:42.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (153, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 00:35:21.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (154, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 12:40:19.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (155, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 12:41:20.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (156, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 12:43:19.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (157, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 12:44:27.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (158, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 13:11:52.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (159, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 13:15:16.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (160, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 13:17:15.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (161, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 13:21:50.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (162, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 13:52:03.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (163, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 13:53:55.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (164, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 13:56:15.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (165, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 13:57:44.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (166, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 13:58:33.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (167, N'Modificación usuario A10008', N'A10001', CAST(N'2019-11-04 14:01:00.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 50380)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (168, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 14:07:45.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (169, N'Modificación usuario A10008', N'A10001', CAST(N'2019-11-04 14:07:57.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 50380)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (170, N'Generación familia P Bi', N'A10001', CAST(N'2019-11-04 14:16:45.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 41525)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (171, N'Desbloqueo al usuario A10021', N'A10001', CAST(N'2019-11-04 14:17:18.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 51286)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (172, N'Bloqueo al usuario A10021', N'A10001', CAST(N'2019-11-04 14:17:22.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 42473)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (173, N'Desbloqueo al usuario A10021', N'A10001', CAST(N'2019-11-04 14:17:23.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 51286)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (174, N'Bloqueo al usuario A10021', N'A10001', CAST(N'2019-11-04 14:17:24.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 42473)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (175, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 14:20:45.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (176, N'Desbloqueo al usuario A10021', N'A10001', CAST(N'2019-11-04 14:20:50.000' AS DateTime), N'MEDIA', N'iW64F91246JSDQsp1CztXQ==', 54432)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (177, N'Bloqueo al usuario A10021', N'A10001', CAST(N'2019-11-04 14:20:51.000' AS DateTime), N'MEDIA', N'iW64F91246JSDQsp1CztXQ==', 45373)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (178, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 14:22:57.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (179, N'Desasignación de familia rgrthrthty al usuario A10021', N'A10001', CAST(N'2019-11-04 14:23:08.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 159944)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (180, N'Asignación de familia P Bi al usuario A10021', N'A10001', CAST(N'2019-11-04 14:23:11.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 107728)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (181, N'Contraseña errónea', N'A10001', CAST(N'2019-11-04 14:23:37.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (182, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 14:23:42.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (183, N'Modificación de contraseña', N'A10001', CAST(N'2019-11-04 14:24:06.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 57973)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (184, N'Se blanqueo la contraseña del usuario A10019', N'A10001', CAST(N'2019-11-04 14:28:42.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 115337)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (185, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 14:30:32.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (186, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 14:31:50.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (187, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 14:32:46.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (188, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 14:33:58.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (189, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 14:37:34.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (190, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 14:41:50.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (191, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 14:53:33.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (192, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 15:01:04.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (193, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 15:04:04.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (194, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 15:13:36.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (195, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 15:16:13.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (196, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 15:17:05.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (197, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 15:18:08.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (198, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 15:19:15.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (199, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 15:24:12.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (200, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 15:26:23.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (201, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 15:28:06.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (202, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 15:28:42.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (203, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 15:40:28.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (204, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 15:42:08.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (205, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 15:43:18.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (206, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 15:44:07.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (207, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 15:45:07.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (208, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 15:46:22.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (209, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 15:47:59.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (210, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 15:56:20.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (211, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 16:31:40.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (212, N'Se asignó la patente Consultar usuario al usuario A10015', N'A10001', CAST(N'2019-11-04 16:31:48.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 175874)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (213, N'Se asignó la patente Crear usuario al usuario A10015', N'A10001', CAST(N'2019-11-04 16:31:48.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 151706)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (214, N'Se asignó la patente Modificar usuario al usuario A10015', N'A10001', CAST(N'2019-11-04 16:31:48.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 174657)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (215, N'Asignación de familia Administrador de sistema al usuario A10015', N'A10001', CAST(N'2019-11-04 16:31:55.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 222442)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (216, N'Se asignó la patente Asignar conductor al usuario A10015', N'A10001', CAST(N'2019-11-04 16:32:09.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 177313)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (217, N'Se desasignó la patente Asignar conductor al usuario A10015', N'A10001', CAST(N'2019-11-04 16:32:12.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 195480)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (218, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 16:38:39.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
GO
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (219, N'Desbloqueo al usuario A10017', N'A10001', CAST(N'2019-11-04 16:38:46.000' AS DateTime), N'MEDIA', N'iW64F91246JSDQsp1CztXQ==', 54573)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (220, N'Bloqueo al usuario A10017', N'A10001', CAST(N'2019-11-04 16:38:49.000' AS DateTime), N'MEDIA', N'iW64F91246JSDQsp1CztXQ==', 45499)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (221, N'Asignación de familia Operador de terminal al usuario A10017', N'A10001', CAST(N'2019-11-04 16:38:53.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 196178)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (222, N'Deasignación de la patente Consultar usuario al usuario A10017', N'A10001', CAST(N'2019-11-04 16:38:57.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 211909)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (223, N'Negación de patente Cambiar contraseña al usuario A10017', N'A10001', CAST(N'2019-11-04 16:39:02.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 178893)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (224, N'Desnegación de la patente Cambiar contraseña al usuario A10017', N'A10001', CAST(N'2019-11-04 16:39:03.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 215230)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (225, N'Asignación de la patente Consultar usuario al usuario A10017', N'A10001', CAST(N'2019-11-04 16:39:05.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 199203)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (226, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 16:40:36.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (227, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 16:41:30.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (228, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 16:42:36.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (229, N'Usuario inválido', N'1', CAST(N'2019-11-04 16:47:20.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 23333)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (230, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 16:47:28.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (231, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 16:47:56.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (232, N'Usuario bloqueado', N'A10002', CAST(N'2019-11-04 16:48:24.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 31110)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (233, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 16:48:30.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (234, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 16:52:01.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (235, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 16:52:49.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (236, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 16:53:39.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (237, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 16:54:32.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (238, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 16:55:09.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (239, N'Contraseña errónea', N'A10001', CAST(N'2019-11-04 17:18:36.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (240, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 17:18:40.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (241, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 17:21:53.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (242, N'Actualización de datos de conexión con Base de datos', N'-', CAST(N'2019-11-04 17:25:01.000' AS DateTime), N'ALTA', N'Elt/gKD5iA8=', 151097)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (243, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 17:25:05.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (244, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 18:13:58.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (245, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 18:16:58.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (246, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 18:24:28.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (247, N'', N'-', CAST(N'2019-11-04 18:24:29.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 1064)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (248, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 18:25:25.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (249, N'Usuario - A10002
Usuario - A10005
Usuario - A10007
Usuario
', N'-', CAST(N'2019-11-04 18:25:26.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 147367)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (250, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 18:26:34.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (251, N'', N'-', CAST(N'2019-11-04 18:26:35.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 1064)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (252, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 18:27:17.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (253, N'Usuario - A10004
Usuario
', N'-', CAST(N'2019-11-04 18:27:34.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 33701)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (254, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 18:29:16.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (255, N'Error en verificación', N'-', CAST(N'2019-11-04 18:29:17.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 34026)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (256, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 18:30:26.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (257, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 19:09:46.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (258, N'Generación usuario A10022', N'A10001', CAST(N'2019-11-04 19:11:15.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 44233)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (259, N'Asignación de familia Jefe de terminal al usuario A10022', N'A10001', CAST(N'2019-11-04 19:11:15.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 170831)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (260, N'Asignación de familia Prueba al usuario A10022', N'A10001', CAST(N'2019-11-04 19:11:16.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 120201)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (261, N'Modificación usuario A10022', N'A10001', CAST(N'2019-11-04 19:11:43.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 50270)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (262, N'Asignación de la patente Consultar usuario al usuario A10022', N'A10001', CAST(N'2019-11-04 19:12:03.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 198962)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (263, N'Asignación de la patente Crear usuario al usuario A10022', N'A10001', CAST(N'2019-11-04 19:12:04.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 172954)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (264, N'Desasignación de familia Jefe de terminal al usuario A10022', N'A10001', CAST(N'2019-11-04 19:12:27.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 188491)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (265, N'Desasignación de familia Prueba al usuario A10022', N'A10001', CAST(N'2019-11-04 19:12:27.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 135173)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (266, N'Asignación de la patente Bloquear usuario al usuario A10022', N'A10001', CAST(N'2019-11-04 19:17:01.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 191913)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (267, N'Bloqueo al usuario A10019', N'A10001', CAST(N'2019-11-04 19:17:59.000' AS DateTime), N'MEDIA', N'iW64F91246JSDQsp1CztXQ==', 45549)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (268, N'Desbloqueo al usuario A10019', N'A10001', CAST(N'2019-11-04 19:18:00.000' AS DateTime), N'MEDIA', N'iW64F91246JSDQsp1CztXQ==', 54629)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (269, N'Asignación de familia Administrador de sistema al usuario A10019', N'A10001', CAST(N'2019-11-04 19:18:10.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 222698)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (270, N'Asignación de familia Operador de terminal al usuario A10019', N'A10001', CAST(N'2019-11-04 19:18:11.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 196298)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (271, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 19:18:47.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (272, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 19:20:05.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (273, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 22:28:41.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (274, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 22:29:45.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (275, N'Asignación de la patente Blanquear contraseña al usuario A10003', N'A10001', CAST(N'2019-11-04 22:30:18.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 222687)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (276, N'Negación de patente Blanquear contraseña al usuario A10001', N'A10001', CAST(N'2019-11-04 22:30:23.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 191514)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (277, N'Desnegación de la patente Blanquear contraseña al usuario A10001', N'A10001', CAST(N'2019-11-04 22:41:48.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 229225)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (278, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 23:04:11.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (279, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 23:06:13.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (280, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 23:06:45.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (281, N'Error DVH: Usuario - A10003', N'-', CAST(N'2019-11-04 23:06:59.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 35627)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (282, N'Error DVH: Usuario - A10008', N'-', CAST(N'2019-11-04 23:07:04.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 35762)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (283, N'Error DVH: Usuario - A10013', N'-', CAST(N'2019-11-04 23:07:04.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 35653)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (284, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 23:09:31.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (285, N'Error DVH: Usuario - A10007', N'-', CAST(N'2019-11-04 23:09:32.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 35735)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (286, N'Error DVH: Usuario - A10012', N'-', CAST(N'2019-11-04 23:09:32.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 35626)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (287, N'Error DVH: Bitacora - 135', N'-', CAST(N'2019-11-04 23:09:32.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 32595)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (288, N'Error DVH: Bitacora - 139', N'-', CAST(N'2019-11-04 23:09:32.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 32695)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (289, N'Error DVH: Bitacora - 149', N'-', CAST(N'2019-11-04 23:09:32.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 32719)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (290, N'Error DVH: Bitacora - 159', N'-', CAST(N'2019-11-04 23:09:32.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 32743)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (292, N'Error DVH: FamiliaPatente - 29qt6ubJfEh7CAhvIqpTm+a0LWvBLobi/xgjwrM+0nx11JyAR+21Gq5oWyPTqyyaD', N'-', CAST(N'2019-11-04 23:09:32.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 409355)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (293, N'Error DVV: Usuario - A10007', N'-', CAST(N'2019-11-04 23:09:32.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 35861)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (294, N'Error DVV: Usuario - A10012', N'-', CAST(N'2019-11-04 23:09:32.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 35752)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (295, N'Error DVV: Bitacora - 135', N'-', CAST(N'2019-11-04 23:09:32.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 32721)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (296, N'Error DVV: Bitacora - 139', N'-', CAST(N'2019-11-04 23:09:32.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 32821)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (297, N'Error DVV: Bitacora - 149', N'-', CAST(N'2019-11-04 23:09:32.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 32845)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (298, N'Error DVV: Bitacora - 159', N'-', CAST(N'2019-11-04 23:09:32.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 32869)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (300, N'Error DVV: FamiliaPatente - 29qt6ubJfEh7CAhvIqpTm+a0LWvBLobi/xgjwrM+0nx11JyAR+21Gq5oWyPTqyyaD', N'-', CAST(N'2019-11-04 23:09:32.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 409481)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (301, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 23:18:10.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (302, N'Error DVH: Bitacora - 133', N'-', CAST(N'2019-11-04 23:18:11.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 32545)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (303, N'Error DVH: Bitacora - 137', N'-', CAST(N'2019-11-04 23:18:11.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 32645)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (304, N'Error DVH: Bitacora - 139', N'-', CAST(N'2019-11-04 23:18:11.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 32695)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (305, N'Error DVH: Bitacora - 145', N'-', CAST(N'2019-11-04 23:18:11.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 32619)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (306, N'Error DVH: UsuarioPatente-A10012/Z4gW4Q5Ge16d7SCmLSTqWg==', N'-', CAST(N'2019-11-04 23:18:11.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 149551)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (307, N'Error DVH: UsuarioPatente-A10021/DFhu7MsyBLJIrfWG3mz6nVrNFcuxsxYH', N'-', CAST(N'2019-11-04 23:18:11.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 212283)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (308, N'Error DVH: UsuarioPatente-A10016/e687mfADI8WBWWNt9kEKZQ==', N'-', CAST(N'2019-11-04 23:18:11.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 148599)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (309, N'Error DVH: FamiliaPatente - Realizar copia de seguridad/Administrador de sistema', N'-', CAST(N'2019-11-04 23:18:11.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 337123)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (310, N'Error DVH: FamiliaPatente - Cambiar idioma/Operador de terminal', N'-', CAST(N'2019-11-04 23:18:11.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 210918)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (311, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 23:19:29.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (312, N'Error DVH: Bitacora - 133', N'-', CAST(N'2019-11-04 23:19:29.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 32545)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (313, N'Error DVH: Bitacora - 137', N'-', CAST(N'2019-11-04 23:19:29.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 32645)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (314, N'Error DVH: Bitacora - 139', N'-', CAST(N'2019-11-04 23:19:29.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 32695)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (315, N'Error DVH: Bitacora - 145', N'-', CAST(N'2019-11-04 23:19:29.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 32619)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (316, N'Error DVH: UsuarioPatente-A10012/Z4gW4Q5Ge16d7SCmLSTqWg==', N'-', CAST(N'2019-11-04 23:19:30.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 149551)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (317, N'Error DVH: UsuarioPatente-A10021/DFhu7MsyBLJIrfWG3mz6nVrNFcuxsxYH', N'-', CAST(N'2019-11-04 23:19:30.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 212283)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (318, N'Error DVH: UsuarioPatente-A10016/e687mfADI8WBWWNt9kEKZQ==', N'-', CAST(N'2019-11-04 23:19:30.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 148599)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (319, N'Error DVH: FamiliaPatente - Realizar copia de seguridad/Administrador de sistema', N'-', CAST(N'2019-11-04 23:19:30.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 337123)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (320, N'Error DVH: FamiliaPatente - Cambiar idioma/Operador de terminal', N'-', CAST(N'2019-11-04 23:19:30.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 210918)
GO
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (321, N'Error DVV: UsuarioPatente', N'-', CAST(N'2019-11-04 23:19:42.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 41326)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (322, N'Error DVV: FamiliaPatente', N'-', CAST(N'2019-11-04 23:19:42.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 40572)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (323, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 23:25:39.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (324, N'Error DVH: UsuarioPatente-A10016/Crear usuario', N'-', CAST(N'2019-11-04 23:25:40.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 112562)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (325, N'Error DVH: FamiliaPatente - Modificar usuario/Administrador de sistema', N'-', CAST(N'2019-11-04 23:25:40.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 263992)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (326, N'Error DVH: FamiliaPatente - Eliminar familia/Administrador de sistema', N'-', CAST(N'2019-11-04 23:25:40.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 254840)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (327, N'Error DVV: UsuarioPatente', N'-', CAST(N'2019-11-04 23:25:40.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 41326)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (328, N'Error DVV: FamiliaPatente', N'-', CAST(N'2019-11-04 23:25:40.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 40572)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (329, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-04 23:25:49.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (330, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 23:28:26.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (331, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 23:31:32.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (332, N'Asignación de la patente Crear producto al usuario A10001', N'A10001', CAST(N'2019-11-04 23:31:40.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 178862)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (333, N'Asignación de la patente Modificar producto al usuario A10001', N'A10001', CAST(N'2019-11-04 23:31:40.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 203877)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (334, N'Asignación de la patente Bloquear producto
 al usuario A10001', N'A10001', CAST(N'2019-11-04 23:31:41.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 203045)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (335, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-04 23:33:08.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (336, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 00:26:39.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (337, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 00:28:46.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (338, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 00:30:40.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (339, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 00:32:36.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (340, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 00:33:51.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (341, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 00:34:37.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (342, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 00:35:47.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (343, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 00:45:28.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (344, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 00:45:56.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (345, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 00:48:01.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (346, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 11:01:59.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (347, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 11:18:54.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (348, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 11:19:57.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (349, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 11:21:04.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (350, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 11:21:22.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (351, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 11:22:13.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (352, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 11:23:09.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (353, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 11:24:18.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (354, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 11:24:39.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (355, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 11:25:55.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (356, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 11:26:37.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (357, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 11:28:38.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (358, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 11:35:02.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (359, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 19:16:11.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (360, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 19:20:48.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (361, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 19:22:45.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (362, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 19:24:50.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (363, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 19:27:00.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (364, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 19:27:40.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (365, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 19:28:49.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (366, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 19:30:03.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (367, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 19:31:32.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (368, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 19:31:47.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (369, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 19:46:03.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (370, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 19:46:46.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (371, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 19:47:44.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (372, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 19:48:13.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (373, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 19:51:47.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (374, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 19:52:45.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (375, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 19:53:09.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (376, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 19:54:40.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (377, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 19:55:04.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (378, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 19:56:03.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (379, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 19:57:00.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (380, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 19:59:13.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (381, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 20:00:19.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (382, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 20:01:57.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (383, N'Asignación de la patente Asignar producto-terminal
 al usuario A10001', N'A10001', CAST(N'2019-11-05 20:02:06.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 255992)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (384, N'Asignación de la patente Transferir stock
 al usuario A10001', N'A10001', CAST(N'2019-11-05 20:02:06.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 196402)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (385, N'Asignación de la patente Crear conductor al usuario A10001', N'A10001', CAST(N'2019-11-05 20:02:06.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 184834)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (386, N'Asignación de la patente Modificar conductor al usuario A10001', N'A10001', CAST(N'2019-11-05 20:02:06.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 210237)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (387, N'Asignación de la patente Bloquear conductor al usuario A10001', N'A10001', CAST(N'2019-11-05 20:02:06.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 204387)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (388, N'Asignación de la patente Asignar conductor al usuario A10001', N'A10001', CAST(N'2019-11-05 20:02:06.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 200090)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (389, N'Asignación de la patente Blanquear contraseña al usuario A10001', N'A10001', CAST(N'2019-11-05 20:02:06.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 222561)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (390, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 20:06:39.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (391, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 20:13:06.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (392, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 20:14:46.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (393, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 20:21:35.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (394, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 20:23:17.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (395, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 20:27:05.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (396, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 20:28:57.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (397, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 20:29:58.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (398, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 20:37:08.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (399, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 20:39:20.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (400, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 20:42:15.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (401, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 20:45:55.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (402, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 20:51:23.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (403, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 21:14:23.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (404, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 21:15:13.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (405, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 21:16:04.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (406, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 21:16:20.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (407, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 21:18:08.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (408, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 21:20:06.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (409, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 21:21:37.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (410, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-05 21:22:10.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (411, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-06 20:55:07.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (412, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-06 21:43:09.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (413, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-06 21:45:11.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (414, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-06 21:49:53.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (415, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-06 22:15:57.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (416, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-06 22:20:32.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (417, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-06 22:22:29.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (418, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-06 22:22:54.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (419, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-06 22:26:25.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (420, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-06 22:29:31.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
GO
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (421, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-10 11:08:24.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (422, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-10 11:28:58.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (423, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-10 11:29:31.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (424, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-10 11:30:15.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (425, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-10 11:31:06.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (426, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-10 11:32:40.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (427, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-10 11:44:05.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (428, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-10 11:53:53.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (429, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-10 14:23:21.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (430, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-10 14:24:05.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (431, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-10 14:39:53.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (432, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-10 14:42:21.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (433, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-10 14:54:03.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (434, N'Generación copia de seguridad', N'A10001', CAST(N'2019-11-10 14:54:45.000' AS DateTime), N'ALTA', N'Rn0H3rjD7fwQjEXdScyVFA==', 64085)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (435, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-10 14:55:15.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (436, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-10 14:56:15.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (437, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-10 14:57:52.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (438, N'Restauración de copia de seguridad', N'A10001', CAST(N'2019-11-10 14:58:54.000' AS DateTime), N'ALTA', N'Rn0H3rjD7fwQjEXdScyVFA==', 82075)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (439, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-10 14:59:44.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (440, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-10 15:02:44.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (441, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-10 15:03:04.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (442, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-10 15:04:43.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (443, N'Error DVH: Bitacora - 128', N'-', CAST(N'2019-11-10 15:04:44.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 32646)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (444, N'Error DVH: Bitacora - 130', N'-', CAST(N'2019-11-10 15:04:44.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 32470)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (445, N'Error DVH: Bitacora - 136', N'-', CAST(N'2019-11-10 15:04:44.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 32620)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (446, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-10 15:04:54.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (447, N'Error DVH: Bitacora - 128', N'-', CAST(N'2019-11-10 15:04:54.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 32646)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (448, N'Error DVH: Bitacora - 130', N'-', CAST(N'2019-11-10 15:04:54.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 32470)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (449, N'Error DVH: Bitacora - 136', N'-', CAST(N'2019-11-10 15:04:54.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 32620)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (450, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-10 15:05:01.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (451, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-10 16:43:26.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (452, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-10 16:50:24.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (453, N'Cambio de idioma', N'A10001', CAST(N'2019-11-10 16:50:32.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 25448)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (454, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-10 16:50:41.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (455, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-11 18:58:22.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (456, N'Cambio de idioma', N'A10001', CAST(N'2019-11-11 18:58:59.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 25448)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (457, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-11 18:59:16.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (458, N'Contraseña errónea', N'A10001', CAST(N'2019-11-11 19:01:05.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (459, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-11 19:01:12.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (460, N'Bloqueo al usuario A10001', N'A10001', CAST(N'2019-11-11 19:01:23.000' AS DateTime), N'MEDIA', N'iW64F91246JSDQsp1CztXQ==', 45325)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (461, N'Desbloqueo al usuario A10001', N'A10001', CAST(N'2019-11-11 19:01:26.000' AS DateTime), N'MEDIA', N'iW64F91246JSDQsp1CztXQ==', 54378)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (462, N'Bloqueo al usuario A10002', N'A10001', CAST(N'2019-11-11 19:01:30.000' AS DateTime), N'MEDIA', N'iW64F91246JSDQsp1CztXQ==', 45350)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (463, N'Bloqueo al usuario A10001', N'A10001', CAST(N'2019-11-11 19:01:44.000' AS DateTime), N'MEDIA', N'iW64F91246JSDQsp1CztXQ==', 45325)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (464, N'Desbloqueo al usuario A10001', N'A10001', CAST(N'2019-11-11 19:01:46.000' AS DateTime), N'MEDIA', N'iW64F91246JSDQsp1CztXQ==', 54378)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (465, N'Bloqueo al usuario A10022', N'A10001', CAST(N'2019-11-11 19:02:05.000' AS DateTime), N'MEDIA', N'iW64F91246JSDQsp1CztXQ==', 45398)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (466, N'Bloqueo al usuario A10020', N'A10001', CAST(N'2019-11-11 19:02:09.000' AS DateTime), N'MEDIA', N'iW64F91246JSDQsp1CztXQ==', 45348)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (467, N'Bloqueo al usuario A10019', N'A10001', CAST(N'2019-11-11 19:02:13.000' AS DateTime), N'MEDIA', N'iW64F91246JSDQsp1CztXQ==', 45549)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (468, N'Bloqueo al usuario A10018', N'A10001', CAST(N'2019-11-11 19:02:16.000' AS DateTime), N'MEDIA', N'iW64F91246JSDQsp1CztXQ==', 45524)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (469, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-11 19:06:57.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (470, N'Cambio de idioma', N'A10001', CAST(N'2019-11-11 19:07:37.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 25448)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (471, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-11 19:07:46.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (472, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-11 19:08:29.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (473, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-11 19:14:06.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (474, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-11 19:44:49.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (475, N'Asignación de la patente Consultar usuario al usuario A10009', N'A10001', CAST(N'2019-11-11 19:45:00.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 199264)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (476, N'Asignación de la patente Crear usuario al usuario A10009', N'A10001', CAST(N'2019-11-11 19:45:01.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 173236)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (477, N'Negación de patente Consultar usuario al usuario A10019', N'A10001', CAST(N'2019-11-11 19:46:10.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 170196)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (478, N'Asignación de familia Administrador de sistema al usuario A10020', N'A10001', CAST(N'2019-11-11 19:46:22.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 222185)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (479, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-11 19:52:40.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (480, N'Cambio de idioma', N'A10001', CAST(N'2019-11-11 19:52:53.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 25448)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (481, N'Modificación usuario A10004', N'A10001', CAST(N'2019-11-11 19:53:09.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 50272)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (482, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-11 19:56:27.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (483, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-11 19:59:51.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (484, N'Negación de patente Blanquear contraseña al usuario A10003', N'A10001', CAST(N'2019-11-11 20:00:12.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 191630)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (485, N'Desnegación de la patente Blanquear contraseña al usuario A10003', N'A10001', CAST(N'2019-11-11 20:00:22.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 229353)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (486, N'Asignación de la patente Blanquear contraseña al usuario A10003', N'A10001', CAST(N'2019-11-11 20:00:39.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 222687)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (487, N'Usuario inválido', N'ADS', CAST(N'2019-11-11 20:05:32.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 27110)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (488, N'Contraseña errónea', N'A10001', CAST(N'2019-11-11 20:05:40.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (489, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-11 20:05:45.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (490, N'Generación usuario A10023', N'A10001', CAST(N'2019-11-11 20:06:38.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 44258)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (491, N'Asignación de la patente Consultar usuario al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:03.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 199022)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (492, N'Asignación de la patente Crear usuario al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:04.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 173010)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (493, N'Asignación de la patente Modificar usuario al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:04.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 197625)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (494, N'Asignación de la patente Bloquear usuario al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:05.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 191972)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (495, N'Asignación de la patente Desbloquear usuario al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:05.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 211415)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (496, N'Asignación de la patente Consutar familia al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:06.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 190601)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (497, N'Asignación de la patente Crear familia al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:06.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 171196)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (498, N'Asignación de la patente Eliminar familia al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:06.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 189712)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (499, N'Asignación de la patente Asignar patente-familia al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:07.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 234641)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (500, N'Asignación de la patente Asignar patente-usuario al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:07.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 236985)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (501, N'Asignación de la patente Negar patente-usuario al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:08.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 223038)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (502, N'Asignación de la patente Restaurar copia de seguridad al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:08.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 268041)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (503, N'Asignación de la patente Realizar copia de seguridad al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:08.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 260103)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (504, N'Asignación de la patente Consultar bitácora al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:09.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 208830)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (505, N'Asignación de la patente Cambiar contraseña al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:09.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 208611)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (506, N'Asignación de la patente Cambiar idioma al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:09.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 176981)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (507, N'Asignación de la patente Consultar producto al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:10.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 205516)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (508, N'Asignación de la patente Crear producto al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:10.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 179088)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (509, N'Asignación de la patente Modificar producto al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:10.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 204119)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (510, N'Asignación de la patente Bloquear producto
 al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:11.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 203291)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (511, N'Asignación de la patente Consultar producto-terminal
 al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:11.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 272004)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (512, N'Asignación de la patente Asignar producto-terminal
 al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:12.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 256270)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (513, N'Asignación de la patente Consultar tanque al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:12.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 192007)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (514, N'Asignación de la patente Crear tanque
 al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:12.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 171297)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (515, N'Asignación de la patente Modificar tanque al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:13.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 190610)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (516, N'Asignación de la patente Bloquear tanque al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:13.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 185079)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (517, N'Asignación de la patente Transferir stock
 al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:13.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 196644)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (518, N'Asignación de la patente Generar remito al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:14.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 178653)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (519, N'Asignación de la patente Generar recibo al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:14.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 177609)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (520, N'Asignación de la patente Consultar documento al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:14.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 211754)
GO
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (521, N'Asignación de la patente Consultar conductor al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:15.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 211880)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (522, N'Asignación de la patente Crear conductor al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:15.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 185064)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (523, N'Asignación de la patente Modificar conductor al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:15.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 210483)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (524, N'Asignación de la patente Bloquear conductor al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:16.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 204629)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (525, N'Asignación de la patente Consultar pedidos pendientes
 al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:16.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 278002)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (526, N'Asignación de la patente Asignar conductor al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:16.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 200332)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (527, N'Asignación de la patente Blanquear contraseña al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:17.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 222811)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (528, N'Asignación de la patente Asignar familia-usuario al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:17.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 235876)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (529, N'Asignación de la patente Recalcular digito verificador al usuario A10023', N'A10001', CAST(N'2019-11-11 20:07:18.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 278753)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (530, N'Bloqueo al usuario A10001', N'A10001', CAST(N'2019-11-11 20:07:30.000' AS DateTime), N'MEDIA', N'iW64F91246JSDQsp1CztXQ==', 45325)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (531, N'Bloqueo al usuario A10003', N'A10001', CAST(N'2019-11-11 20:07:40.000' AS DateTime), N'MEDIA', N'iW64F91246JSDQsp1CztXQ==', 45375)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (532, N'Asignación de familia Jefe de producto al usuario A10023', N'A10001', CAST(N'2019-11-11 20:09:24.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 171615)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (533, N'Restauración de copia de seguridad', N'A10023', CAST(N'2019-11-11 20:25:58.000' AS DateTime), N'ALTA', N'Rn0H3rjD7fwQjEXdScyVFA==', 82233)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (534, N'Ingreso a aplicación', N'A10023', CAST(N'2019-11-11 20:28:40.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38164)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (535, N'Error DVH: Usuario - A10023', N'-', CAST(N'2019-11-11 20:28:41.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 35679)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (536, N'Recálculo de dígitos verificadores', N'A10023', CAST(N'2019-11-11 20:28:58.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86544)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (537, N'Usuario bloqueado', N'A10001', CAST(N'2019-11-11 20:32:21.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 31087)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (538, N'Ingreso a aplicación', N'A10023', CAST(N'2019-11-11 20:32:29.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38164)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (539, N'Desbloqueo al usuario A10001', N'A10023', CAST(N'2019-11-11 20:32:33.000' AS DateTime), N'MEDIA', N'iW64F91246JSDQsp1CztXQ==', 54512)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (540, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-11 20:35:02.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (541, N'Se eliminó la familia P Bi', N'A10001', CAST(N'2019-11-11 20:35:08.000' AS DateTime), N'MEDIA', N'/iEIDrAVuXe+dC0X3hyaIg==', 52356)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (542, N'Se eliminó la familia pruebdasd', N'A10001', CAST(N'2019-11-11 20:35:12.000' AS DateTime), N'MEDIA', N'/iEIDrAVuXe+dC0X3hyaIg==', 74335)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (543, N'Se eliminó la familia rgrthrthty', N'A10001', CAST(N'2019-11-11 20:35:15.000' AS DateTime), N'MEDIA', N'/iEIDrAVuXe+dC0X3hyaIg==', 80234)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (544, N'Se eliminó la familia dsgdfgdfs', N'A10001', CAST(N'2019-11-11 20:35:19.000' AS DateTime), N'MEDIA', N'/iEIDrAVuXe+dC0X3hyaIg==', 74061)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (545, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-11 20:44:20.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (546, N'Error DVV: FamiliaPatente', N'-', CAST(N'2019-11-11 20:44:21.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 40572)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (547, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-11 20:44:24.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (548, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-11 20:44:30.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (549, N'Se eliminó la familia fgfdgfdgfd', N'A10001', CAST(N'2019-11-11 20:44:38.000' AS DateTime), N'MEDIA', N'/iEIDrAVuXe+dC0X3hyaIg==', 77279)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (550, N'Se eliminó la familia zdasdas', N'A10001', CAST(N'2019-11-11 20:44:41.000' AS DateTime), N'MEDIA', N'/iEIDrAVuXe+dC0X3hyaIg==', 66717)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (551, N'Se eliminó la familia asdasdasdsa', N'A10001', CAST(N'2019-11-11 20:44:45.000' AS DateTime), N'MEDIA', N'/iEIDrAVuXe+dC0X3hyaIg==', 82143)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (552, N'Se eliminó la familia adssadsa', N'A10001', CAST(N'2019-11-11 20:44:48.000' AS DateTime), N'MEDIA', N'/iEIDrAVuXe+dC0X3hyaIg==', 70164)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (553, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-11 20:44:56.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (554, N'Generación familia asd', N'A10001', CAST(N'2019-11-11 20:45:02.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 41364)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (555, N'Asignación de la patente Consultar usuario a la familia asd', N'A10001', CAST(N'2019-11-11 20:45:09.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 203767)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (556, N'Asignación de la patente Crear usuario a la familia asd', N'A10001', CAST(N'2019-11-11 20:45:09.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 177447)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (557, N'Asignación de la patente Modificar usuario a la familia asd', N'A10001', CAST(N'2019-11-11 20:45:09.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 202370)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (558, N'Asignación de la patente Bloquear usuario a la familia asd', N'A10001', CAST(N'2019-11-11 20:45:09.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 196640)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (559, N'Se eliminó la familia asd', N'A10001', CAST(N'2019-11-11 20:45:14.000' AS DateTime), N'MEDIA', N'/iEIDrAVuXe+dC0X3hyaIg==', 52200)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (560, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-11 20:45:21.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (561, N'Generación usuario A10024', N'A10001', CAST(N'2019-11-11 20:45:56.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 44283)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (562, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-11 20:46:04.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (563, N'Error DVH: Usuario - A10024', N'-', CAST(N'2019-11-11 20:46:05.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 35706)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (564, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-11 20:48:45.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (565, N'Error DVH: Usuario - A10024', N'-', CAST(N'2019-11-11 20:48:45.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 35706)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (566, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-11 20:48:47.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (567, N'Generación usuario A10025', N'A10001', CAST(N'2019-11-11 20:49:05.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 44308)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (568, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-11 20:49:13.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (569, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-11 21:01:58.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (570, N'Bloqueo al usuario A10001', N'A10001', CAST(N'2019-11-11 21:02:05.000' AS DateTime), N'MEDIA', N'iW64F91246JSDQsp1CztXQ==', 45325)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (571, N'Bloqueo al usuario A10025', N'A10001', CAST(N'2019-11-11 21:02:08.000' AS DateTime), N'MEDIA', N'iW64F91246JSDQsp1CztXQ==', 45473)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (572, N'Bloqueo al usuario A10024', N'A10001', CAST(N'2019-11-11 21:02:11.000' AS DateTime), N'MEDIA', N'iW64F91246JSDQsp1CztXQ==', 45448)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (573, N'Asignación de familia Administrador de sistema al usuario A10023', N'A10001', CAST(N'2019-11-11 21:03:37.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 222377)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (574, N'Usuario bloqueado', N'A10001', CAST(N'2019-11-11 21:14:19.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 31087)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (575, N'Ingreso a aplicación', N'A10023', CAST(N'2019-11-11 21:14:45.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38164)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (576, N'Usuario bloqueado', N'A10001', CAST(N'2019-11-11 21:15:53.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 31087)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (577, N'Ingreso a aplicación', N'A10023', CAST(N'2019-11-11 21:16:00.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38164)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (578, N'Usuario bloqueado', N'A10001', CAST(N'2019-11-11 21:16:33.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 31087)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (579, N'Ingreso a aplicación', N'A10023', CAST(N'2019-11-11 21:16:40.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38164)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (580, N'Usuario bloqueado', N'A10001', CAST(N'2019-11-11 23:24:30.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 31087)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (581, N'Ingreso a aplicación', N'A10023', CAST(N'2019-11-11 23:24:48.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38164)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (582, N'Deasignación de la patente Consultar usuario al usuario A10023', N'A10023', CAST(N'2019-11-11 23:25:00.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 211992)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (583, N'Deasignación de la patente Crear usuario al usuario A10023', N'A10023', CAST(N'2019-11-11 23:25:52.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 185040)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (584, N'Deasignación de la patente Modificar usuario al usuario A10023', N'A10023', CAST(N'2019-11-11 23:25:53.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 210505)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (585, N'Deasignación de la patente Bloquear usuario al usuario A10023', N'A10023', CAST(N'2019-11-11 23:25:54.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 204682)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (586, N'Deasignación de la patente Generar remito al usuario A10023', N'A10023', CAST(N'2019-11-11 23:25:59.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 190877)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (587, N'Usuario bloqueado', N'A10001', CAST(N'2019-11-17 16:58:56.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 31087)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (588, N'Ingreso a aplicación', N'A10023', CAST(N'2019-11-17 16:59:08.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38164)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (589, N'Usuario bloqueado', N'A10001', CAST(N'2019-11-17 17:14:47.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 31087)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (590, N'Ingreso a aplicación', N'A10023', CAST(N'2019-11-17 17:14:53.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38164)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (591, N'Ingreso a aplicación', N'A10023', CAST(N'2019-11-17 17:25:45.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38164)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (592, N'Ingreso a aplicación', N'A10023', CAST(N'2019-11-17 17:30:56.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38164)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (593, N'Cambio de idioma', N'A10023', CAST(N'2019-11-17 17:31:07.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 25534)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (594, N'Ingreso a aplicación', N'A10023', CAST(N'2019-11-17 17:31:20.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38164)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (595, N'Ingreso a aplicación', N'A10023', CAST(N'2019-11-17 17:35:14.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38164)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (596, N'Cambio de idioma', N'A10023', CAST(N'2019-11-17 17:35:20.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 25534)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (597, N'Ingreso a aplicación', N'A10023', CAST(N'2019-11-17 17:35:30.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38164)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (598, N'Ingreso a aplicación', N'A10023', CAST(N'2019-11-17 17:53:54.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38164)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (599, N'Ingreso a aplicación', N'A10023', CAST(N'2019-11-17 17:57:58.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38164)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (600, N'Ingreso a aplicación', N'A10023', CAST(N'2019-11-17 18:55:11.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38164)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (601, N'Desbloqueo al usuario A10001', N'A10023', CAST(N'2019-11-17 18:55:16.000' AS DateTime), N'MEDIA', N'iW64F91246JSDQsp1CztXQ==', 54512)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (602, N'Generación producto ', N'A10023', CAST(N'2019-11-17 18:55:23.000' AS DateTime), N'BAJA', N'OCZ82uBtIsuqzAoOciuv/A==', 36576)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (603, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-17 18:57:29.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (604, N'Generación producto ', N'A10001', CAST(N'2019-11-17 18:57:39.000' AS DateTime), N'BAJA', N'OCZ82uBtIsuqzAoOciuv/A==', 36474)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (605, N'Generación producto ', N'A10001', CAST(N'2019-11-17 18:57:47.000' AS DateTime), N'BAJA', N'OCZ82uBtIsuqzAoOciuv/A==', 36474)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (606, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-17 18:59:11.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (607, N'Generación producto A1', N'A10001', CAST(N'2019-11-17 18:59:34.000' AS DateTime), N'BAJA', N'OCZ82uBtIsuqzAoOciuv/A==', 40071)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (608, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-17 19:00:28.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (609, N'Modificación producto A1        ', N'A10001', CAST(N'2019-11-17 19:00:38.000' AS DateTime), N'BAJA', N'OCZ82uBtIsuqzAoOciuv/A==', 57836)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (610, N'Modificación producto A1        ', N'A10001', CAST(N'2019-11-17 19:00:53.000' AS DateTime), N'BAJA', N'OCZ82uBtIsuqzAoOciuv/A==', 57836)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (611, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-17 19:05:38.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (612, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-17 19:10:09.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (613, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-17 19:10:40.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (614, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 16:32:40.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (615, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 16:36:31.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (616, N'Generación producto B2', N'A10001', CAST(N'2019-11-18 16:53:23.000' AS DateTime), N'BAJA', N'OCZ82uBtIsuqzAoOciuv/A==', 40114)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (617, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 16:54:06.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (618, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 16:55:33.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (619, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 16:58:42.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (620, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 17:00:13.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
GO
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (621, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 17:02:51.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (622, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 17:04:02.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (623, N'Modificación producto A1        ', N'A10001', CAST(N'2019-11-18 17:04:24.000' AS DateTime), N'BAJA', N'OCZ82uBtIsuqzAoOciuv/A==', 57836)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (624, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 17:11:06.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (625, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 17:22:49.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (626, N'Deasignación de la patente Crear producto al usuario A10001', N'A10001', CAST(N'2019-11-18 17:22:56.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 190838)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (627, N'Deasignación de la patente Bloquear producto
 al usuario A10001', N'A10001', CAST(N'2019-11-18 17:23:09.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 215735)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (628, N'Deasignación de la patente Modificar producto al usuario A10001', N'A10001', CAST(N'2019-11-18 17:23:10.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 216687)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (629, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 17:23:22.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (630, N'Asignación de la patente Crear producto al usuario A10001', N'A10001', CAST(N'2019-11-18 17:24:06.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 178862)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (631, N'Asignación de la patente Modificar producto al usuario A10001', N'A10001', CAST(N'2019-11-18 17:24:06.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 203877)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (632, N'Asignación de la patente Bloquear producto
 al usuario A10001', N'A10001', CAST(N'2019-11-18 17:24:06.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 203045)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (633, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 17:44:44.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (634, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 17:51:58.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (635, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 18:48:01.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (636, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 18:49:22.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (637, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 18:49:47.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (638, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 18:54:43.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (639, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 18:55:08.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (640, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 18:57:57.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (641, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 19:00:01.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (642, N'Generación tanque AA Terminal: LOMAS DE ZAMORA', N'A10001', CAST(N'2019-11-18 19:00:13.000' AS DateTime), N'BAJA', N'xDn/X23HLmQ=', 114922)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (643, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 19:06:53.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (644, N'Error DVV: Tanque', N'-', CAST(N'2019-11-18 19:06:54.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 20567)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (645, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-18 19:06:57.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (646, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 19:08:52.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (647, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 19:12:16.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (648, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 19:16:39.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (649, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 19:18:12.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (650, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 19:23:24.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (651, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 19:24:10.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (652, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 19:28:57.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (653, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 19:30:25.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (654, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 19:31:51.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (655, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 19:33:51.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (656, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 19:34:30.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (657, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 19:35:37.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (658, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 19:39:31.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (659, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 19:48:11.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (660, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 19:59:13.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (661, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 20:00:02.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (662, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 20:15:49.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (663, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 20:17:22.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (664, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 20:25:02.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (665, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 20:26:16.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (666, N'Modificación tanque AA Terminal: 4001', N'A10001', CAST(N'2019-11-18 20:26:24.000' AS DateTime), N'BAJA', N'OCZ82uBtIsuqzAoOciuv/A==', 82351)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (667, N'Modificación tanque AA Terminal: 4001', N'A10001', CAST(N'2019-11-18 20:26:41.000' AS DateTime), N'BAJA', N'OCZ82uBtIsuqzAoOciuv/A==', 82351)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (668, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 20:29:24.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (669, N'Modificación tanque AA Terminal: 4001', N'A10001', CAST(N'2019-11-18 20:29:34.000' AS DateTime), N'BAJA', N'OCZ82uBtIsuqzAoOciuv/A==', 82351)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (670, N'Modificación tanque AA Terminal: 4001', N'A10001', CAST(N'2019-11-18 20:29:44.000' AS DateTime), N'BAJA', N'OCZ82uBtIsuqzAoOciuv/A==', 82351)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (671, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 20:31:04.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (672, N'Modificación tanque AA Terminal: 4001', N'A10001', CAST(N'2019-11-18 20:31:31.000' AS DateTime), N'BAJA', N'OCZ82uBtIsuqzAoOciuv/A==', 82351)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (673, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 20:34:09.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (674, N'Generación tanque TK2 Terminal: LOMAS DE ZAMORA', N'A10001', CAST(N'2019-11-18 20:34:36.000' AS DateTime), N'BAJA', N'xDn/X23HLmQ=', 119099)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (675, N'Modificación usuario A10001', N'A10001', CAST(N'2019-11-18 20:34:58.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 50191)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (676, N'Generación tanque TK8 Terminal: PILAR', N'A10001', CAST(N'2019-11-18 20:35:16.000' AS DateTime), N'BAJA', N'xDn/X23HLmQ=', 85026)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (677, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 20:36:34.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (678, N'Error DVV: Tanque', N'-', CAST(N'2019-11-18 20:36:35.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 20567)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (679, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-18 20:36:41.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (680, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 20:39:09.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (681, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 20:41:02.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (682, N'Generación tanque TANK2 Terminal: PILAR', N'A10001', CAST(N'2019-11-18 20:41:40.000' AS DateTime), N'BAJA', N'xDn/X23HLmQ=', 91894)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (683, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 20:41:48.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (684, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 20:54:23.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (685, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 20:55:41.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (686, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 20:57:04.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (687, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 20:58:43.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (688, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 21:00:03.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (689, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 21:02:09.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (690, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 21:03:20.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (691, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 21:04:36.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (692, N'Generación copia de seguridad', N'A10001', CAST(N'2019-11-18 21:04:48.000' AS DateTime), N'ALTA', N'Rn0H3rjD7fwQjEXdScyVFA==', 64085)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (693, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 21:06:06.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (694, N'Restauración de copia de seguridad', N'A10001', CAST(N'2019-11-18 21:07:31.000' AS DateTime), N'ALTA', N'Rn0H3rjD7fwQjEXdScyVFA==', 82075)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (695, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 21:08:02.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (696, N'Generación copia de seguridad', N'A10001', CAST(N'2019-11-18 21:08:23.000' AS DateTime), N'ALTA', N'Rn0H3rjD7fwQjEXdScyVFA==', 64085)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (697, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 21:41:04.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (698, N'Generación conductor Gomez Patente: 35642674', N'A10001', CAST(N'2019-11-18 21:41:18.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 108403)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (699, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 21:41:51.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (700, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 22:17:15.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (701, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 22:17:49.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (702, N'Activación conductor 1', N'A10001', CAST(N'2019-11-18 22:18:28.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 40853)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (703, N'Desactivación conductor 1', N'A10001', CAST(N'2019-11-18 22:18:34.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 50068)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (704, N'Activación conductor 1', N'A10001', CAST(N'2019-11-18 22:18:36.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 40853)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (705, N'Activación conductor 1', N'A10001', CAST(N'2019-11-18 22:18:38.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 40853)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (706, N'Desactivación conductor 1', N'A10001', CAST(N'2019-11-18 22:18:39.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 50068)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (707, N'Activación conductor 1', N'A10001', CAST(N'2019-11-18 22:18:39.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 40853)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (708, N'Desactivación conductor 1', N'A10001', CAST(N'2019-11-18 22:18:39.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 50068)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (709, N'Desactivación conductor 1', N'A10001', CAST(N'2019-11-18 22:18:40.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 50068)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (710, N'Activación conductor 1', N'A10001', CAST(N'2019-11-18 22:18:40.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 40853)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (711, N'Desactivación conductor 1', N'A10001', CAST(N'2019-11-18 22:18:40.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 50068)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (712, N'Desactivación conductor 1', N'A10001', CAST(N'2019-11-18 22:18:40.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 50068)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (713, N'Desactivación conductor 1', N'A10001', CAST(N'2019-11-18 22:18:41.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 50068)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (714, N'Activación conductor 1', N'A10001', CAST(N'2019-11-18 22:18:41.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 40853)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (715, N'Activación conductor 1', N'A10001', CAST(N'2019-11-18 22:18:41.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 40853)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (716, N'Activación conductor 1', N'A10001', CAST(N'2019-11-18 22:18:41.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 40853)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (717, N'Desactivación conductor 1', N'A10001', CAST(N'2019-11-18 22:18:41.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 50068)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (718, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 22:21:27.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (719, N'Activación conductor 1', N'A10001', CAST(N'2019-11-18 22:21:35.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 40853)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (720, N'Desactivación conductor 1', N'A10001', CAST(N'2019-11-18 22:21:38.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 50068)
GO
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (721, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 22:25:54.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (722, N'Activación conductor 1', N'A10001', CAST(N'2019-11-18 22:26:00.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 40853)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (723, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 22:26:48.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (724, N'Desactivación conductor 1', N'A10001', CAST(N'2019-11-18 22:26:58.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 50068)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (725, N'Activación conductor 1', N'A10001', CAST(N'2019-11-18 22:27:00.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 40853)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (726, N'Desactivación conductor 1', N'A10001', CAST(N'2019-11-18 22:27:01.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 50068)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (727, N'Activación conductor 1', N'A10001', CAST(N'2019-11-18 22:27:01.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 40853)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (728, N'Desactivación conductor 1', N'A10001', CAST(N'2019-11-18 22:27:02.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 50068)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (729, N'Activación conductor 1', N'A10001', CAST(N'2019-11-18 22:27:03.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 40853)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (730, N'Desactivación conductor 1', N'A10001', CAST(N'2019-11-18 22:27:03.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 50068)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (731, N'Generación conductor Garcia Patente: 346352', N'A10001', CAST(N'2019-11-18 22:27:18.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 106129)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (732, N'Contraseña errónea', N'A10001', CAST(N'2019-11-18 22:31:01.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (733, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 22:31:07.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (734, N'Desactivación conductor 2', N'A10001', CAST(N'2019-11-18 22:31:31.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 50093)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (735, N'Activación conductor 1', N'A10001', CAST(N'2019-11-18 22:31:33.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 40853)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (736, N'Desactivación conductor 1', N'A10001', CAST(N'2019-11-18 22:31:33.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 50068)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (737, N'Desactivación conductor 2', N'A10001', CAST(N'2019-11-18 22:31:37.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 50093)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (738, N'Desactivación conductor 2', N'A10001', CAST(N'2019-11-18 22:31:39.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 50093)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (739, N'Desactivación conductor 1', N'A10001', CAST(N'2019-11-18 22:31:40.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 50068)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (740, N'Desactivación conductor 1', N'A10001', CAST(N'2019-11-18 22:31:41.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 50068)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (741, N'Activación conductor 1', N'A10001', CAST(N'2019-11-18 22:31:41.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 40853)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (742, N'Desactivación conductor 1', N'A10001', CAST(N'2019-11-18 22:31:41.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 50068)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (743, N'Activación conductor 1', N'A10001', CAST(N'2019-11-18 22:31:43.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 40853)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (744, N'Desactivación conductor 1', N'A10001', CAST(N'2019-11-18 22:31:43.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 50068)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (745, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 22:51:34.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (746, N'Modificación usuario A10003', N'A10001', CAST(N'2019-11-18 22:51:42.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 50245)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (747, N'Modificación usuario A10003', N'A10001', CAST(N'2019-11-18 22:51:50.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 50245)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (748, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 22:52:44.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (749, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 22:54:28.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (750, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 22:59:27.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (751, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 23:04:43.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (752, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 23:06:15.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (753, N'Modificación conductor Garcia Patente: 423423', N'A10001', CAST(N'2019-11-18 23:06:22.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 115210)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (754, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 23:07:21.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (755, N'Modificación conductor Gomez                Patente: 12312 ', N'A10001', CAST(N'2019-11-18 23:07:27.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 153137)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (756, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 23:14:08.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (757, N'Deasignación de la patente Modificar conductor al usuario A10001', N'A10001', CAST(N'2019-11-18 23:14:19.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 223241)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (758, N'Deasignación de la patente Bloquear producto
 al usuario A10001', N'A10001', CAST(N'2019-11-18 23:14:21.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 215735)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (759, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 23:14:32.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (760, N'Deasignación de la patente Bloquear conductor al usuario A10001', N'A10001', CAST(N'2019-11-18 23:14:46.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 217225)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (761, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-18 23:14:57.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (762, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 00:07:54.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (763, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 00:09:44.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (764, N'Modificación usuario A10001', N'A10001', CAST(N'2019-11-19 00:10:33.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 50191)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (765, N'Modificación usuario A10001', N'A10001', CAST(N'2019-11-19 00:10:51.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 50191)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (766, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 00:12:12.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (767, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 00:24:36.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (768, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 00:33:35.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (769, N'Generación tanque AAA8 Terminal: LOMAS DE ZAMORA', N'A10001', CAST(N'2019-11-19 00:34:04.000' AS DateTime), N'BAJA', N'xDn/X23HLmQ=', 122651)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (770, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 20:17:39.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (771, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 20:18:23.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (772, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 20:19:00.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (773, N'Negación de patente Asignar conductor al usuario A10001', N'A10001', CAST(N'2019-11-19 20:19:35.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 171168)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (774, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 20:19:42.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (775, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 20:20:23.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (776, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 21:36:17.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (777, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 21:36:52.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (778, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 21:40:51.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (779, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 21:41:42.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (780, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 21:42:38.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (781, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 21:45:04.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (782, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 21:50:36.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (783, N'Desnegación de la patente Asignar conductor al usuario A10001', N'A10001', CAST(N'2019-11-19 21:50:50.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 206329)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (784, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 21:50:58.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (785, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 21:52:02.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (786, N'Negación de patente Asignar conductor al usuario A10001', N'A10001', CAST(N'2019-11-19 21:52:12.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 171168)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (787, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 21:52:24.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (788, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 21:53:19.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (789, N'Desnegación de la patente Asignar conductor al usuario A10001', N'A10001', CAST(N'2019-11-19 21:53:29.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 206329)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (790, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 21:53:36.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (791, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 21:54:08.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (792, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 21:56:01.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (793, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 21:56:35.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (794, N'Asignación de la patente Asignar conductor al usuario A10001', N'A10001', CAST(N'2019-11-19 21:56:47.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 200090)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (795, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 21:57:17.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (796, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 21:58:33.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (797, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 22:46:03.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (798, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 22:47:23.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (799, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 22:47:54.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (800, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 22:49:11.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (801, N'Asignación de la patente Modificar conductor al usuario A10001', N'A10001', CAST(N'2019-11-19 22:49:24.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 210237)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (802, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 22:49:31.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (803, N'Modificación conductor Gomez Patente: 12312 ', N'A10001', CAST(N'2019-11-19 22:49:42.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 110342)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (804, N'Modificación conductor Garcia Patente: 423423', N'A10001', CAST(N'2019-11-19 22:49:48.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 115210)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (805, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 22:50:35.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (806, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 22:51:17.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (807, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 22:51:55.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (808, N'Asignación conductor DNI: 423423 Pedido: 2', N'A10001', CAST(N'2019-11-19 22:52:00.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 96272)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (809, N'Asignación conductor DNI: 12312  Pedido: 2', N'A10001', CAST(N'2019-11-19 22:52:05.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 95493)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (810, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 22:56:40.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (811, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-19 23:29:32.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (812, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 00:12:09.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (813, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 00:17:18.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (814, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 00:20:38.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (815, N'Generación recibo 1', N'A10001', CAST(N'2019-11-20 00:20:46.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 32229)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (816, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 00:22:05.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (817, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 12:57:11.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (818, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 12:58:03.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (819, N'Error DVH: Documento - RC 0', N'-', CAST(N'2019-11-20 12:58:04.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38132)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (820, N'Error DVH: Documento - RM 0', N'-', CAST(N'2019-11-20 12:58:04.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38382)
GO
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (821, N'Error DVH: Documento - RC 1', N'-', CAST(N'2019-11-20 12:58:04.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38159)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (822, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-20 12:58:15.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (823, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 12:58:22.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (824, N'Error DVH: Documento - RC 0', N'-', CAST(N'2019-11-20 12:58:22.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38132)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (825, N'Error DVH: Documento - RM 0', N'-', CAST(N'2019-11-20 12:58:22.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38382)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (826, N'Error DVH: Documento - RC 1', N'-', CAST(N'2019-11-20 12:58:22.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38159)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (827, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 12:59:04.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (828, N'Error DVH: Documento - RC 0', N'-', CAST(N'2019-11-20 12:59:36.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38132)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (829, N'Error DVH: Documento - RM 0', N'-', CAST(N'2019-11-20 12:59:36.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38382)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (830, N'Error DVH: Documento - RC 1', N'-', CAST(N'2019-11-20 12:59:36.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38159)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (831, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-20 12:59:41.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (832, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 13:00:50.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (833, N'Error DVH: Documento - RC 0', N'-', CAST(N'2019-11-20 13:00:51.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38132)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (834, N'Error DVH: Documento - RM 0', N'-', CAST(N'2019-11-20 13:00:51.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38382)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (835, N'Error DVH: Documento - RC 1', N'-', CAST(N'2019-11-20 13:00:51.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38159)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (836, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-20 13:00:53.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (837, N'Generación recibo 2', N'A10001', CAST(N'2019-11-20 13:01:28.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 32248)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (838, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 13:01:43.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (839, N'Error DVH: Documento - RC 0', N'-', CAST(N'2019-11-20 13:01:44.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38132)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (840, N'Error DVH: Documento - RM 0', N'-', CAST(N'2019-11-20 13:01:44.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38382)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (841, N'Error DVH: Documento - RC 1', N'-', CAST(N'2019-11-20 13:01:44.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38159)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (842, N'Error DVH: Documento - RC 2', N'-', CAST(N'2019-11-20 13:01:44.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38186)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (843, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-20 13:01:47.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (844, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 13:02:25.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (845, N'Error DVH: Documento - RC 0', N'-', CAST(N'2019-11-20 13:02:40.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38132)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (846, N'Error DVH: Documento - RM 0', N'-', CAST(N'2019-11-20 13:02:51.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38382)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (847, N'Error DVH: Documento - RC 1', N'-', CAST(N'2019-11-20 13:02:52.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38159)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (848, N'Error DVH: Documento - RC 2', N'-', CAST(N'2019-11-20 13:02:58.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38186)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (849, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 13:03:26.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (850, N'Error DVH: Documento - RC 0', N'-', CAST(N'2019-11-20 13:03:27.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38132)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (851, N'Error DVH: Documento - RM 0', N'-', CAST(N'2019-11-20 13:03:27.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38382)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (852, N'Error DVH: Documento - RC 1', N'-', CAST(N'2019-11-20 13:03:27.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38159)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (853, N'Error DVH: Documento - RC 2', N'-', CAST(N'2019-11-20 13:03:27.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38186)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (854, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-20 13:03:30.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (855, N'Generación recibo 3', N'A10001', CAST(N'2019-11-20 13:03:50.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 32267)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (856, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 13:04:24.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (857, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 13:05:51.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (858, N'Error DVH: Documento - RC 0', N'-', CAST(N'2019-11-20 13:05:52.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38132)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (859, N'Error DVH: Documento - RM 0', N'-', CAST(N'2019-11-20 13:05:52.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38382)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (860, N'Error DVH: Documento - RC 1', N'-', CAST(N'2019-11-20 13:05:52.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38159)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (861, N'Error DVH: Documento - RC 2', N'-', CAST(N'2019-11-20 13:05:52.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38186)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (862, N'Error DVH: Documento - RC 3', N'-', CAST(N'2019-11-20 13:05:52.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38213)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (863, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-20 13:05:54.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (864, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 13:06:07.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (865, N'Error DVH: Documento - RC 0', N'-', CAST(N'2019-11-20 13:06:08.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38132)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (866, N'Error DVH: Documento - RM 0', N'-', CAST(N'2019-11-20 13:06:08.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38382)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (867, N'Error DVH: Documento - RC 1', N'-', CAST(N'2019-11-20 13:06:08.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38159)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (868, N'Error DVH: Documento - RC 2', N'-', CAST(N'2019-11-20 13:06:08.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38186)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (869, N'Error DVH: Documento - RC 3', N'-', CAST(N'2019-11-20 13:06:08.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38213)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (870, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 13:06:27.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (871, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 13:07:19.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (872, N'Error DVH: Documento - RC 0', N'-', CAST(N'2019-11-20 13:07:20.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38132)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (873, N'Error DVH: Documento - RM 0', N'-', CAST(N'2019-11-20 13:07:20.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38382)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (874, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-20 13:07:23.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (875, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 13:07:31.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (876, N'Error DVH: Documento - RC 0', N'-', CAST(N'2019-11-20 13:07:31.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38132)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (877, N'Error DVH: Documento - RM 0', N'-', CAST(N'2019-11-20 13:07:31.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38382)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (878, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-20 13:07:39.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (879, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 13:07:49.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (880, N'Error DVH: Documento - RC 0', N'-', CAST(N'2019-11-20 13:08:16.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38132)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (881, N'Error DVH: Documento - RM 0', N'-', CAST(N'2019-11-20 13:08:16.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38382)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (882, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 13:11:34.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (883, N'Error DVH: Documento - RC 0', N'-', CAST(N'2019-11-20 13:11:37.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38132)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (884, N'Error DVH: Documento - RM 0', N'-', CAST(N'2019-11-20 13:11:37.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38382)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (885, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 13:12:41.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (886, N'Error DVH: Documento - RC 0', N'-', CAST(N'2019-11-20 13:12:42.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38132)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (887, N'Error DVH: Documento - RM 0', N'-', CAST(N'2019-11-20 13:12:42.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38382)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (888, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-20 13:12:44.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (889, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 13:12:51.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (890, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 13:40:05.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (891, N'Generación recibo 4', N'A10001', CAST(N'2019-11-20 13:40:22.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 32286)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (892, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 13:42:28.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (893, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 13:53:17.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (894, N'Generación tanque TK1 Terminal: LOMAS DE ZAMORA', N'A10001', CAST(N'2019-11-20 13:54:21.000' AS DateTime), N'BAJA', N'xDn/X23HLmQ=', 119078)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (895, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 13:55:11.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (896, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 13:56:42.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (897, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 13:57:45.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (898, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 13:59:33.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (899, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 14:04:04.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (900, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 14:04:45.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (901, N'Contraseña errónea', N'A10001', CAST(N'2019-11-20 14:19:03.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (902, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 14:19:08.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (903, N'Generación recibo 7', N'A10001', CAST(N'2019-11-20 14:28:15.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 32343)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (904, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 14:35:12.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (905, N'Error DVV: Documento', N'-', CAST(N'2019-11-20 14:35:13.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 27744)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (906, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-20 14:35:19.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (907, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 14:35:29.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (908, N'Generación recibo 9', N'A10001', CAST(N'2019-11-20 14:35:37.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 32381)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (909, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 14:35:46.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (910, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 14:40:10.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (911, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 14:40:42.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (912, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 16:17:20.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (913, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 16:17:51.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (914, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 16:18:46.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (915, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 16:22:13.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (916, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 16:26:31.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (917, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 16:28:41.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (918, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 16:30:35.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (919, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 16:46:06.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (920, N'Generación producto C3', N'A10001', CAST(N'2019-11-20 16:50:47.000' AS DateTime), N'BAJA', N'OCZ82uBtIsuqzAoOciuv/A==', 40157)
GO
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (921, N'Generación producto D4', N'A10001', CAST(N'2019-11-20 16:51:03.000' AS DateTime), N'BAJA', N'OCZ82uBtIsuqzAoOciuv/A==', 40200)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (922, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 16:58:28.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (923, N'Asignación conductor DNI: 423423 Pedido: 10', N'A10001', CAST(N'2019-11-20 16:59:16.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 98871)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (924, N'Asignación conductor DNI: 12312  Pedido: 12', N'A10001', CAST(N'2019-11-20 16:59:20.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 98178)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (925, N'Generación conductor x Patente: 67346753', N'A10001', CAST(N'2019-11-20 16:59:42.000' AS DateTime), N'BAJA', N'dbJ3gpe0fOPuZNuMf44t0A==', 91381)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (926, N'Asignación conductor DNI: 12312  Pedido: 14', N'A10001', CAST(N'2019-11-20 16:59:48.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 98264)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (927, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 17:04:54.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (928, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 17:05:46.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (929, N'Generación recibo 10', N'A10001', CAST(N'2019-11-20 17:07:07.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 33766)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (930, N'Generación remito 1', N'A10001', CAST(N'2019-11-20 17:07:31.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 32657)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (931, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 17:08:06.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (932, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 17:20:05.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (933, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 17:22:22.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (934, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 17:24:36.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (935, N'Generación remito 2', N'A10001', CAST(N'2019-11-20 17:24:43.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 32676)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (936, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 17:33:06.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (937, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 17:34:00.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (938, N'Generación remito 3', N'A10001', CAST(N'2019-11-20 17:34:07.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 32695)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (939, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 17:42:43.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (940, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 17:43:26.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (941, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 17:44:05.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (942, N'Generación remito 4', N'A10001', CAST(N'2019-11-20 17:44:21.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 32714)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (943, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 17:46:26.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (944, N'Generación remito 5', N'A10001', CAST(N'2019-11-20 17:46:44.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 32733)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (945, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 17:47:52.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (946, N'Generación remito 6', N'A10001', CAST(N'2019-11-20 17:48:00.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 32752)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (947, N'Generación remito 7', N'A10001', CAST(N'2019-11-20 17:48:07.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 32771)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (948, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 23:29:31.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (949, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 23:45:27.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (950, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 23:46:38.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (951, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 23:47:35.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (952, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-20 23:56:37.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (953, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-21 00:16:56.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (954, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-21 00:18:47.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (955, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-21 00:19:26.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (956, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-21 00:20:18.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (957, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-21 00:21:17.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (958, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-21 00:22:15.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (959, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-21 00:26:40.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (960, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-21 00:28:06.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (961, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-21 00:29:38.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (962, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-21 00:43:05.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (963, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-21 00:44:35.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (964, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-22 20:31:53.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (965, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-22 20:47:13.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (966, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-22 20:51:00.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (967, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-22 21:27:28.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (968, N'Asignación conductor DNI: 12312  Pedido: 7', N'A10001', CAST(N'2019-11-22 21:27:56.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 95703)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (969, N'Deasignación de la patente Crear familia al usuario A10023', N'A10001', CAST(N'2019-11-22 21:56:13.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 182866)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (970, N'Deasignación de la patente Asignar patente-usuario al usuario A10023', N'A10001', CAST(N'2019-11-22 21:56:15.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 250789)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (971, N'Deasignación de la patente Asignar patente-familia al usuario A10023', N'A10001', CAST(N'2019-11-22 21:56:17.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 248339)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (972, N'Deasignación de la patente Desbloquear usuario al usuario A10023', N'A10001', CAST(N'2019-11-22 21:56:17.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 224491)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (973, N'Deasignación de la patente Consutar familia al usuario A10023', N'A10001', CAST(N'2019-11-22 21:56:18.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 202979)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (974, N'Deasignación de la patente Eliminar familia al usuario A10023', N'A10001', CAST(N'2019-11-22 21:56:18.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 202030)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (975, N'Deasignación de la patente Negar patente-usuario al usuario A10023', N'A10001', CAST(N'2019-11-22 21:56:19.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 236410)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (976, N'Deasignación de la patente Restaurar copia de seguridad al usuario A10023', N'A10001', CAST(N'2019-11-22 21:56:20.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 282667)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (977, N'Deasignación de la patente Realizar copia de seguridad al usuario A10023', N'A10001', CAST(N'2019-11-22 21:56:26.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 274475)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (978, N'Deasignación de la patente Consultar bitácora al usuario A10023', N'A10001', CAST(N'2019-11-22 21:56:27.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 221908)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (979, N'Deasignación de la patente Cambiar contraseña al usuario A10023', N'A10001', CAST(N'2019-11-22 21:56:27.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 221625)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (980, N'Deasignación de la patente Cambiar idioma al usuario A10023', N'A10001', CAST(N'2019-11-22 21:56:27.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 188847)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (981, N'Deasignación de la patente Consultar producto al usuario A10023', N'A10001', CAST(N'2019-11-22 21:56:28.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 218424)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (982, N'Deasignación de la patente Crear producto al usuario A10023', N'A10001', CAST(N'2019-11-22 21:56:28.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 191072)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (983, N'Deasignación de la patente Modificar producto al usuario A10023', N'A10001', CAST(N'2019-11-22 21:56:28.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 216937)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (984, N'Deasignación de la patente Bloquear producto
 al usuario A10023', N'A10001', CAST(N'2019-11-22 21:56:29.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 215989)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (985, N'Deasignación de la patente Consultar producto-terminal
 al usuario A10023', N'A10001', CAST(N'2019-11-22 21:56:29.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 286768)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (986, N'Desasignación de familia Administrador de sistema al usuario A10023', N'A10001', CAST(N'2019-11-22 22:00:57.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 242683)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (987, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-23 16:21:05.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (988, N'Asignación de la patente Consultar usuario al usuario A10001', N'A10001', CAST(N'2019-11-23 16:21:13.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 198784)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (989, N'Deasignación de la patente Consultar usuario al usuario A10001', N'A10001', CAST(N'2019-11-23 16:21:15.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 211476)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (990, N'Modificación usuario A10023', N'A10001', CAST(N'2019-11-23 16:23:09.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 50297)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (991, N'Generación usuario A10026', N'A10001', CAST(N'2019-11-23 16:23:57.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 44333)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (992, N'Asignación de la patente Consultar usuario al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:16.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 199202)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (993, N'Asignación de la patente Crear usuario al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:16.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 173178)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (994, N'Asignación de la patente Modificar usuario al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:16.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 197805)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (995, N'Asignación de la patente Bloquear usuario al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:17.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 192149)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (996, N'Asignación de la patente Desbloquear usuario al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:17.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 211601)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (997, N'Asignación de la patente Consutar familia al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:17.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 190778)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (998, N'Asignación de la patente Crear familia al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:17.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 171364)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (999, N'Asignación de la patente Eliminar familia al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:17.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 189889)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1000, N'Asignación de la patente Asignar patente-familia al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:17.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 234839)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1001, N'Asignación de la patente Asignar patente-usuario al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:17.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 237183)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1002, N'Asignación de la patente Negar patente-usuario al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:18.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 223230)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1003, N'Asignación de la patente Restaurar copia de seguridad al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:18.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 268254)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1004, N'Asignación de la patente Realizar copia de seguridad al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:18.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 260313)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1005, N'Asignación de la patente Consultar bitácora al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:18.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 209013)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1006, N'Asignación de la patente Cambiar contraseña al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:18.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 208794)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1007, N'Asignación de la patente Cambiar idioma al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:18.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 177152)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1008, N'Asignación de la patente Consultar producto al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:19.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 205699)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1009, N'Asignación de la patente Crear producto al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:19.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 179259)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1010, N'Asignación de la patente Modificar producto al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:19.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 204302)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1011, N'Asignación de la patente Bloquear producto
 al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:19.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 203477)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1012, N'Asignación de la patente Consultar producto-terminal
 al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:19.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 272220)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1013, N'Asignación de la patente Asignar producto-terminal
 al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:19.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 256480)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1014, N'Asignación de la patente Consultar tanque al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:20.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 192184)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1015, N'Asignación de la patente Crear tanque
 al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:20.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 171468)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1016, N'Asignación de la patente Modificar tanque al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:20.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 190787)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1017, N'Asignación de la patente Bloquear tanque al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:20.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 185253)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1018, N'Asignación de la patente Transferir stock
 al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:20.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 196827)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1019, N'Asignación de la patente Generar remito al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:20.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 178824)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1020, N'Asignación de la patente Generar recibo al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:20.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 177780)
GO
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1021, N'Asignación de la patente Consultar documento al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:21.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 211940)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1022, N'Asignación de la patente Consultar conductor al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:21.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 212066)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1023, N'Asignación de la patente Crear conductor al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:21.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 185238)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1024, N'Asignación de la patente Modificar conductor al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:21.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 210669)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1025, N'Asignación de la patente Bloquear conductor al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:21.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 204812)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1026, N'Asignación de la patente Consultar pedidos pendientes
 al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:22.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 278221)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1027, N'Asignación de la patente Asignar conductor al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:22.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 200515)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1028, N'Asignación de la patente Blanquear contraseña al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:23.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 223000)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1029, N'Asignación de la patente Asignar familia-usuario al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:23.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 236074)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1030, N'Asignación de la patente Recalcular digito verificador al usuario A10026', N'A10001', CAST(N'2019-11-23 16:25:24.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 278969)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1031, N'Bloqueo al usuario A10001', N'A10001', CAST(N'2019-11-23 16:25:40.000' AS DateTime), N'MEDIA', N'iW64F91246JSDQsp1CztXQ==', 45325)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1032, N'Bloqueo al usuario A10023', N'A10001', CAST(N'2019-11-23 16:25:53.000' AS DateTime), N'MEDIA', N'iW64F91246JSDQsp1CztXQ==', 45423)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1033, N'Se eliminó la familia cvvvdfg', N'A10001', CAST(N'2019-11-23 16:26:17.000' AS DateTime), N'MEDIA', N'/iEIDrAVuXe+dC0X3hyaIg==', 67015)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1034, N'Se eliminó la familia sdfsdfds', N'A10001', CAST(N'2019-11-23 16:26:21.000' AS DateTime), N'MEDIA', N'/iEIDrAVuXe+dC0X3hyaIg==', 70495)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1035, N'Se eliminó la familia dsfsfsdfsd', N'A10001', CAST(N'2019-11-23 16:26:24.000' AS DateTime), N'MEDIA', N'/iEIDrAVuXe+dC0X3hyaIg==', 78621)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1036, N'Se eliminó la familia pruuue', N'A10001', CAST(N'2019-11-23 16:26:28.000' AS DateTime), N'MEDIA', N'/iEIDrAVuXe+dC0X3hyaIg==', 63952)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1037, N'Se eliminó la familia PRUEBA', N'A10001', CAST(N'2019-11-23 16:26:31.000' AS DateTime), N'MEDIA', N'/iEIDrAVuXe+dC0X3hyaIg==', 58015)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1038, N'Se eliminó la familia Otra Otra Prueba', N'A10001', CAST(N'2019-11-23 16:26:35.000' AS DateTime), N'MEDIA', N'/iEIDrAVuXe+dC0X3hyaIg==', 98699)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1039, N'Se eliminó la familia Otra prueba', N'A10001', CAST(N'2019-11-23 16:26:38.000' AS DateTime), N'MEDIA', N'/iEIDrAVuXe+dC0X3hyaIg==', 80238)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1040, N'Se eliminó la familia Administrador de sistema', N'A10001', CAST(N'2019-11-23 16:26:41.000' AS DateTime), N'MEDIA', N'/iEIDrAVuXe+dC0X3hyaIg==', 140797)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1041, N'Se eliminó la familia Operador de terminal', N'A10001', CAST(N'2019-11-23 16:26:43.000' AS DateTime), N'MEDIA', N'/iEIDrAVuXe+dC0X3hyaIg==', 119641)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1042, N'Se eliminó la familia Jefe de producto', N'A10001', CAST(N'2019-11-23 16:26:44.000' AS DateTime), N'MEDIA', N'/iEIDrAVuXe+dC0X3hyaIg==', 100483)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1043, N'Se eliminó la familia Jefe de terminal', N'A10001', CAST(N'2019-11-23 16:26:46.000' AS DateTime), N'MEDIA', N'/iEIDrAVuXe+dC0X3hyaIg==', 99755)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1044, N'Se eliminó la familia Prueba', N'A10001', CAST(N'2019-11-23 16:26:48.000' AS DateTime), N'MEDIA', N'/iEIDrAVuXe+dC0X3hyaIg==', 62175)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1045, N'Usuario bloqueado', N'A10001', CAST(N'2019-11-23 16:27:41.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 31087)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1046, N'Ingreso a aplicación', N'A10026', CAST(N'2019-11-23 16:27:53.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38242)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1047, N'Ingreso a aplicación', N'A10026', CAST(N'2019-11-23 16:28:34.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38242)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1048, N'Deasignación de la patente Consultar usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 16:28:55.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 212382)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1049, N'Asignación de la patente Consultar usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 16:29:01.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 199662)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1050, N'Ingreso a aplicación', N'A10026', CAST(N'2019-11-23 16:29:57.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38242)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1051, N'Cambio de idioma', N'A10026', CAST(N'2019-11-23 16:30:04.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 25600)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1052, N'Ingreso a aplicación', N'A10026', CAST(N'2019-11-23 16:30:17.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38242)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1053, N'Deasignación de la patente Consultar usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 16:30:28.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 212382)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1054, N'Asignación de la patente Consultar usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 16:30:29.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 199662)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1055, N'Usuario bloqueado', N'A10001', CAST(N'2019-11-23 16:33:40.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 31087)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1056, N'Ingreso a aplicación', N'A10026', CAST(N'2019-11-23 16:33:48.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38242)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1057, N'Deasignación de la patente Consultar usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 16:35:34.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 212382)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1058, N'Asignación de la patente Consultar usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 16:35:39.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 199662)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1059, N'Deasignación de la patente Consultar usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 16:36:07.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 212382)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1060, N'Asignación de la patente Consultar usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 16:36:09.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 199662)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1061, N'Deasignación de la patente Consultar usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 16:40:25.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 212382)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1062, N'Ingreso a aplicación', N'A10026', CAST(N'2019-11-23 16:48:48.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38242)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1063, N'Modificación de contraseña', N'A10026', CAST(N'2019-11-23 16:48:56.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 58195)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1064, N'Usuario bloqueado', N'A10001', CAST(N'2019-11-23 16:50:43.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 31087)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1065, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-23 16:51:12.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1066, N'Ingreso a aplicación', N'A10026', CAST(N'2019-11-23 16:52:36.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38242)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1067, N'Error DVH: UsuarioPatente-A10026/Consultar usuario', N'-', CAST(N'2019-11-23 16:52:37.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 135781)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1068, N'Recálculo de dígitos verificadores', N'A10026', CAST(N'2019-11-23 16:52:40.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86664)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1069, N'Bloqueo al usuario A10001', N'A10026', CAST(N'2019-11-23 16:52:50.000' AS DateTime), N'MEDIA', N'iW64F91246JSDQsp1CztXQ==', 45540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1070, N'Generación familia Prueba', N'A10026', CAST(N'2019-11-23 16:53:36.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 50423)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1071, N'Asignación de la patente Crear usuario a la familia Prueba', N'A10026', CAST(N'2019-11-23 16:53:53.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 196472)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1072, N'Asignación de familia Prueba al usuario A10026', N'A10026', CAST(N'2019-11-23 16:54:39.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 120747)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1073, N'Ingreso a aplicación', N'A10026', CAST(N'2019-11-23 17:02:22.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38242)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1074, N'Error DVV: FamiliaPatente', N'-', CAST(N'2019-11-23 17:02:23.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 40572)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1075, N'Ingreso a aplicación', N'A10026', CAST(N'2019-11-23 17:02:41.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38242)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1076, N'Error DVV: FamiliaPatente', N'-', CAST(N'2019-11-23 17:02:41.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 40572)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1077, N'Recálculo de dígitos verificadores', N'A10026', CAST(N'2019-11-23 17:02:43.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86664)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1078, N'Deasignación de la patente Crear usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 17:02:52.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 185406)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1079, N'Deasignación de la patente Consultar usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 17:02:53.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 212382)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1080, N'Asignación de la patente Consultar usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 17:02:58.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 199662)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1081, N'Deasignación de la patente Negar patente-usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 17:04:14.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 237110)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1082, N'Asignación de la patente Negar patente-usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 17:04:16.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 223718)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1083, N'Deasignación de la patente Blanquear contraseña al usuario A10026', N'A10026', CAST(N'2019-11-23 17:04:19.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 236987)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1084, N'Negación de patente Consultar usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 17:04:53.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 170510)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1085, N'Desnegación de la patente Consultar usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 17:04:55.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 205947)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1086, N'Negación de patente Consultar usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 17:04:56.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 170510)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1087, N'Desnegación de la patente Consultar usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 17:04:57.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 205947)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1088, N'Asignación de la patente Blanquear contraseña al usuario A10026', N'A10026', CAST(N'2019-11-23 17:05:04.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 223481)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1089, N'Asignación de la patente Consultar usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 17:05:05.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 199662)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1090, N'Deasignación de la patente Consultar bitácora al usuario A10026', N'A10026', CAST(N'2019-11-23 17:09:36.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 222578)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1091, N'Asignación de la patente Crear usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 17:09:38.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 173610)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1092, N'Asignación de la patente Consultar bitácora al usuario A10026', N'A10026', CAST(N'2019-11-23 17:09:39.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 209480)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1093, N'Ingreso a aplicación', N'A10026', CAST(N'2019-11-23 17:10:27.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38242)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1094, N'Asignación de la patente Consultar usuario a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:10:48.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 224000)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1095, N'Asignación de la patente Modificar usuario a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:10:48.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 222603)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1096, N'Asignación de la patente Bloquear usuario a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:10:49.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 216571)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1097, N'Asignación de la patente Desbloquear usuario a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:10:49.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 237151)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1098, N'Asignación de la patente Consutar familia a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:10:49.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 215200)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1099, N'Asignación de la patente Crear familia a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:10:49.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 194658)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1100, N'Asignación de la patente Eliminar familia a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:10:49.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 214311)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1101, N'Asignación de la patente Asignar patente-familia a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:10:50.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 261893)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1102, N'Asignación de la patente Asignar patente-usuario a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:10:50.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 264237)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1103, N'Asignación de la patente Negar patente-usuario a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:10:50.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 249532)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1104, N'Asignación de la patente Restaurar copia de seguridad a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:10:50.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 297188)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1105, N'Asignación de la patente Realizar copia de seguridad a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:10:50.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 288871)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1106, N'Asignación de la patente Consultar bitácora a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:10:51.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 234187)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1107, N'Usuario bloqueado', N'A10001', CAST(N'2019-11-23 17:11:23.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 31087)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1108, N'Ingreso a aplicación', N'A10026', CAST(N'2019-11-23 17:11:29.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38242)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1109, N'Error DVV: FamiliaPatente', N'-', CAST(N'2019-11-23 17:11:30.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 40572)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1110, N'Recálculo de dígitos verificadores', N'A10026', CAST(N'2019-11-23 17:11:33.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86664)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1111, N'Ingreso a aplicación', N'A10026', CAST(N'2019-11-23 17:40:01.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38242)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1112, N'Deasignación de la patente Bloquear usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 17:42:24.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 205066)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1113, N'Deasignación de la patente Recalcular digito verificador al usuario A10026', N'A10026', CAST(N'2019-11-23 17:44:03.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 294491)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1114, N'Ingreso a aplicación', N'A10026', CAST(N'2019-11-23 17:46:01.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38242)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1115, N'Ingreso a aplicación', N'A10026', CAST(N'2019-11-23 17:47:14.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38242)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1116, N'Asignación de la patente Bloquear usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 17:47:24.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 192602)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1117, N'Asignación de la patente Recalcular digito verificador al usuario A10026', N'A10026', CAST(N'2019-11-23 17:47:25.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 279513)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1118, N'Asignación de la patente Cambiar contraseña a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:47:34.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 233968)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1119, N'Asignación de la patente Cambiar idioma a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:47:35.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 200822)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1120, N'Asignación de la patente Consultar producto a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:47:35.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 230873)
GO
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1121, N'Asignación de la patente Crear producto a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:47:35.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 202929)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1122, N'Asignación de la patente Modificar producto a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:47:35.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 229476)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1123, N'Asignación de la patente Bloquear producto
 a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:47:36.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 229027)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1124, N'Asignación de la patente Consultar producto-terminal
 a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:47:36.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 301530)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1125, N'Asignación de la patente Asignar producto-terminal
 a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:47:36.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 285038)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1126, N'Asignación de la patente Consultar tanque a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:47:36.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 216606)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1127, N'Asignación de la patente Crear tanque
 a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:47:36.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 195138)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1128, N'Asignación de la patente Modificar tanque a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:47:36.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 215209)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1129, N'Asignación de la patente Bloquear tanque a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:47:37.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 209299)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1130, N'Asignación de la patente Transferir stock
 a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:47:37.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 222001)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1131, N'Asignación de la patente Generar remito a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:47:37.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 202494)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1132, N'Asignación de la patente Generar recibo a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:47:37.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 201450)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1133, N'Asignación de la patente Consultar documento a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:47:37.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 237490)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1134, N'Asignación de la patente Consultar conductor a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:47:37.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 237616)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1135, N'Asignación de la patente Crear conductor a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:47:38.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 209284)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1136, N'Asignación de la patente Modificar conductor a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:47:38.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 236219)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1137, N'Asignación de la patente Bloquear conductor a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:47:38.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 229986)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1138, N'Asignación de la patente Consultar pedidos pendientes
 a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:47:38.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 307907)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1139, N'Asignación de la patente Asignar conductor a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:47:38.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 225689)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1140, N'Asignación de la patente Blanquear contraseña a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:47:39.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 248926)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1141, N'Asignación de la patente Asignar familia-usuario a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:47:39.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 263128)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1142, N'Asignación de la patente Recalcular digito verificador a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:47:39.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 308279)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1143, N'Deasignación de la patente Asignar familia-usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 17:47:52.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 250340)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1144, N'Asignación de la patente Asignar familia-usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 17:47:55.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 236576)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1145, N'Deasignación de la patente Consultar usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 17:47:58.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 212382)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1146, N'Deasignación de la patente Crear usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 17:47:59.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 185406)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1147, N'Deasignación de la patente Modificar usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 17:47:59.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 210895)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1148, N'Asignación de la patente Consultar usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 17:48:00.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 199662)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1149, N'Asignación de la patente Crear usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 17:48:00.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 173610)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1150, N'Asignación de la patente Modificar usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 17:48:00.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 198265)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1151, N'Desasignación de la patente Consultar usuario a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:14.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 244381)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1152, N'Desasignación de la patente Crear usuario a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:14.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 215467)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1153, N'Desasignación de la patente Modificar usuario a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:15.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 242849)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1154, N'Desasignación de la patente Bloquear usuario a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:15.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 236568)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1155, N'Desasignación de la patente Desbloquear usuario a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:15.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 258096)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1156, N'Desasignación de la patente Consutar familia a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:15.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 235098)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1157, N'Desasignación de la patente Crear familia a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:15.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 213494)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1158, N'Desasignación de la patente Eliminar familia a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:16.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 234119)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1159, N'Desasignación de la patente Asignar patente-familia a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:16.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 283771)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1160, N'Desasignación de la patente Asignar patente-usuario a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:16.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 286274)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1161, N'Desasignación de la patente Negar patente-usuario a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:17.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 270921)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1162, N'Desasignación de la patente Restaurar copia de seguridad a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:17.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 320458)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1163, N'Desasignación de la patente Realizar copia de seguridad a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:17.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 311760)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1164, N'Desasignación de la patente Consultar bitácora a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:17.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 255135)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1165, N'Desasignación de la patente Cambiar contraseña a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:17.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 254820)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1166, N'Desasignación de la patente Cambiar idioma a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:18.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 219952)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1167, N'Desasignación de la patente Consultar producto a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:18.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 251566)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1168, N'Desasignación de la patente Crear producto a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:18.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 222236)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1169, N'Desasignación de la patente Modificar producto a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:18.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 250034)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1170, N'Desasignación de la patente Bloquear producto
 a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:19.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 249405)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1171, N'Desasignación de la patente Consultar producto-terminal
 a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:19.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 325007)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1172, N'Desasignación de la patente Asignar producto-terminal
 a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:19.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 307777)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1173, N'Desasignación de la patente Consultar tanque a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:19.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 236621)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1174, N'Desasignación de la patente Crear tanque
 a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:19.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 213836)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1175, N'Desasignación de la patente Modificar tanque a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:20.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 235089)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1176, N'Desasignación de la patente Bloquear tanque a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:20.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 228930)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1177, N'Desasignación de la patente Transferir stock
 a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:20.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 242070)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1178, N'Desasignación de la patente Generar remito a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:20.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 221774)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1179, N'Desasignación de la patente Generar recibo a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:20.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 220646)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1180, N'Desasignación de la patente Consultar documento a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:21.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 258465)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1181, N'Desasignación de la patente Consultar conductor a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:21.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 258600)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1182, N'Desasignación de la patente Crear conductor a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:21.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 228882)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1183, N'Desasignación de la patente Modificar conductor a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:21.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 257068)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1184, N'Desasignación de la patente Bloquear conductor a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:21.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 250586)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1185, N'Desasignación de la patente Consultar pedidos pendientes
 a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:22.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 331570)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1186, N'Desasignación de la patente Asignar conductor a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:22.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 245974)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1187, N'Desasignación de la patente Blanquear contraseña a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:22.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 270486)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1188, N'Desasignación de la patente Asignar familia-usuario a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:22.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 285075)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1189, N'Desasignación de la patente Recalcular digito verificador a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:22.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 332047)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1190, N'Asignación de la patente Crear usuario a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:48:41.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 196472)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1191, N'Deasignación de la patente Crear usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 17:48:47.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 185406)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1192, N'Asignación de la patente Crear usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 17:48:50.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 173610)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1193, N'Negación de patente Crear usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 17:48:55.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 146768)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1194, N'Desnegación de la patente Crear usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 17:49:02.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 179433)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1195, N'Ingreso a aplicación', N'A10026', CAST(N'2019-11-23 17:57:20.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38242)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1196, N'Error DVV: FamiliaPatente', N'-', CAST(N'2019-11-23 17:57:21.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 40572)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1197, N'Recálculo de dígitos verificadores', N'A10026', CAST(N'2019-11-23 17:57:25.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86664)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1198, N'Asignación de la patente Crear usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 17:57:50.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 173610)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1199, N'Deasignación de la patente Crear usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 17:57:52.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 185406)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1200, N'Asignación de la patente Crear usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 17:57:57.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 173610)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1201, N'Asignación de la patente Consutar familia a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:58:10.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 215200)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1202, N'Deasignación de la patente Consutar familia al usuario A10026', N'A10026', CAST(N'2019-11-23 17:58:19.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 203629)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1203, N'Asignación de la patente Consutar familia al usuario A10026', N'A10026', CAST(N'2019-11-23 17:58:49.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 191231)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1204, N'Desasignación de la patente Crear usuario a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:58:56.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 215467)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1205, N'Asignación de la patente Crear usuario a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:59:02.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 196472)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1206, N'Desasignación de la patente Consutar familia a la familia Prueba', N'A10026', CAST(N'2019-11-23 17:59:03.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 235098)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1207, N'Deasignación de la patente Crear usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 17:59:28.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 185406)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1208, N'Generación usuario A10027', N'A10026', CAST(N'2019-11-23 18:00:52.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 44573)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1209, N'Asignación de la patente Crear usuario al usuario A10027', N'A10026', CAST(N'2019-11-23 18:02:02.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 173666)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1210, N'Desasignación de la patente Crear usuario a la familia Prueba', N'A10026', CAST(N'2019-11-23 18:02:27.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 215467)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1211, N'Desasignación de familia Prueba al usuario A10026', N'A10026', CAST(N'2019-11-23 18:02:45.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 135752)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1212, N'Se eliminó la familia Prueba', N'A10026', CAST(N'2019-11-23 18:02:56.000' AS DateTime), N'MEDIA', N'/iEIDrAVuXe+dC0X3hyaIg==', 62411)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1213, N'Asignación de la patente Crear usuario al usuario A10026', N'A10026', CAST(N'2019-11-23 18:03:41.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 173610)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1214, N'Negación de patente Crear usuario al usuario A10027', N'A10026', CAST(N'2019-11-23 18:03:50.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 146819)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1215, N'Bloqueo al usuario A10027', N'A10026', CAST(N'2019-11-23 18:04:05.000' AS DateTime), N'MEDIA', N'iW64F91246JSDQsp1CztXQ==', 45738)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1216, N'Modificación usuario A10027', N'A10026', CAST(N'2019-11-23 18:04:50.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 50634)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1217, N'Modificación usuario A10026', N'A10026', CAST(N'2019-11-23 18:06:30.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 50607)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1218, N'Generación usuario A10028', N'A10026', CAST(N'2019-11-23 18:07:06.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 44598)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1219, N'Asignación de la patente Consultar usuario al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:00.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 199782)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1220, N'Asignación de la patente Crear usuario al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:00.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 173722)
GO
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1221, N'Asignación de la patente Modificar usuario al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:00.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 198385)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1222, N'Asignación de la patente Bloquear usuario al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:00.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 192720)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1223, N'Asignación de la patente Desbloquear usuario al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:00.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 212199)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1224, N'Asignación de la patente Consutar familia al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:01.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 191349)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1225, N'Asignación de la patente Crear familia al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:01.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 171908)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1226, N'Asignación de la patente Eliminar familia al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:01.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 190460)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1227, N'Asignación de la patente Asignar patente-familia al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:01.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 235473)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1228, N'Asignación de la patente Asignar patente-usuario al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:01.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 237817)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1229, N'Asignación de la patente Negar patente-usuario al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:01.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 223846)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1230, N'Asignación de la patente Restaurar copia de seguridad al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:01.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 268933)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1231, N'Asignación de la patente Realizar copia de seguridad al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:02.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 260983)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1232, N'Asignación de la patente Consultar bitácora al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:02.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 209602)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1233, N'Asignación de la patente Cambiar contraseña al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:02.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 209383)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1234, N'Asignación de la patente Cambiar idioma al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:02.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 177705)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1235, N'Asignación de la patente Consultar producto al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:02.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 206288)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1236, N'Asignación de la patente Crear producto al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:02.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 179812)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1237, N'Asignación de la patente Modificar producto al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:03.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 204891)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1238, N'Asignación de la patente Bloquear producto
 al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:03.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 204075)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1239, N'Asignación de la patente Consultar producto-terminal
 al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:03.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 272908)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1240, N'Asignación de la patente Asignar producto-terminal
 al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:03.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 257150)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1241, N'Asignación de la patente Consultar tanque al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:03.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 192755)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1242, N'Asignación de la patente Crear tanque
 al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:03.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 172021)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1243, N'Asignación de la patente Modificar tanque al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:04.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 191358)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1244, N'Asignación de la patente Bloquear tanque al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:04.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 185815)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1245, N'Asignación de la patente Transferir stock
 al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:04.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 197416)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1246, N'Asignación de la patente Generar remito al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:04.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 179377)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1247, N'Asignación de la patente Generar recibo al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:04.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 178333)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1248, N'Asignación de la patente Consultar documento al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:04.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 212538)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1249, N'Asignación de la patente Consultar conductor al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:05.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 212664)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1250, N'Asignación de la patente Crear conductor al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:05.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 185800)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1251, N'Asignación de la patente Modificar conductor al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:05.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 211267)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1252, N'Asignación de la patente Bloquear conductor al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:05.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 205401)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1253, N'Asignación de la patente Consultar pedidos pendientes
 al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:05.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 278918)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1254, N'Asignación de la patente Asignar conductor al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:05.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 201104)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1255, N'Asignación de la patente Blanquear contraseña al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:06.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 223607)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1256, N'Asignación de la patente Asignar familia-usuario al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:06.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 236708)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1257, N'Asignación de la patente Recalcular digito verificador al usuario A10028', N'A10026', CAST(N'2019-11-23 18:10:06.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 279657)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1258, N'Desbloqueo al usuario A10026', N'A10026', CAST(N'2019-11-23 18:10:19.000' AS DateTime), N'MEDIA', N'iW64F91246JSDQsp1CztXQ==', 54808)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1259, N'Bloqueo al usuario A10026', N'A10026', CAST(N'2019-11-23 18:10:23.000' AS DateTime), N'MEDIA', N'iW64F91246JSDQsp1CztXQ==', 45713)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1260, N'Generación familia Prueba', N'A10026', CAST(N'2019-11-23 18:11:35.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 50423)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1261, N'Asignación de la patente Consutar familia a la familia Prueba', N'A10026', CAST(N'2019-11-23 18:11:57.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 215200)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1262, N'Asignación de familia Prueba al usuario A10028', N'A10026', CAST(N'2019-11-23 18:12:28.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 120839)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1263, N'Deasignación de la patente Consutar familia al usuario A10028', N'A10026', CAST(N'2019-11-23 18:13:10.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 203751)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1264, N'Generación usuario A10029', N'A10026', CAST(N'2019-11-23 18:15:03.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 44623)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1265, N'Asignación de la patente Consutar familia al usuario A10029', N'A10026', CAST(N'2019-11-23 18:15:23.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 191408)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1266, N'Desasignación de la patente Consutar familia a la familia Prueba', N'A10026', CAST(N'2019-11-23 18:15:37.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 235098)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1267, N'Desasignación de familia Prueba al usuario A10028', N'A10026', CAST(N'2019-11-23 18:18:54.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 135850)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1268, N'Se eliminó la familia Prueba', N'A10026', CAST(N'2019-11-23 18:19:36.000' AS DateTime), N'MEDIA', N'/iEIDrAVuXe+dC0X3hyaIg==', 62411)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1269, N'Negación de patente Eliminar familia al usuario A10029', N'A10026', CAST(N'2019-11-23 18:20:02.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 162307)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1270, N'Desnegación de la patente Eliminar familia al usuario A10029', N'A10026', CAST(N'2019-11-23 18:20:03.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 196616)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1271, N'Asignación de la patente Consutar familia al usuario A10028', N'A10026', CAST(N'2019-11-23 18:20:10.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 191349)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1272, N'Deasignación de la patente Consutar familia al usuario A10029', N'A10026', CAST(N'2019-11-23 18:20:43.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 203812)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1273, N'Usuario bloqueado', N'A10026', CAST(N'2019-11-23 19:10:37.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 31246)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1274, N'Usuario bloqueado', N'A10001', CAST(N'2019-11-23 19:10:42.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 31087)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1275, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-23 19:11:13.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1276, N'Ingreso a aplicación', N'A10029', CAST(N'2019-11-23 19:11:43.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38320)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1277, N'Ingreso a aplicación', N'A10028', CAST(N'2019-11-23 19:12:09.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38294)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1278, N'Generación familia Prueba', N'A10028', CAST(N'2019-11-23 19:12:34.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 50485)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1279, N'Asignación de la patente Consultar usuario al usuario A10001', N'A10028', CAST(N'2019-11-23 19:12:40.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 199376)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1280, N'Asignación de la patente Crear usuario al usuario A10001', N'A10028', CAST(N'2019-11-23 19:12:40.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 173344)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1281, N'Asignación de la patente Modificar usuario al usuario A10001', N'A10028', CAST(N'2019-11-23 19:12:40.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 197979)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1282, N'Asignación de la patente Bloquear usuario al usuario A10001', N'A10028', CAST(N'2019-11-23 19:12:40.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 192321)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1283, N'Asignación de la patente Desbloquear usuario al usuario A10001', N'A10028', CAST(N'2019-11-23 19:12:41.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 211779)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1284, N'Asignación de la patente Consutar familia al usuario A10001', N'A10028', CAST(N'2019-11-23 19:12:41.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 190950)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1285, N'Asignación de la patente Crear familia al usuario A10001', N'A10028', CAST(N'2019-11-23 19:12:41.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 171530)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1286, N'Asignación de la patente Eliminar familia al usuario A10001', N'A10028', CAST(N'2019-11-23 19:12:41.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 190061)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1287, N'Asignación de la patente Asignar patente-familia al usuario A10001', N'A10028', CAST(N'2019-11-23 19:12:41.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 235025)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1288, N'Asignación de la patente Asignar patente-usuario al usuario A10001', N'A10028', CAST(N'2019-11-23 19:12:41.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 237369)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1289, N'Asignación de la patente Negar patente-usuario al usuario A10001', N'A10028', CAST(N'2019-11-23 19:12:42.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 223412)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1290, N'Asignación de la patente Restaurar copia de seguridad al usuario A10001', N'A10028', CAST(N'2019-11-23 19:12:42.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 268450)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1291, N'Asignación de la patente Realizar copia de seguridad al usuario A10001', N'A10028', CAST(N'2019-11-23 19:12:42.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 260507)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1292, N'Asignación de la patente Consultar bitácora al usuario A10001', N'A10028', CAST(N'2019-11-23 19:12:42.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 209189)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1293, N'Asignación de la patente Cambiar contraseña al usuario A10001', N'A10028', CAST(N'2019-11-23 19:12:42.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 208970)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1294, N'Asignación de la patente Cambiar idioma al usuario A10001', N'A10028', CAST(N'2019-11-23 19:12:42.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 177320)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1295, N'Asignación de la patente Consultar producto al usuario A10001', N'A10028', CAST(N'2019-11-23 19:12:43.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 205875)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1296, N'Asignación de la patente Bloquear producto
 al usuario A10001', N'A10028', CAST(N'2019-11-23 19:12:43.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 203655)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1297, N'Asignación de la patente Consultar producto-terminal
 al usuario A10001', N'A10028', CAST(N'2019-11-23 19:12:43.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 272418)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1298, N'Asignación de la patente Consultar tanque al usuario A10001', N'A10028', CAST(N'2019-11-23 19:12:43.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 192356)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1299, N'Asignación de la patente Crear tanque
 al usuario A10001', N'A10028', CAST(N'2019-11-23 19:12:43.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 171636)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1300, N'Asignación de la patente Modificar tanque al usuario A10001', N'A10028', CAST(N'2019-11-23 19:12:43.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 190959)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1301, N'Asignación de la patente Bloquear tanque al usuario A10001', N'A10028', CAST(N'2019-11-23 19:12:44.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 185423)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1302, N'Asignación de la patente Generar remito al usuario A10001', N'A10028', CAST(N'2019-11-23 19:12:44.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 178992)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1303, N'Asignación de la patente Generar recibo al usuario A10001', N'A10028', CAST(N'2019-11-23 19:12:44.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 177948)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1304, N'Asignación de la patente Consultar documento al usuario A10001', N'A10028', CAST(N'2019-11-23 19:12:44.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 212118)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1305, N'Asignación de la patente Consultar conductor al usuario A10001', N'A10028', CAST(N'2019-11-23 19:12:44.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 212244)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1306, N'Asignación de la patente Bloquear conductor al usuario A10001', N'A10028', CAST(N'2019-11-23 19:12:44.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 204988)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1307, N'Asignación de la patente Consultar pedidos pendientes
 al usuario A10001', N'A10028', CAST(N'2019-11-23 19:12:45.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 278421)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1308, N'Asignación de la patente Asignar familia-usuario al usuario A10001', N'A10028', CAST(N'2019-11-23 19:12:45.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 236260)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1309, N'Asignación de la patente Recalcular digito verificador al usuario A10001', N'A10028', CAST(N'2019-11-23 19:12:45.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 279167)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1310, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-23 19:13:07.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1311, N'Asignación de la patente Consultar usuario a la familia Prueba', N'A10001', CAST(N'2019-11-23 19:13:15.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 223526)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1312, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-23 19:13:23.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1313, N'Error DVV: FamiliaPatente', N'-', CAST(N'2019-11-23 19:13:23.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 40572)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1314, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-23 19:13:29.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1315, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-23 19:14:19.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1316, N'Asignación de la patente Crear usuario a la familia Prueba', N'A10001', CAST(N'2019-11-23 19:14:25.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 196026)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1317, N'Asignación de la patente Modificar usuario a la familia Prueba', N'A10001', CAST(N'2019-11-23 19:14:25.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 222129)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1318, N'Asignación de la patente Bloquear usuario a la familia Prueba', N'A10001', CAST(N'2019-11-23 19:14:25.000' AS DateTime), N'BAJA', N'/iEIDrAVuXe+dC0X3hyaIg==', 216104)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1319, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-23 19:14:33.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1320, N'Se eliminó la familia Prueba', N'A10001', CAST(N'2019-11-23 19:14:39.000' AS DateTime), N'MEDIA', N'/iEIDrAVuXe+dC0X3hyaIg==', 62175)
GO
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1321, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 13:32:05.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1322, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 13:34:50.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1323, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 13:44:20.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1324, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 13:44:58.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1325, N'Error DVH: Documento - AA 4001', N'-', CAST(N'2019-11-24 13:44:59.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 42993)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1326, N'Error DVH: Documento - TK2 4001', N'-', CAST(N'2019-11-24 13:44:59.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 45563)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1327, N'Error DVH: Documento - TK8 4004', N'-', CAST(N'2019-11-24 13:44:59.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 45812)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1328, N'Error DVH: Documento - TANK2 4004', N'-', CAST(N'2019-11-24 13:44:59.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 50693)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1329, N'Error DVH: Documento - AAA8 4001', N'-', CAST(N'2019-11-24 13:44:59.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 47323)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1330, N'Error DVH: Documento - TK1 4001', N'-', CAST(N'2019-11-24 13:44:59.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 45537)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1331, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 13:46:30.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1332, N'Error DVH: Documento - RC 0', N'-', CAST(N'2019-11-24 13:46:31.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38132)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1333, N'Error DVH: Documento - RM 0', N'-', CAST(N'2019-11-24 13:46:31.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38382)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1334, N'Error DVH: Documento - RC 1', N'-', CAST(N'2019-11-24 13:46:31.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38159)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1335, N'Error DVH: Documento - RM 1', N'-', CAST(N'2019-11-24 13:46:31.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38409)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1336, N'Error DVH: Documento - RC 2', N'-', CAST(N'2019-11-24 13:46:31.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38186)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1337, N'Error DVH: Documento - RM 2', N'-', CAST(N'2019-11-24 13:46:31.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38436)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1338, N'Error DVH: Documento - RC 3', N'-', CAST(N'2019-11-24 13:46:31.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38213)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1339, N'Error DVH: Documento - RM 3', N'-', CAST(N'2019-11-24 13:46:31.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38463)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1340, N'Error DVH: Documento - RC 4', N'-', CAST(N'2019-11-24 13:46:31.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38240)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1341, N'Error DVH: Documento - RM 4', N'-', CAST(N'2019-11-24 13:46:31.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38490)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1342, N'Error DVH: Documento - RC 5', N'-', CAST(N'2019-11-24 13:46:31.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38267)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1343, N'Error DVH: Documento - RM 5', N'-', CAST(N'2019-11-24 13:46:31.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38517)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1344, N'Error DVH: Documento - RC 6', N'-', CAST(N'2019-11-24 13:46:31.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38294)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1345, N'Error DVH: Documento - RM 6', N'-', CAST(N'2019-11-24 13:46:31.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38544)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1346, N'Error DVH: Documento - RC 7', N'-', CAST(N'2019-11-24 13:46:31.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38321)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1347, N'Error DVH: Documento - RM 7', N'-', CAST(N'2019-11-24 13:46:31.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38571)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1348, N'Error DVH: Documento - RC 8', N'-', CAST(N'2019-11-24 13:46:31.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38348)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1349, N'Error DVH: Documento - RC 9', N'-', CAST(N'2019-11-24 13:46:31.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38375)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1350, N'Error DVH: Documento - RC 10', N'-', CAST(N'2019-11-24 13:46:31.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 39838)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1351, N'Error DVH: Tanque - AA 4001', N'-', CAST(N'2019-11-24 13:46:31.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 34412)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1352, N'Error DVH: Tanque - AAA8 4001', N'-', CAST(N'2019-11-24 13:46:31.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38379)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1353, N'Error DVH: Tanque - TK1 4001', N'-', CAST(N'2019-11-24 13:46:31.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 36722)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1354, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 13:47:43.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1355, N'Error DVH: Tanque - AA 4001', N'-', CAST(N'2019-11-24 13:47:44.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 34412)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1356, N'Error DVH: Tanque - AAA8 4001', N'-', CAST(N'2019-11-24 13:47:44.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38379)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1357, N'Error DVH: Tanque - TK1 4001', N'-', CAST(N'2019-11-24 13:47:44.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 36722)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1358, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 13:50:10.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1359, N'Error DVH: Tanque - AA 4001', N'-', CAST(N'2019-11-24 13:50:11.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 34412)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1360, N'Error DVH: Tanque - AAA8 4001', N'-', CAST(N'2019-11-24 13:50:11.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38379)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1361, N'Error DVH: Tanque - TK1 4001', N'-', CAST(N'2019-11-24 13:50:11.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 36722)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1362, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-24 13:50:13.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1363, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 14:03:48.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1364, N'Error DVH: Tanque - AA 4001', N'-', CAST(N'2019-11-24 14:03:49.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 34412)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1365, N'Error DVH: Tanque - AAA8 4001', N'-', CAST(N'2019-11-24 14:03:49.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38379)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1366, N'Error DVH: Tanque - TK1 4001', N'-', CAST(N'2019-11-24 14:03:49.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 36722)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1367, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-24 14:03:54.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1368, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 14:04:00.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1369, N'Error DVH: Tanque - AA 4001', N'-', CAST(N'2019-11-24 14:04:01.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 34412)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1370, N'Error DVH: Tanque - AAA8 4001', N'-', CAST(N'2019-11-24 14:04:01.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38379)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1371, N'Error DVH: Tanque - TK1 4001', N'-', CAST(N'2019-11-24 14:04:01.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 36722)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1372, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 14:06:08.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1373, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 14:16:59.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1374, N'Error DVH: Tanque - AA 4001', N'-', CAST(N'2019-11-24 14:17:02.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 34412)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1375, N'Error DVH: Tanque - AAA8 4001', N'-', CAST(N'2019-11-24 14:17:02.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38379)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1376, N'Error DVH: Tanque - TK1 4001', N'-', CAST(N'2019-11-24 14:17:02.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 36722)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1377, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-24 14:17:05.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1378, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 14:17:11.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1379, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 14:28:39.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1380, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 14:32:17.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1381, N'Error DVH: Tanque - AAA8 4001', N'-', CAST(N'2019-11-24 14:32:18.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38379)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1382, N'Error DVV: Tanque', N'-', CAST(N'2019-11-24 14:32:18.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 20567)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1383, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-24 14:32:23.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1384, N'Generación remito 8', N'A10001', CAST(N'2019-11-24 14:32:31.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 32790)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1385, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 14:32:43.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1386, N'Error DVH: Tanque - AAA8 4001', N'-', CAST(N'2019-11-24 14:32:43.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38379)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1387, N'Error DVV: Tanque', N'-', CAST(N'2019-11-24 14:32:43.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 20567)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1388, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-24 14:32:58.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1389, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 14:33:06.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1390, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 14:37:46.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1391, N'Asignación conductor DNI: 12312  Pedido: 1', N'A10001', CAST(N'2019-11-24 14:37:55.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 95451)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1392, N'Asignación conductor DNI: 67346753 Pedido: 2', N'A10001', CAST(N'2019-11-24 14:37:58.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 102893)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1393, N'Asignación conductor DNI: 423423 Pedido: 16', N'A10001', CAST(N'2019-11-24 14:38:01.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 99129)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1394, N'Asignación conductor DNI: 67346753 Pedido: 19', N'A10001', CAST(N'2019-11-24 14:38:03.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 105991)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1395, N'Generación remito 9', N'A10001', CAST(N'2019-11-24 14:38:26.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 32809)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1396, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 14:38:34.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1397, N'Error DVH: Tanque - AAA8 4001', N'-', CAST(N'2019-11-24 14:38:35.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38379)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1398, N'Error DVV: Tanque', N'-', CAST(N'2019-11-24 14:38:35.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 20567)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1399, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 14:42:52.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1400, N'Error DVH: Tanque - AAA8 4001', N'-', CAST(N'2019-11-24 14:42:53.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38379)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1401, N'Error DVV: Tanque', N'-', CAST(N'2019-11-24 14:42:53.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 20567)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1402, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 14:49:58.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1403, N'Error DVH: Tanque - AAA8 4001', N'-', CAST(N'2019-11-24 14:49:59.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 38379)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1404, N'Error DVV: Tanque', N'-', CAST(N'2019-11-24 14:49:59.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 20567)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1405, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-24 14:50:01.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1406, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 14:57:00.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1407, N'Error DVH: Tanque - AA 4001', N'-', CAST(N'2019-11-24 14:57:01.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 34412)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1408, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-24 14:57:04.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1409, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 15:09:11.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1410, N'Error DVH: Tanque - AA 4001', N'-', CAST(N'2019-11-24 15:09:12.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 34412)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1411, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-24 15:09:15.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1412, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 15:09:23.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1413, N'Generación recibo 11', N'A10001', CAST(N'2019-11-24 15:10:10.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 33786)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1414, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 15:10:19.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1415, N'Error DVH: Tanque - TK2 4001', N'-', CAST(N'2019-11-24 15:10:20.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 36745)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1416, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-24 15:12:02.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1417, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 15:12:08.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1418, N'Generación recibo 12', N'A10001', CAST(N'2019-11-24 15:12:20.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 33806)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1419, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 15:12:34.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1420, N'Error DVH: Tanque - TK2 4001', N'-', CAST(N'2019-11-24 15:12:34.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 36745)
GO
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1421, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-24 15:12:40.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1422, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 15:16:27.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1423, N'Generación recibo 13', N'A10001', CAST(N'2019-11-24 15:16:34.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 33826)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1424, N'Generación recibo 14', N'A10001', CAST(N'2019-11-24 15:17:24.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 33846)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1425, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 15:17:57.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1426, N'Error DVH: Tanque - TK1 4001', N'-', CAST(N'2019-11-24 15:17:58.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 36722)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1427, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-24 15:18:00.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1428, N'Generación recibo 15', N'A10001', CAST(N'2019-11-24 15:18:12.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 33866)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1429, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 15:18:29.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1430, N'Error DVH: Tanque - TK1 4001', N'-', CAST(N'2019-11-24 15:18:30.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 36722)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1431, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-24 15:18:37.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1432, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 15:19:52.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1433, N'Generación recibo 16', N'A10001', CAST(N'2019-11-24 15:19:58.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 33886)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1434, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 15:20:06.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1435, N'Error DVH: Tanque - TK2 4001', N'-', CAST(N'2019-11-24 15:20:07.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 36745)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1436, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-24 15:21:37.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1437, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 15:22:14.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1438, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 15:22:18.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1439, N'Generación recibo 17', N'A10001', CAST(N'2019-11-24 15:22:30.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 33906)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1440, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 15:22:39.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1441, N'Error DVH: Tanque - AA 4001', N'-', CAST(N'2019-11-24 15:22:40.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 34412)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1442, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-24 15:23:26.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1443, N'Generación recibo 18', N'A10001', CAST(N'2019-11-24 15:28:38.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 33926)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1444, N'Generación recibo 19', N'A10001', CAST(N'2019-11-24 15:28:59.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 33946)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1445, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 15:29:08.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1446, N'Error DVH: Tanque - AA 4001', N'-', CAST(N'2019-11-24 15:33:44.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 34412)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1447, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 15:33:55.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1448, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 15:39:10.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1449, N'Error DVH: Tanque - AA 4001', N'-', CAST(N'2019-11-24 15:39:14.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 34412)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1450, N'Recálculo de dígitos verificadores', N'A10001', CAST(N'2019-11-24 15:39:17.000' AS DateTime), N'ALTA', N'flh2PcqcEzI=', 86386)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1451, N'Generación recibo 20', N'A10001', CAST(N'2019-11-24 15:39:32.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 33785)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1452, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 15:39:41.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1453, N'Modificación tanque TK1 Terminal: 4001', N'A10001', CAST(N'2019-11-24 15:40:12.000' AS DateTime), N'BAJA', N'OCZ82uBtIsuqzAoOciuv/A==', 85821)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1454, N'Modificación tanque TK1 Terminal: 4001', N'A10001', CAST(N'2019-11-24 15:40:27.000' AS DateTime), N'BAJA', N'OCZ82uBtIsuqzAoOciuv/A==', 85821)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1455, N'Generación recibo 21', N'A10001', CAST(N'2019-11-24 15:41:16.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 33805)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1456, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 15:41:34.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1457, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 15:42:35.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1458, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 15:55:42.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1459, N'Modificación usuario A10001', N'A10001', CAST(N'2019-11-24 15:56:35.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 50191)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1460, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 15:57:06.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1461, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 15:57:46.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1462, N'Modificación usuario A10001', N'A10001', CAST(N'2019-11-24 15:58:06.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 50191)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1463, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 15:58:15.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1464, N'Modificación usuario A10001', N'A10001', CAST(N'2019-11-24 15:58:33.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 50191)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1465, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 15:59:55.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1466, N'Asignación conductor DNI: 12312  Pedido: 4', N'A10001', CAST(N'2019-11-24 16:00:02.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 95577)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1467, N'Asignación conductor DNI: 12312  Pedido: 11', N'A10001', CAST(N'2019-11-24 16:00:05.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 98135)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1468, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 16:02:28.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1469, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 16:03:22.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1470, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 16:04:23.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1471, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:09:05.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1472, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:09:08.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1473, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:09:10.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1474, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:09:12.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1475, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:09:14.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1476, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:09:16.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1477, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:09:19.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1478, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:09:21.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1479, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:26:00.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1480, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:26:09.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1481, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 19:26:24.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1482, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:26:34.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1483, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:26:37.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1484, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:26:39.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1485, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:26:41.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1486, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 19:26:49.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1487, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:27:47.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1488, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:28:33.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1489, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:28:38.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1490, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:28:52.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1491, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:29:50.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1492, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:32:51.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1493, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:32:54.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1494, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:33:07.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1495, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:33:14.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1496, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:33:16.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1497, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:36:25.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1498, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:36:29.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1499, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:36:48.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1500, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:36:50.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1501, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:55:40.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1502, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:55:42.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1503, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:55:46.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1504, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:55:48.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1505, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:55:50.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1506, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:57:02.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1507, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:57:11.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1508, N'Contraseña errónea', N'A10001', CAST(N'2019-11-24 19:57:16.000' AS DateTime), N'MEDIA', N'Elt/gKD5iA8=', 36540)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1509, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 19:57:24.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1510, N'Modificación de contraseña', N'A10001', CAST(N'2019-11-24 19:57:32.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 57973)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1511, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 19:57:41.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1512, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-24 23:37:51.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1513, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-25 00:26:17.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1514, N'Modificación usuario A10001', N'A10001', CAST(N'2019-11-25 00:26:32.000' AS DateTime), N'BAJA', N'iW64F91246JSDQsp1CztXQ==', 50191)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1515, N'Generación recibo 22', N'A10001', CAST(N'2019-11-25 00:26:42.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 33825)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1516, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-25 00:27:39.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1517, N'Inactivación producto A1        ', N'A10001', CAST(N'2019-11-25 00:27:45.000' AS DateTime), N'BAJA', N'OCZ82uBtIsuqzAoOciuv/A==', 58000)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1518, N'Generación recibo 23', N'A10001', CAST(N'2019-11-25 00:27:53.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 33845)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1519, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-25 00:28:48.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1520, N'Generación recibo 24', N'A10001', CAST(N'2019-11-25 00:29:27.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 33865)
GO
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1521, N'Generación recibo 25', N'A10001', CAST(N'2019-11-25 00:30:04.000' AS DateTime), N'BAJA', N'4FLWtTOzrDJgJBFJID+vCg==', 33885)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1522, N'Activación producto A1        ', N'A10001', CAST(N'2019-11-25 00:30:29.000' AS DateTime), N'BAJA', N'OCZ82uBtIsuqzAoOciuv/A==', 51515)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1523, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-25 00:31:15.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
INSERT [dbo].[Bitacora] ([Id_log], [Descripcion_log], [Cod_usuario], [Fecha], [Criticidad], [Funcionalidad], [DVH]) VALUES (1524, N'Ingreso a aplicación', N'A10001', CAST(N'2019-11-25 00:32:53.000' AS DateTime), N'BAJA', N'Elt/gKD5iA8=', 38062)
SET IDENTITY_INSERT [dbo].[Bitacora] OFF
SET IDENTITY_INSERT [dbo].[Conductor] ON 

INSERT [dbo].[Conductor] ([id_conductor], [apellido], [nombre], [habilitado], [patente], [NroDocumento]) VALUES (1, N'Gomez', N'Carlos', 1, N'AA46325VV', N'12312 ')
INSERT [dbo].[Conductor] ([id_conductor], [apellido], [nombre], [habilitado], [patente], [NroDocumento]) VALUES (2, N'Garcia', N'Juan', 1, N'AA42342A', N'423423')
INSERT [dbo].[Conductor] ([id_conductor], [apellido], [nombre], [habilitado], [patente], [NroDocumento]) VALUES (3, N'x', N'Roberto', 0, N'879ASD', N'67346753')
SET IDENTITY_INSERT [dbo].[Conductor] OFF
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (0, 0, 0, 847, N'A1', 1, N'RC', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (0, 0, 0, 867, N'A1', 1, N'RM', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (1, 0, 250, 1518, N'B2', 2, N'RC', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (1, 10, 120, 4860, N'A1        ', 5, N'RM', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (2, 0, 300, 1493, N'B2', 2, N'RC', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (2, 10, 120, 4860, N'A1        ', 5, N'RM', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (3, 0, 300, 1493, N'B2', 2, N'RC', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (3, 14, 65, 1222, N'B2', 6, N'RM', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (4, 0, 140, 1507, N'B2', 1, N'RC', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (4, 14, 65, 1222, N'B2', 6, N'RM', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (5, 0, 50000, 2319, N'B2', 6, N'RC', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (5, 12, 35, 1207, N'B2', 6, N'RM', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (6, 0, 450, 1528, N'B2', 6, N'RC', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (6, 12, 35, 1207, N'B2', 6, N'RM', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (7, 0, 250, 1518, N'B2', 6, N'RC', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (7, 14, 65, 1222, N'B2', 6, N'RM', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (8, 0, 250, 1518, N'B2', 6, N'RC', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (8, 10, 120, 4860, N'A1        ', 5, N'RM', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (9, 0, 20, 1152, N'B2', 6, N'RC', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (9, 2, 200, 4845, N'A1        ', 5, N'RM', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (10, 0, 1000, 5580, N'A1        ', 5, N'RC', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (11, 0, 1000, 1867, N'B2', 2, N'RC', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (12, 0, 20, 1152, N'B2', 2, N'RC', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (13, 0, 100, 1483, N'B2', 6, N'RC', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (14, 0, 200, 1488, N'B2', 6, N'RC', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (15, 0, 30, 1157, N'B2', 6, N'RC', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (16, 0, 20, 1152, N'B2', 2, N'RC', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (17, 0, 100, 1483, N'B2', 1, N'RC', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (18, 0, 10, 1147, N'B2', 1, N'RC', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (19, 0, 25, 1182, N'B2', 1, N'RC', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (20, 0, 5, 879, N'B2', 1, N'RC', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (21, 0, 25, 1182, N'B2', 1, N'RC', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (22, 0, 100, 4812, N'A1        ', 5, N'RC', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (23, 0, 20, 4105, N'A1        ', 5, N'RC', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (24, 0, 40, 4131, N'A1        ', 5, N'RC', 0)
INSERT [dbo].[Documento] ([nroDocumento], [nroPedido], [cantidad], [DVH], [producto], [tanque], [tipoDocumento], [documentoAnulador]) VALUES (25, 0, 20, 4105, N'A1        ', 5, N'RC', 0)
INSERT [dbo].[DVV] ([entidad], [valor_dv]) VALUES (N'Bitacora', 129909762)
INSERT [dbo].[DVV] ([entidad], [valor_dv]) VALUES (N'Documento', 78170)
INSERT [dbo].[DVV] ([entidad], [valor_dv]) VALUES (N'FamiliaPatente', 0)
INSERT [dbo].[DVV] ([entidad], [valor_dv]) VALUES (N'Tanque', 39870)
INSERT [dbo].[DVV] ([entidad], [valor_dv]) VALUES (N'Usuario', 3129317)
INSERT [dbo].[DVV] ([entidad], [valor_dv]) VALUES (N'UsuarioPatente', 388211)
INSERT [dbo].[Idioma] ([Id_idioma], [Descripcion_idioma]) VALUES (1, N'Castellano')
INSERT [dbo].[Idioma] ([Id_idioma], [Descripcion_idioma]) VALUES (2, N'Inglés')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 1, N'CÓDIGO DE USUARIO')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 2, N'CONTRASEÑA')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 3, N'INGRESAR')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 4, N'Menú principal')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 5, N'Producto')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 6, N'Consultar producto')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 7, N'Alta de producto')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 8, N'Productos operados')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 9, N'Verificar producto-terminal')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 10, N'Asignar producto-terminal')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 11, N'Tanque')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 12, N'Consultar tanque')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 13, N'Alta de tanque')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 38, N'USUARIO')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 14, N'Transferencia de stock')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 54, N'¿Desea cerrar sesión?
')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 54, N'Do you want to close the session?
')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 55, N'INFORMACIÓN')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 55, N'INFORMATION
')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 56, N'Ayuda')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 56, N'Help')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 15, N'Conductor')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 16, N'Consultar conductor')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 17, N'Alta de conductor')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 18, N'Gestión terminal')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 19, N'Verificar documento')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 20, N'Generar remito')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 21, N'Generar recibo')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 22, N'Pedidos pendientes')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 23, N'Menú Usuario')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 24, N'Cambiar idioma')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 25, N'Cambiar contraseña')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 26, N'Administración de usuarios')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 27, N'Usuarios')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 28, N'Consultar usuario')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 29, N'Crear usuario')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 30, N'Familia')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 31, N'Consultar familia')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 32, N'Crear familia')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 33, N'Seguridad de sistema')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 34, N'Consultar bitácora')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 35, N'Generar copia de seguridad')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 36, N'Restaurar copia de seguridad')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 37, N'Cerrar sesión')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 1, N'USER')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 2, N'PASSWORD')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 3, N'LOGIN')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 4, N'Main Menu')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 5, N'Product')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 6, N'Consult product')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 7, N'New product')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 8, N'Operated products')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 9, N'Check product-terminal')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 10, N'Assign product-terminal')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 11, N'Tank')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 12, N'Consult tank')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 13, N'New tank')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 14, N'Stock tranfer')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 15, N'Consultar dirver')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 16, N'New driver')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 17, N'Change driver')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 18, N'Terminal management')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 19, N'Check document')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 20, N'Shipping')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 21, N'Receipt')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 22, N'Pending orders')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 23, N'User menu')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 24, N'Change languages')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 25, N'Change password')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 26, N'User management')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 27, N'Users')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 28, N'Consult user')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 29, N'New user')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 30, N'Family')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 31, N'Consult family')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 32, N'New family')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 33, N'System security')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 34, N'Consult Logbook')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 35, N'New backup')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 36, N'Restore Backup')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 37, N'Sign off')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 39, N'Código')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 40, N'Nombre')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 41, N'Apellido')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 42, N'INFORMACIÓN USUARIO')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 43, N'MAIL:')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 44, N'TERMINAL:')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 45, N'DNI:')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 46, N'BLOQUEADO:')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 47, N'MODIFICAR')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 48, N'BLANQUEAR CONTRASEÑA')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 49, N'BLOQUEAR USUARIO')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 50, N'DESBLOQUEAR USUARIO')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 51, N'OTORTAR PATENTES')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 52, N'NEGAR PATENTES')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (1, 53, N'ADMINISTRACION FAMILIAS')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 38, N'USER')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 39, N'Code')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 40, N'Name')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 41, N'Last name')
GO
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 42, N'USER INFORMATION')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 43, N'MAIL:')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 44, N'TERMINAL:')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 45, N'DNI:')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 46, N'BLOCK:')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 47, N'CHANGE')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 48, N'REGENERATE PASSWORD')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 49, N'BLOCK USER')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 50, N'UNBLOCK USER')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 51, N'GIVE PATENTS')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 52, N'DENY PATENTS')
INSERT [dbo].[IdiomaMensaje] ([id_idioma], [id_idioma_mi], [mensaje]) VALUES (2, 53, N'FAMILY MANAGEMENT')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (1, N'LABEL COD DE USUARIO                              ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (2, N'LABEL CONTRASEÑA                                  ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (3, N'BOTON INGRESAR                                    ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (4, N'TITULO                                            ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (5, N'ITEM PRODUCTO                                     ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (6, N'ITEM CONSULTAR PRODUCTO                           ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (7, N'ITEM ALTA PRODUCTO                                ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (8, N'ITEM PRODUCTOS OPERADOS                           ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (9, N'ITEM VERIFICAR PRODUCTO                           ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (10, N'ITEM ASIGNAR PRODUCTO                             ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (11, N'ITEM TANQUE                                       ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (12, N'ITEM CONSULTAR TANQUE                             ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (13, N'ITEM ALTA TANQUE                                  ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (14, N'ITEM TRANSFERENCIA STOCK                          ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (15, N'ITEM CONDUCTOR                                    ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (16, N'ITEM CONSULTAR CONDUCTOR                          ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (17, N'ITEM ALTA CONDUCTOR                               ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (18, N'ITEM MODIFICAR CONDUCTOR                          ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (19, N'ITEM GESTION TERMINAL                             ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (20, N'ITEM VERIFICAR DOCUMENTO                          ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (21, N'ITEM GENERAR REMITO                               ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (22, N'ITEM GENERAR RECIBO                               ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (23, N'ITEM PEDIDOS PENDIENTES                           ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (24, N'ITEM MENU USUARIO                                 ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (25, N'ITEM CAMBIAR IDIOMA                               ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (26, N'ITEM CAMBIAR CONTRASEÑA                           ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (27, N'ITEM ADM USUARIOS                                 ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (28, N'ITEM USUARIOS                                     ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (29, N'ITEM CONSULTAR USUARIO                            ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (30, N'ITEM CREAR USUARIO                                ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (31, N'ITEM FAMILIAS                                     ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (32, N'ITEM CONSULTAR FAMILIA                            ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (33, N'ITEM CREAR FAMILIA                                ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (34, N'ITEM SEGURIDAD SISTEMAS                           ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (35, N'ITEM CONSULTAR BITACORA                           ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (36, N'ITEM GENERAR COPIA SEGURIDAD                      ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (37, N'ITEM RESTAURAR COPIA SEGURIDAD                    ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (38, N'CERRAR SESIÓN                                     ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (38, N'MENU CONSULTAR USUARIO                            ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (39, N'GRILLA CÓDIGO                                     ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (40, N'GRILLA NOMBRE                                     ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (41, N'GRILLA APELLIDO                                   ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (42, N'GROUPBOX INFORMACION                              ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (43, N'GROUPBOX MAIL                                     ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (44, N'GROUPBOX TERMINAL                                 ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (45, N'GROUPBOX DNI                                      ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (46, N'GROUPBOX BLOQUEADO                                ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (47, N'BOTON MODIFICAR                                   ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (48, N'BOTON BLANQUEAR CONTRASEÑA                        ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (49, N'BOTON BLOQUEAR USUARIO                            ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (50, N'BOTON DESBLOQUEAR USUARIO                         ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (51, N'BOTON OTORTAR PATENTES                            ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (52, N'BOTON NEGAR PATENTES                              ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (53, N'BOTON ADM FAMILIAS                                ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (54, N'MSG CERRAR SESION
                               ')
INSERT [dbo].[IdiomaMI] ([id_idioma_mi], [descripcion]) VALUES (55, N'INFORMACION
                                     ')
SET IDENTITY_INSERT [dbo].[Patente] ON 

INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (1, N'qZsLalMU8DJDV05I9np2k7nwXs0XtxLc')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (2, N'Z4gW4Q5Ge16d7SCmLSTqWg==')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (3, N'DFhu7MsyBLJIrfWG3mz6nVrNFcuxsxYH')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (4, N'VNRiWQ4qezwwaCr4EyL8lbQLJCHYe0fZ')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (5, N'++pybIGm7cjI7CEuMrOBJy62acywrAOo')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (6, N'6NraJeqmYEw0mCBWNIugMwHqOr/T5XPc')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (7, N'e687mfADI8WBWWNt9kEKZQ==')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (8, N'jecTdzX5cXcclQa/pLZc/ZRtVvhz2NoC')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (9, N'ItejXg9PzYM8zAHB40MSPrSNXTGTyUKW')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (10, N'ItejXg9PzYM8zAHB40MSPuKmCLZ9H85N')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (11, N'FJBpoUd6tEUHxILMkbdYxhqL0BN7CANR')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (12, N'SRiaNuaBScJNS6Hh8pgSkxGOzyukJcxWH1Q4ZIEGryI=')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (13, N'Ys3ujI9zPpttkUCKQPPIVM+5thYX49WyhtGdbp1h4SQ=')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (14, N'qZsLalMU8DKcmeMXk+u7Jqw/rG4IcABG')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (15, N'29qt6ubJfEh7CAhvIqpTm+a0LWvBLobi')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (16, N'29qt6ubJfEg4CM4EMnpXBQ==')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (17, N'qZsLalMU8DIjeqL8KO7xwyfGXu1A1Yof')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (18, N'Ou+uIdLigpB7Whayej5QLw==')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (19, N'DFhu7MsyBLKdSiGxAThoB0uQptpWspP6')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (20, N'VNRiWQ4qezy7WHofC0Ki5w540xm9wivR')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (21, N'qZsLalMU8DIjeqL8KO7xw+EZ17u7jLCpN/G+Fa6Slyc=')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (22, N'ItejXg9PzYM75IZ1/lCWYFNpJIbBL6GNBJlLqqdBAwM=')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (23, N'qZsLalMU8DJVDIC+aXhCam3MLacONmGc')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (24, N'31NlFiFtN5EGad3dsI4SnA==')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (25, N'DFhu7MsyBLKQGNvQK6SxsZpk5Zy6qYzP')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (26, N'VNRiWQ4qezxvw1Hsre8o8Q==')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (27, N'DJ+sr8gAFUfQei9Q/us1jiMQ4juKGolX')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (28, N'QnSzjw+laFFaNGERxYuiKw==')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (29, N'QnSzjw+laFFpP3kDfnpRqQ==')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (30, N'qZsLalMU8DJoZCXtjdfguzmN7U+8lOvC')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (31, N'qZsLalMU8DIyc6PNwKbDerNBiGi29aVf')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (32, N'Arz2UbvIZLw9cfxjRmDJGA==')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (33, N'DFhu7MsyBLJw4eEv19LSArzuj07xKRUd')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (34, N'VNRiWQ4qezzWtBSQAlvDAuus/z+Cj6TC')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (35, N'qZsLalMU8DL2XWcFqQCCeuft0VKL8hm5O/R7T/znPa4=')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (36, N'ItejXg9PzYO6VNHGeC0CxfZm2VdrbT5o')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (37, N'S8HAM/R5VnNyJOQaW0FDQT9Nn/sZcHEC')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (38, N'ItejXg9PzYMfYqgcPtWrldU+HVp7mvyc')
INSERT [dbo].[Patente] ([Id_patente], [Descripcion_patente]) VALUES (39, N'z/i9ufzscwEs04gxhxah9QXQ1ZRcx8IXVazMwuXMaqY=')
SET IDENTITY_INSERT [dbo].[Patente] OFF
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (1, 0, 10000, 1, N'A1', 0, N'Roque 4343', 4001, 0)
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (2, 0, 200, 3, N'A1', 1, N'Calle 4234', 4001, 0)
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (3, 0, 350, 0, N'B2', 0, N'C 43423', 4002, 0)
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (4, 0, 50, 1, N'C3', 0, N'RRR', 4003, 0)
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (5, 0, 60, 0, N'A1', 0, N'C 43423', 4003, 0)
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (6, 0, 35, 0, N'B2', 0, N'YYY', 4002, 0)
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (7, 0, 40, 1, N'C3', 0, N'JJ', 4001, 0)
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (8, 0, 100, 0, N'D4', 0, N'KK', 4002, 0)
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (9, 0, 70, 0, N'B2', 0, N'PPP', 4002, 0)
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (10, 0, 120, 2, N'A1', 1, N'SS', 4001, 0)
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (11, 0, 100, 1, N'A1', 0, N'TT', 4003, 0)
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (12, 0, 35, 1, N'B2', 1, N'FFF', 4001, 0)
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (13, 0, 100, 0, N'D4', 0, N'SS', 4004, 0)
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (14, 0, 65, 1, N'B2', 1, N'HH', 4001, 0)
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (15, 0, 130, 0, N'C3', 0, N'VVV', 4002, 0)
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (16, 0, 40, 2, N'C3', 0, N'UUU', 4001, 0)
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (17, 0, 100, 0, N'D4', 0, N'KK', 4002, 0)
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (18, 0, 100, 0, N'C3', 0, N'SS', 4004, 0)
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (19, 0, 100, 3, N'D4', 0, N'SS', 4001, 0)
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (20, 0, 100, 0, N'D4', 0, N'SS', 4004, 0)
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (21, 0, 100, 0, N'D4', 0, N'SS', 4004, 0)
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (22, 0, 100, 0, N'D4', 0, N'SS', 4004, 0)
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (23, 0, 100, 0, N'D4', 0, N'SS', 4004, 0)
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (24, 0, 100, 0, N'A1', 0, N'TT', 4001, 0)
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (25, 0, 100, 0, N'A1', 0, N'TT', 4001, 0)
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (26, 0, 100, 0, N'A1', 0, N'TT', 4001, 0)
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (27, 0, 100, 0, N'A1', 0, N'TT', 4001, 0)
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (28, 0, 100, 0, N'A1', 0, N'TT', 4001, 0)
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (29, 0, 100, 0, N'B2', 0, N'TT', 4001, 0)
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (30, 0, 100, 0, N'D4', 0, N'TT', 4001, 0)
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (31, 0, 100, 0, N'B2', 0, N'TT', 4001, 0)
INSERT [dbo].[Pedido] ([nroPedido], [anulado], [cantidad], [idConductor], [codProducto], [entregado], [domicilio], [codTerminal], [documentoAnulador]) VALUES (32, 0, 100, 0, N'D4', 0, N'TT', 4001, 0)
INSERT [dbo].[Producto] ([Cod_Producto], [Descripcion_producto], [Temperatura_natural], [Magnitud_medida], [Activo]) VALUES (N'A1        ', N'Nafta', N'11', N'MG', 0)
INSERT [dbo].[Producto] ([Cod_Producto], [Descripcion_producto], [Temperatura_natural], [Magnitud_medida], [Activo]) VALUES (N'B2', N'Nafta 2', N'4234', N'LT', 1)
INSERT [dbo].[Producto] ([Cod_Producto], [Descripcion_producto], [Temperatura_natural], [Magnitud_medida], [Activo]) VALUES (N'C3', N'Super 1', N'22', N'LT', 1)
INSERT [dbo].[Producto] ([Cod_Producto], [Descripcion_producto], [Temperatura_natural], [Magnitud_medida], [Activo]) VALUES (N'D4', N'Lubricante', N'20', N'LT', 1)
SET IDENTITY_INSERT [dbo].[Tanque] ON 

INSERT [dbo].[Tanque] ([codProducto], [DVH], [activo], [cantidadMaxima], [codTanque], [codTerminal], [stock], [descripcion], [id_tanque]) VALUES (N'B2', 4596, 0, 24325, N'AA', 4001, 20105, N'tanque bbb', 1)
INSERT [dbo].[Tanque] ([codProducto], [DVH], [activo], [cantidadMaxima], [codTanque], [codTerminal], [stock], [descripcion], [id_tanque]) VALUES (N'B2', 4637, 1, 8000, N'TK2', 4001, 1040, N'0', 2)
INSERT [dbo].[Tanque] ([codProducto], [DVH], [activo], [cantidadMaxima], [codTanque], [codTerminal], [stock], [descripcion], [id_tanque]) VALUES (N'A1        ', 7311, 1, 2666, N'TK8', 4004, 0, N'0', 3)
INSERT [dbo].[Tanque] ([codProducto], [DVH], [activo], [cantidadMaxima], [codTanque], [codTerminal], [stock], [descripcion], [id_tanque]) VALUES (N'A1        ', 9143, 1, 19000, N'TANK2', 4004, 0, N'0', 4)
INSERT [dbo].[Tanque] ([codProducto], [DVH], [activo], [cantidadMaxima], [codTanque], [codTerminal], [stock], [descripcion], [id_tanque]) VALUES (N'A1        ', 10137, 1, 10000, N'AAA8', 4001, 500, N'0', 5)
INSERT [dbo].[Tanque] ([codProducto], [DVH], [activo], [cantidadMaxima], [codTanque], [codTerminal], [stock], [descripcion], [id_tanque]) VALUES (N'B2', 4046, 1, 3000, N'TK1', 4001, 335, N'Tanque 25', 6)
SET IDENTITY_INSERT [dbo].[Tanque] OFF
INSERT [dbo].[Terminal] ([codTerminal], [descripcion]) VALUES (4001, N'LOMAS DE ZAMORA')
INSERT [dbo].[Terminal] ([codTerminal], [descripcion]) VALUES (4002, N'LA MATANZA')
INSERT [dbo].[Terminal] ([codTerminal], [descripcion]) VALUES (4003, N'LA PLATA')
INSERT [dbo].[Terminal] ([codTerminal], [descripcion]) VALUES (4004, N'PILAR')
INSERT [dbo].[Terminal] ([codTerminal], [descripcion]) VALUES (4005, N'CABA')
INSERT [dbo].[Terminal] ([codTerminal], [descripcion]) VALUES (4006, N'SAN MARTIN')
INSERT [dbo].[Usuario] ([Cod_usuario], [Nombre], [Apellido], [Contraseña], [Nro_documento], [Tipo_documento], [Cantidad_ingresos_incorrectos], [Bloqueado], [Idioma], [DVH], [Email], [Terminal]) VALUES (N'A10001', N'AV6NVcG1Jg4=', N'Cano', N'21232f297a57a5a743894a0e4a801fc3', N'36946384', N'DNI', 0, 0, 1, 58962, N'Micano1992', 4001)
INSERT [dbo].[Usuario] ([Cod_usuario], [Nombre], [Apellido], [Contraseña], [Nro_documento], [Tipo_documento], [Cantidad_ingresos_incorrectos], [Bloqueado], [Idioma], [DVH], [Email], [Terminal]) VALUES (N'A10002', N'81bougf+rrQ=', N'Perez', N'21232f297a57a5a743894a0e4a801fc3', N'33993703', N'DNI', 0, 1, 1, 58200, N'Juan123   ', 4004)
INSERT [dbo].[Usuario] ([Cod_usuario], [Nombre], [Apellido], [Contraseña], [Nro_documento], [Tipo_documento], [Cantidad_ingresos_incorrectos], [Bloqueado], [Idioma], [DVH], [Email], [Terminal]) VALUES (N'A10003', N'5HHj/bcKZVo=', N'Braña', N'be71561b98d7165183c1e22ef154a1a1', N'24678465', N'DNI', 0, 1, 1, 67547, N'Rodrigo432', 4001)
INSERT [dbo].[Usuario] ([Cod_usuario], [Nombre], [Apellido], [Contraseña], [Nro_documento], [Tipo_documento], [Cantidad_ingresos_incorrectos], [Bloqueado], [Idioma], [DVH], [Email], [Terminal]) VALUES (N'A10004', N'Phvy/sLIhh4=', N'Desabato', N'21232f297a57a5a743894a0e4a801fc3', N'14567385', N'DNI', 0, 1, 1, 75358, N'Leandro09 ', 4002)
INSERT [dbo].[Usuario] ([Cod_usuario], [Nombre], [Apellido], [Contraseña], [Nro_documento], [Tipo_documento], [Cantidad_ingresos_incorrectos], [Bloqueado], [Idioma], [DVH], [Email], [Terminal]) VALUES (N'A10005', N'48J1PlnAX60=', N'Andujar', N'21232f297a57a5a743894a0e4a801fc3', N'22333444', N'DNI', 0, 1, 1, 118216, N'Mariano@hotmail.com', 4001)
INSERT [dbo].[Usuario] ([Cod_usuario], [Nombre], [Apellido], [Contraseña], [Nro_documento], [Tipo_documento], [Cantidad_ingresos_incorrectos], [Bloqueado], [Idioma], [DVH], [Email], [Terminal]) VALUES (N'A10006', N'Sm39RDmDxXY=', N'Boselli', N'21232f297a57a5a743894a0e4a801fc3', N'206452737', N'CUIT', 0, 1, 1, 117651, N'Mauro@hotmail.com', 4005)
INSERT [dbo].[Usuario] ([Cod_usuario], [Nombre], [Apellido], [Contraseña], [Nro_documento], [Tipo_documento], [Cantidad_ingresos_incorrectos], [Bloqueado], [Idioma], [DVH], [Email], [Terminal]) VALUES (N'A10007', N'npEk+N/Fee6HTYb6wglO0A==', N'Cellay', N'CDAJDABD                        ', N'20674857632', N'CUIT', 0, 1, 1, 205311, N'Christian@hotmail.com', 4006)
INSERT [dbo].[Usuario] ([Cod_usuario], [Nombre], [Apellido], [Contraseña], [Nro_documento], [Tipo_documento], [Cantidad_ingresos_incorrectos], [Bloqueado], [Idioma], [DVH], [Email], [Terminal]) VALUES (N'A10008', N'RYMX5wUmh0s=', N'Sanchez', N'IBDBFCDE                        ', N'304567825', N'CUIL', 0, 1, 1, 116283, N'Facundo@gmail.com', 4005)
INSERT [dbo].[Usuario] ([Cod_usuario], [Nombre], [Apellido], [Contraseña], [Nro_documento], [Tipo_documento], [Cantidad_ingresos_incorrectos], [Bloqueado], [Idioma], [DVH], [Email], [Terminal]) VALUES (N'A10009', N'W96zZRdHc70=', N'Albil', N'5a3fa116e800647d6428dfde5c8bf0a1', N'206753846', N'CUIL', 0, 1, 1, 101165, N'Damian@yahoo.com', 4003)
INSERT [dbo].[Usuario] ([Cod_usuario], [Nombre], [Apellido], [Contraseña], [Nro_documento], [Tipo_documento], [Cantidad_ingresos_incorrectos], [Bloqueado], [Idioma], [DVH], [Email], [Terminal]) VALUES (N'A10010', N'pbAOe+OjbJdy/W0QB07rGw==', N'Sabella', N'GFEBCHDJ                        ', N'6476287', N'CUIL', 0, 1, 1, 191458, N'Alejandro@hotmail.com', 4003)
INSERT [dbo].[Usuario] ([Cod_usuario], [Nombre], [Apellido], [Contraseña], [Nro_documento], [Tipo_documento], [Cantidad_ingresos_incorrectos], [Bloqueado], [Idioma], [DVH], [Email], [Terminal]) VALUES (N'A10011', N'ZWgny/dQpaU=', N'Malbernat', N'GHGAEIIC                        ', N'207465781', N'CUIL', 0, 1, 1, 116268, N'Oscar@yahoo.com', 4003)
INSERT [dbo].[Usuario] ([Cod_usuario], [Nombre], [Apellido], [Contraseña], [Nro_documento], [Tipo_documento], [Cantidad_ingresos_incorrectos], [Bloqueado], [Idioma], [DVH], [Email], [Terminal]) VALUES (N'A10012', N'8HJilqGk+K0=', N'Schiavi', N'IHEGHHGE                        ', N'5678125', N'DNI', 0, 1, 1, 104484, N'Rolando@gmail.com', 4002)
INSERT [dbo].[Usuario] ([Cod_usuario], [Nombre], [Apellido], [Contraseña], [Nro_documento], [Tipo_documento], [Cantidad_ingresos_incorrectos], [Bloqueado], [Idioma], [DVH], [Email], [Terminal]) VALUES (N'A10013', N'15PZBO1tJ3Q=', N'Angelleri', N'BHDGBGEJ                        ', N'20308742834', N'CUIL', 0, 1, 2, 138926, N'Marcos@hotmail.com', 4003)
INSERT [dbo].[Usuario] ([Cod_usuario], [Nombre], [Apellido], [Contraseña], [Nro_documento], [Tipo_documento], [Cantidad_ingresos_incorrectos], [Bloqueado], [Idioma], [DVH], [Email], [Terminal]) VALUES (N'A10014', N'Gg/xbHWZSMg=', N'Galvan', N'09a092d22faaa3fce313437825452382', N'23475824', N'DNI', 0, 1, 1, 53914, N'Diego', 4001)
INSERT [dbo].[Usuario] ([Cod_usuario], [Nombre], [Apellido], [Contraseña], [Nro_documento], [Tipo_documento], [Cantidad_ingresos_incorrectos], [Bloqueado], [Idioma], [DVH], [Email], [Terminal]) VALUES (N'A10015', N'Ji1vbNexlGM=', N'Ramon', N'384aa0609b750068d5256e0f3bdcfdbc', N'20106352765', N'CUIL', 0, 1, 2, 125412, N'JuanRamon@yahoo.com', 4004)
INSERT [dbo].[Usuario] ([Cod_usuario], [Nombre], [Apellido], [Contraseña], [Nro_documento], [Tipo_documento], [Cantidad_ingresos_incorrectos], [Bloqueado], [Idioma], [DVH], [Email], [Terminal]) VALUES (N'A10016', N'ZaaKaFEau9a1oshKih9vGQ==', N'Veron', N'f55caefed4a747ce98e7d1cff4d10a5b', N'20103541274', N'CUIL', 0, 1, 1, 199004, N'JuanRamon@hotmail.com', 4003)
INSERT [dbo].[Usuario] ([Cod_usuario], [Nombre], [Apellido], [Contraseña], [Nro_documento], [Tipo_documento], [Cantidad_ingresos_incorrectos], [Bloqueado], [Idioma], [DVH], [Email], [Terminal]) VALUES (N'A10017', N'FTa+NzrqOOw=', N'Flores', N'42e969fd664d48af876acc130a5f37b2', N'20423423', N'CUIL', 0, 1, 1, 108245, N'Bocha@hotmail.com', 4002)
INSERT [dbo].[Usuario] ([Cod_usuario], [Nombre], [Apellido], [Contraseña], [Nro_documento], [Tipo_documento], [Cantidad_ingresos_incorrectos], [Bloqueado], [Idioma], [DVH], [Email], [Terminal]) VALUES (N'A10018', N'tB7rxeztusQ=', N'Palermo', N'4ca1dcd60c57e8ee1a674eaee4e360c6', N'203542674', N'CUIL', 0, 1, 1, 128511, N'MartinP@hotmail.com', 4005)
INSERT [dbo].[Usuario] ([Cod_usuario], [Nombre], [Apellido], [Contraseña], [Nro_documento], [Tipo_documento], [Cantidad_ingresos_incorrectos], [Bloqueado], [Idioma], [DVH], [Email], [Terminal]) VALUES (N'A10019', N'Xr9FUQNYAL4=', N'Fernandez', N'c255c99104e12845efb67a65fdfb72a8', N'20354763652', N'CUIL', 0, 1, 1, 114863, N'Gata@gmail.com', 4003)
INSERT [dbo].[Usuario] ([Cod_usuario], [Nombre], [Apellido], [Contraseña], [Nro_documento], [Tipo_documento], [Cantidad_ingresos_incorrectos], [Bloqueado], [Idioma], [DVH], [Email], [Terminal]) VALUES (N'A10020', N'xsTo7bM+Je0=', N'Perez', N'77e28d348368677f6d7912b674172b20', N'34567253', N'DNI', 0, 1, 1, 85294, N'Enzo@gmail.com', 4003)
INSERT [dbo].[Usuario] ([Cod_usuario], [Nombre], [Apellido], [Contraseña], [Nro_documento], [Tipo_documento], [Cantidad_ingresos_incorrectos], [Bloqueado], [Idioma], [DVH], [Email], [Terminal]) VALUES (N'A10021', N'QTqvCQG9g10=', N'Retegui', N'c232a7d44672198e83bf989983ceb585', N'20233643745', N'CUIL', 0, 1, 1, 112445, N'Mateo@yahoo.com', 4003)
INSERT [dbo].[Usuario] ([Cod_usuario], [Nombre], [Apellido], [Contraseña], [Nro_documento], [Tipo_documento], [Cantidad_ingresos_incorrectos], [Bloqueado], [Idioma], [DVH], [Email], [Terminal]) VALUES (N'A10022', N'Ji1vbNexlGM=', N'Perez', N'fd829960ee7d5928c97464678db55e82', N'26363253', N'CUIT', 0, 1, 2, 112598, N'Juan1234@hotmail.com', 4003)
INSERT [dbo].[Usuario] ([Cod_usuario], [Nombre], [Apellido], [Contraseña], [Nro_documento], [Tipo_documento], [Cantidad_ingresos_incorrectos], [Bloqueado], [Idioma], [DVH], [Email], [Terminal]) VALUES (N'A10023', N'eJyzBbsenWk=', N'Azconzabal', N'c033e09ecc5ad4106d79e3703002ae15', N'204645423432', N'CUIL', 0, 1, 2, 131102, N'Vasco@gmail.com', 4004)
INSERT [dbo].[Usuario] ([Cod_usuario], [Nombre], [Apellido], [Contraseña], [Nro_documento], [Tipo_documento], [Cantidad_ingresos_incorrectos], [Bloqueado], [Idioma], [DVH], [Email], [Terminal]) VALUES (N'A10024', N'Ji1vbNexlGM=', N'Costa', N'dddf097e2d759586c5ec8778dca43699', N'2023423', N'CUIL', 0, 1, 1, 91887, N'JuanCosta@gmail', 4001)
INSERT [dbo].[Usuario] ([Cod_usuario], [Nombre], [Apellido], [Contraseña], [Nro_documento], [Tipo_documento], [Cantidad_ingresos_incorrectos], [Bloqueado], [Idioma], [DVH], [Email], [Terminal]) VALUES (N'A10025', N'o9BjXipGVxk=', N'Lopez', N'74e9f8e9b9ea286e9f2b6a4fa7458567', N'24523', N'CUIL', 0, 1, 1, 65789, N'Pepe@gmail', 4004)
INSERT [dbo].[Usuario] ([Cod_usuario], [Nombre], [Apellido], [Contraseña], [Nro_documento], [Tipo_documento], [Cantidad_ingresos_incorrectos], [Bloqueado], [Idioma], [DVH], [Email], [Terminal]) VALUES (N'A10026', N'Phvy/sLIhh4=', N'Benitez', N'21232f297a57a5a743894a0e4a801fc3', N'20423423', N'CUIL', 0, 1, 1, 107892, N'Prueba@yahoo.com', 4001)
INSERT [dbo].[Usuario] ([Cod_usuario], [Nombre], [Apellido], [Contraseña], [Nro_documento], [Tipo_documento], [Cantidad_ingresos_incorrectos], [Bloqueado], [Idioma], [DVH], [Email], [Terminal]) VALUES (N'A10027', N'15PZBO1tJ3Q=', N'Rojo', N'19019669202f3c8e4a80fb7b02b1f37a', N'4223432', N'CUIL', 0, 1, 1, 76883, N'Prueba@@gmail', 4001)
INSERT [dbo].[Usuario] ([Cod_usuario], [Nombre], [Apellido], [Contraseña], [Nro_documento], [Tipo_documento], [Cantidad_ingresos_incorrectos], [Bloqueado], [Idioma], [DVH], [Email], [Terminal]) VALUES (N'A10028', N'SMxrq3ebafk=', N'Final', N'4114e89de114c523359a00f4b0fa54e2', N'23423', N'CUIL', 0, 0, 1, 53713, N'P@gmaas', 4001)
INSERT [dbo].[Usuario] ([Cod_usuario], [Nombre], [Apellido], [Contraseña], [Nro_documento], [Tipo_documento], [Cantidad_ingresos_incorrectos], [Bloqueado], [Idioma], [DVH], [Email], [Terminal]) VALUES (N'A10029', N'wETcrbPfpqPz0bP9I8SKpg==', N'Final 2', N'a9243790558870c3dcbc37f6379c79d0', N'23423', N'CUIL', 0, 0, 1, 91936, N'fasdf', 4001)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (1, N'A10001', 1376, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (1, N'A10009', 1424, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (1, N'A10016', 1411, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (1, N'A10017', 1417, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (1, N'A10019', 1429, 1)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (1, N'A10021', 1386, 1)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (1, N'A10022', 1392, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (1, N'A10026', 1416, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (1, N'A10028', 1428, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (2, N'A10001', 1383, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (2, N'A10009', 1431, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (2, N'A10012', 1394, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (2, N'A10016', 1418, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (2, N'A10017', 1424, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (2, N'A10021', 1393, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (2, N'A10022', 1399, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (2, N'A10026', 1423, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (2, N'A10027', 1429, 1)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (2, N'A10028', 1435, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (3, N'A10001', 1390, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (3, N'A10016', 1425, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (3, N'A10017', 1431, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (3, N'A10021', 1400, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (3, N'A10026', 1430, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (3, N'A10028', 1442, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (4, N'A10001', 1397, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (4, N'A10016', 1432, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (4, N'A10017', 1438, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (4, N'A10021', 1407, 1)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (4, N'A10022', 1413, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (4, N'A10026', 1437, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (4, N'A10028', 1449, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (5, N'A10001', 1404, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (5, N'A10016', 1439, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (5, N'A10017', 1445, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (5, N'A10026', 1444, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (5, N'A10028', 1456, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (6, N'A10001', 1411, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (6, N'A10016', 1446, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (6, N'A10017', 1452, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (6, N'A10026', 1451, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (6, N'A10028', 1463, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (7, N'A10001', 1418, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (7, N'A10016', 1453, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (7, N'A10017', 1459, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (7, N'A10026', 1458, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (7, N'A10028', 1470, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (8, N'A10001', 1425, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (8, N'A10016', 1460, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (8, N'A10017', 1466, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (8, N'A10026', 1465, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (8, N'A10028', 1477, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (9, N'A10001', 1432, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (9, N'A10016', 1467, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (9, N'A10017', 1473, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (9, N'A10026', 1472, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (9, N'A10028', 1484, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (10, N'A10001', 1760, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (10, N'A10016', 1795, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (10, N'A10017', 1801, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (10, N'A10026', 1800, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (10, N'A10028', 1812, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (11, N'A10001', 1768, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (11, N'A10016', 1803, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (11, N'A10017', 1809, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (11, N'A10026', 1808, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (11, N'A10028', 1820, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (12, N'A10001', 1776, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (12, N'A10016', 1811, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (12, N'A10017', 1817, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (12, N'A10026', 1816, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (12, N'A10028', 1828, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (13, N'A10001', 1784, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (13, N'A10016', 1819, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (13, N'A10017', 1825, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (13, N'A10026', 1824, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (13, N'A10028', 1836, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (14, N'A10001', 1792, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (14, N'A10016', 1827, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (14, N'A10017', 1833, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (14, N'A10026', 1832, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (14, N'A10028', 1844, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (15, N'A10001', 1800, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (15, N'A10016', 1835, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (15, N'A10026', 1840, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (15, N'A10028', 1852, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (16, N'A10001', 1808, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (16, N'A10016', 1843, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (16, N'A10017', 1849, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (16, N'A10026', 1848, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (16, N'A10028', 1860, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (17, N'A10001', 1816, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (17, N'A10016', 1851, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (17, N'A10017', 1857, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (17, N'A10026', 1856, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (17, N'A10028', 1868, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (18, N'A10001', 1824, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (18, N'A10016', 1859, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (18, N'A10017', 1865, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (18, N'A10026', 1864, 0)
GO
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (18, N'A10028', 1876, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (19, N'A10001', 1832, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (19, N'A10016', 1867, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (19, N'A10017', 1873, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (19, N'A10026', 1872, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (19, N'A10028', 1884, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (20, N'A10001', 1767, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (20, N'A10016', 1802, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (20, N'A10017', 1808, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (20, N'A10026', 1807, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (20, N'A10028', 1819, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (21, N'A10001', 1775, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (21, N'A10016', 1810, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (21, N'A10017', 1816, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (21, N'A10026', 1815, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (21, N'A10028', 1827, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (22, N'A10001', 1783, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (22, N'A10016', 1818, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (22, N'A10017', 1824, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (22, N'A10023', 1805, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (22, N'A10026', 1823, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (22, N'A10028', 1835, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (23, N'A10001', 1791, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (23, N'A10016', 1826, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (23, N'A10017', 1832, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (23, N'A10023', 1813, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (23, N'A10026', 1831, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (23, N'A10028', 1843, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (24, N'A10001', 1799, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (24, N'A10016', 1834, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (24, N'A10017', 1840, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (24, N'A10023', 1821, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (24, N'A10026', 1839, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (24, N'A10028', 1851, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (25, N'A10001', 1807, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (25, N'A10016', 1842, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (25, N'A10017', 1848, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (25, N'A10023', 1829, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (25, N'A10026', 1847, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (25, N'A10028', 1859, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (26, N'A10001', 1815, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (26, N'A10016', 1850, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (26, N'A10017', 1856, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (26, N'A10023', 1837, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (26, N'A10026', 1855, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (26, N'A10028', 1867, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (27, N'A10001', 1823, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (27, N'A10016', 1858, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (27, N'A10017', 1864, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (27, N'A10023', 1845, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (27, N'A10026', 1863, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (27, N'A10028', 1875, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (28, N'A10001', 1831, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (28, N'A10016', 1866, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (28, N'A10017', 1872, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (28, N'A10026', 1871, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (28, N'A10028', 1883, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (29, N'A10001', 1839, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (29, N'A10016', 1874, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (29, N'A10017', 1880, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (29, N'A10023', 1861, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (29, N'A10026', 1879, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (29, N'A10028', 1891, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (30, N'A10001', 1774, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (30, N'A10016', 1809, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (30, N'A10017', 1815, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (30, N'A10023', 1796, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (30, N'A10026', 1814, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (30, N'A10028', 1826, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (31, N'A10001', 1782, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (31, N'A10016', 1817, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (31, N'A10017', 1823, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (31, N'A10023', 1804, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (31, N'A10026', 1822, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (31, N'A10028', 1834, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (32, N'A10001', 1790, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (32, N'A10016', 1825, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (32, N'A10017', 1831, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (32, N'A10023', 1812, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (32, N'A10026', 1830, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (32, N'A10028', 1842, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (33, N'A10001', 1798, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (33, N'A10016', 1833, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (33, N'A10017', 1839, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (33, N'A10023', 1820, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (33, N'A10026', 1838, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (33, N'A10028', 1850, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (34, N'A10001', 1806, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (34, N'A10016', 1841, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (34, N'A10017', 1847, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (34, N'A10023', 1828, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (34, N'A10026', 1846, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (34, N'A10028', 1858, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (35, N'A10001', 1814, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (35, N'A10016', 1849, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (35, N'A10017', 1855, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (35, N'A10023', 1836, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (35, N'A10026', 1854, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (35, N'A10028', 1866, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (36, N'A10001', 1822, 0)
GO
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (36, N'A10016', 1857, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (36, N'A10017', 1863, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (36, N'A10023', 1844, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (36, N'A10026', 1862, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (36, N'A10028', 1874, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (37, N'A10001', 1830, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (37, N'A10003', 1842, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (37, N'A10016', 1865, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (37, N'A10017', 1871, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (37, N'A10023', 1852, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (37, N'A10026', 1870, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (37, N'A10028', 1882, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (38, N'A10001', 1838, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (38, N'A10016', 1873, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (38, N'A10017', 1879, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (38, N'A10023', 1860, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (38, N'A10026', 1878, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (38, N'A10028', 1890, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (39, N'A10001', 1846, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (39, N'A10016', 1881, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (39, N'A10017', 1887, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (39, N'A10023', 1868, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (39, N'A10026', 1886, 0)
INSERT [dbo].[UsuarioPatente] ([Id_patente], [cod_usuario], [DVH], [Negado]) VALUES (39, N'A10028', 1898, 0)
ALTER TABLE [dbo].[Documento]  WITH CHECK ADD  CONSTRAINT [FK_Documento_Documento] FOREIGN KEY([nroDocumento], [tipoDocumento])
REFERENCES [dbo].[Documento] ([nroDocumento], [tipoDocumento])
GO
ALTER TABLE [dbo].[Documento] CHECK CONSTRAINT [FK_Documento_Documento]
GO
ALTER TABLE [dbo].[FamiliaPatente]  WITH CHECK ADD  CONSTRAINT [FK_FamiliaPatente_Familia] FOREIGN KEY([Id_familia])
REFERENCES [dbo].[Familia] ([Id_familia])
GO
ALTER TABLE [dbo].[FamiliaPatente] CHECK CONSTRAINT [FK_FamiliaPatente_Familia]
GO
ALTER TABLE [dbo].[FamiliaPatente]  WITH CHECK ADD  CONSTRAINT [FK_FamiliaPatente_Patente] FOREIGN KEY([Id_patente])
REFERENCES [dbo].[Patente] ([Id_patente])
GO
ALTER TABLE [dbo].[FamiliaPatente] CHECK CONSTRAINT [FK_FamiliaPatente_Patente]
GO
ALTER TABLE [dbo].[FamiliaUsuario]  WITH CHECK ADD  CONSTRAINT [FK_FamiliaUsuario_Familia] FOREIGN KEY([Id_familia])
REFERENCES [dbo].[Familia] ([Id_familia])
GO
ALTER TABLE [dbo].[FamiliaUsuario] CHECK CONSTRAINT [FK_FamiliaUsuario_Familia]
GO
ALTER TABLE [dbo].[FamiliaUsuario]  WITH CHECK ADD  CONSTRAINT [FK_FamiliaUsuario_FamiliaUsuario] FOREIGN KEY([Id_familia], [Cod_usuario])
REFERENCES [dbo].[FamiliaUsuario] ([Id_familia], [Cod_usuario])
GO
ALTER TABLE [dbo].[FamiliaUsuario] CHECK CONSTRAINT [FK_FamiliaUsuario_FamiliaUsuario]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [FK_Pedido_Producto] FOREIGN KEY([codProducto])
REFERENCES [dbo].[Producto] ([Cod_Producto])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [FK_Pedido_Producto]
GO
ALTER TABLE [dbo].[Tanque]  WITH CHECK ADD  CONSTRAINT [FK_Tanque_Producto] FOREIGN KEY([codProducto])
REFERENCES [dbo].[Producto] ([Cod_Producto])
GO
ALTER TABLE [dbo].[Tanque] CHECK CONSTRAINT [FK_Tanque_Producto]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Idioma] FOREIGN KEY([Idioma])
REFERENCES [dbo].[Idioma] ([Id_idioma])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Idioma]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Terminal] FOREIGN KEY([Terminal])
REFERENCES [dbo].[Terminal] ([codTerminal])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Terminal]
GO
USE [master]
GO
ALTER DATABASE [ProyectoAnalista] SET  READ_WRITE 
GO
