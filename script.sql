USE [master]
GO
/****** Object:  Database [EjParcial]    Script Date: 10/10/2018 9:47:18 ******/
CREATE DATABASE [EjParcial]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EjParcial', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EjParcial.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EjParcial_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EjParcial_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EjParcial] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EjParcial].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EjParcial] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EjParcial] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EjParcial] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EjParcial] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EjParcial] SET ARITHABORT OFF 
GO
ALTER DATABASE [EjParcial] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EjParcial] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EjParcial] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EjParcial] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EjParcial] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EjParcial] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EjParcial] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EjParcial] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EjParcial] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EjParcial] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EjParcial] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EjParcial] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EjParcial] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EjParcial] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EjParcial] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EjParcial] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EjParcial] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EjParcial] SET RECOVERY FULL 
GO
ALTER DATABASE [EjParcial] SET  MULTI_USER 
GO
ALTER DATABASE [EjParcial] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EjParcial] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EjParcial] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EjParcial] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EjParcial] SET DELAYED_DURABILITY = DISABLED 
GO
USE [EjParcial]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 10/10/2018 9:47:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[edad] [int] NULL,
	[NombreEmpresa] [nvarchar](50) NULL,
	[TelefonoContacto] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 10/10/2018 9:47:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[IdEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[edad] [int] NOT NULL,
	[SueldoBruto] [int] NOT NULL,
	[IdEmpresa] [int] NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 10/10/2018 9:47:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa](
	[IdEmpresa] [int] NOT NULL,
	[NombreEmpresa] [nvarchar](50) NULL,
 CONSTRAINT [PK_Empresa] PRIMARY KEY CLUSTERED 
(
	[IdEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([IdCliente], [nombre], [edad], [NombreEmpresa], [TelefonoContacto]) VALUES (1, N'sadas', 22, N'dasdas', N'asdsa')
INSERT [dbo].[Cliente] ([IdCliente], [nombre], [edad], [NombreEmpresa], [TelefonoContacto]) VALUES (2, N'matias', 54, N'mdas', N'asdas')
INSERT [dbo].[Cliente] ([IdCliente], [nombre], [edad], [NombreEmpresa], [TelefonoContacto]) VALUES (3, N'carlos', 20, N'accenture', N'1452453')
INSERT [dbo].[Cliente] ([IdCliente], [nombre], [edad], [NombreEmpresa], [TelefonoContacto]) VALUES (4, N'pepe', 32, N'Capgemini', N'123123')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
INSERT [dbo].[Empresa] ([IdEmpresa], [NombreEmpresa]) VALUES (0, N'Accenture')
INSERT [dbo].[Empresa] ([IdEmpresa], [NombreEmpresa]) VALUES (1, N'Neoris')
INSERT [dbo].[Empresa] ([IdEmpresa], [NombreEmpresa]) VALUES (2, N'Capgemini')
INSERT [dbo].[Empresa] ([IdEmpresa], [NombreEmpresa]) VALUES (3, N'Santander')
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Empresa] FOREIGN KEY([IdEmpresa])
REFERENCES [dbo].[Empresa] ([IdEmpresa])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Empresa]
GO
USE [master]
GO
ALTER DATABASE [EjParcial] SET  READ_WRITE 
GO
