USE [master]
GO
/****** Object:  Database [dbRRHH]    Script Date: 6/11/2019 22:25:49 ******/
CREATE DATABASE [dbRRHH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbRRHH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dbRRHH.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbRRHH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dbRRHH_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dbRRHH] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbRRHH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbRRHH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbRRHH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbRRHH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbRRHH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbRRHH] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbRRHH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbRRHH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbRRHH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbRRHH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbRRHH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbRRHH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbRRHH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbRRHH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbRRHH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbRRHH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbRRHH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbRRHH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbRRHH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbRRHH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbRRHH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbRRHH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbRRHH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbRRHH] SET RECOVERY FULL 
GO
ALTER DATABASE [dbRRHH] SET  MULTI_USER 
GO
ALTER DATABASE [dbRRHH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbRRHH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbRRHH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbRRHH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbRRHH] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbRRHH', N'ON'
GO
ALTER DATABASE [dbRRHH] SET QUERY_STORE = OFF
GO
USE [dbRRHH]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 6/11/2019 22:25:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[codArea] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[codArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 6/11/2019 22:25:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[codEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[dni] [char](8) NULL,
	[nombres] [varchar](40) NULL,
	[apellidos] [varchar](40) NULL,
	[fecNacimiento] [datetime] NULL,
	[fecContratacion] [datetime] NULL,
	[salario] [money] NULL,
	[codarea] [int] NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[codEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleos]    Script Date: 6/11/2019 22:25:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleos](
	[CodEmpleo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[SalarioMinimo] [money] NULL,
	[SalarioMaximo] [money] NULL,
 CONSTRAINT [PK_Empleos] PRIMARY KEY CLUSTERED 
(
	[CodEmpleo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistorialEmpleos]    Script Date: 6/11/2019 22:25:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistorialEmpleos](
	[codEmpleado] [int] NOT NULL,
	[codEmple] [int] NOT NULL,
	[fecInicio] [datetime] NULL,
	[fecfin] [datetime] NULL,
 CONSTRAINT [PK_HistorialEmpleos] PRIMARY KEY CLUSTERED 
(
	[codEmpleado] ASC,
	[codEmple] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Area] FOREIGN KEY([codarea])
REFERENCES [dbo].[Area] ([codArea])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_Area]
GO
ALTER TABLE [dbo].[HistorialEmpleos]  WITH CHECK ADD  CONSTRAINT [FK_HistorialEmpleos_Empleados] FOREIGN KEY([codEmpleado])
REFERENCES [dbo].[Empleados] ([codEmpleado])
GO
ALTER TABLE [dbo].[HistorialEmpleos] CHECK CONSTRAINT [FK_HistorialEmpleos_Empleados]
GO
ALTER TABLE [dbo].[HistorialEmpleos]  WITH CHECK ADD  CONSTRAINT [FK_HistorialEmpleos_Empleos] FOREIGN KEY([codEmple])
REFERENCES [dbo].[Empleos] ([CodEmpleo])
GO
ALTER TABLE [dbo].[HistorialEmpleos] CHECK CONSTRAINT [FK_HistorialEmpleos_Empleos]
GO
USE [master]
GO
ALTER DATABASE [dbRRHH] SET  READ_WRITE 
GO
