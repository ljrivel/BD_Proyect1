USE [master]
GO
/****** Object:  Database [Planilla_Empleados]    Script Date: 30/6/2021 19:58:35 ******/
CREATE DATABASE [Planilla_Empleados]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Planilla_Empleados', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Planilla_Empleados.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Planilla_Empleados_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Planilla_Empleados_log.ldf' , SIZE = 2760704KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Planilla_Empleados] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Planilla_Empleados].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Planilla_Empleados] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Planilla_Empleados] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Planilla_Empleados] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Planilla_Empleados] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Planilla_Empleados] SET ARITHABORT OFF 
GO
ALTER DATABASE [Planilla_Empleados] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Planilla_Empleados] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Planilla_Empleados] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Planilla_Empleados] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Planilla_Empleados] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Planilla_Empleados] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Planilla_Empleados] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Planilla_Empleados] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Planilla_Empleados] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Planilla_Empleados] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Planilla_Empleados] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Planilla_Empleados] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Planilla_Empleados] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Planilla_Empleados] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Planilla_Empleados] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Planilla_Empleados] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Planilla_Empleados] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Planilla_Empleados] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Planilla_Empleados] SET  MULTI_USER 
GO
ALTER DATABASE [Planilla_Empleados] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Planilla_Empleados] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Planilla_Empleados] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Planilla_Empleados] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Planilla_Empleados] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Planilla_Empleados] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Planilla_Empleados', N'ON'
GO
ALTER DATABASE [Planilla_Empleados] SET QUERY_STORE = OFF
GO
USE [Planilla_Empleados]
GO
/****** Object:  Table [dbo].[Corrida]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Corrida](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FechaOperacion] [date] NOT NULL,
	[TipoRegistro] [int] NOT NULL,
	[PostTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeduccionesXEmpleado]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeduccionesXEmpleado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[IdDeduccion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeduccionNoObligatoria]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeduccionNoObligatoria](
	[Id] [int] NOT NULL,
	[Monto] [float] NOT NULL,
	[Activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeduccionObligatoria]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeduccionObligatoria](
	[Id] [int] NOT NULL,
	[Monto] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamentos]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamentos](
	[Id] [int] NOT NULL,
	[Activo] [binary](1) NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleCorrida]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleCorrida](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCorrida] [int] NOT NULL,
	[IdTipoOperacionXML] [int] NOT NULL,
	[Secuencia] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoIdentificacion] [int] NOT NULL,
	[IdPuesto] [int] NOT NULL,
	[IdDepartamento] [int] NOT NULL,
	[Activo] [binary](1) NOT NULL,
	[ValorDocIdentidad] [int] NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
	[FechaDeNacimiento] [date] NOT NULL,
	[Usuario] [varchar](32) NULL,
	[Pwd] [varchar](32) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feriado]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feriado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MarcaAsistencia]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarcaAsistencia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdSemanaPlanillaXEmpleado] [int] NOT NULL,
	[HoraEntrada] [datetime] NOT NULL,
	[HoraSalida] [datetime] NOT NULL,
	[HorasOrdinarias] [int] NOT NULL,
	[HorasExtraNormales] [int] NOT NULL,
	[HorasExtraDobles] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MesPlanilla]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MesPlanilla](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MesPlanillaXEmpleado]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MesPlanillaXEmpleado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdMesPlanilla] [int] NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[SalarioNeto] [money] NOT NULL,
	[SalarioTotal] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientoPlanilla]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientoPlanilla](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoMovimiento] [int] NOT NULL,
	[IdSemanaPlanillaXEmpleado] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Monto] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Puesto]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puesto](
	[Id] [int] NOT NULL,
	[Activo] [binary](1) NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
	[SalarioXHora] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SemanaPlanilla]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SemanaPlanilla](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdMesPlanilla] [int] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SemanaPlanillaXEmpleado]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SemanaPlanillaXEmpleado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[IdSemanaPlanilla] [int] NOT NULL,
	[IdTipoDeJornada] [int] NOT NULL,
	[SalarioNeto] [money] NOT NULL,
	[SalarioBruto] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_de_Documento_de_Identidad]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_de_Documento_de_Identidad](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDeduccion]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDeduccion](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
	[Obligatoria] [varchar](2) NOT NULL,
	[EsPorcentual] [varchar](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoJornada]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoJornada](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
	[HoraInicio] [time](7) NOT NULL,
	[HoraSalida] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimiento]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimiento](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimientoDeduccion]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimientoDeduccion](
	[Id] [int] NOT NULL,
	[IdDeduccion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoOperacionXML]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoOperacionXML](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Username] [varchar](64) NOT NULL,
	[pwd] [varchar](64) NOT NULL,
	[Type] [varchar](64) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Empleados] ADD  CONSTRAINT [DF_Empleados_Activo]  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[DeduccionesXEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_Deduccion_Empleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleados] ([Id])
GO
ALTER TABLE [dbo].[DeduccionesXEmpleado] CHECK CONSTRAINT [FK_Deduccion_Empleado]
GO
ALTER TABLE [dbo].[DeduccionesXEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_Deduccion_TipoDeduccion] FOREIGN KEY([IdDeduccion])
REFERENCES [dbo].[TipoDeduccion] ([Id])
GO
ALTER TABLE [dbo].[DeduccionesXEmpleado] CHECK CONSTRAINT [FK_Deduccion_TipoDeduccion]
GO
ALTER TABLE [dbo].[DeduccionNoObligatoria]  WITH CHECK ADD  CONSTRAINT [FK_Tipo_Deduccion_No_Obligatoria] FOREIGN KEY([Id])
REFERENCES [dbo].[DeduccionesXEmpleado] ([Id])
GO
ALTER TABLE [dbo].[DeduccionNoObligatoria] CHECK CONSTRAINT [FK_Tipo_Deduccion_No_Obligatoria]
GO
ALTER TABLE [dbo].[DeduccionObligatoria]  WITH CHECK ADD  CONSTRAINT [FK_Tipo_Deduccion_Obligatoria] FOREIGN KEY([Id])
REFERENCES [dbo].[TipoDeduccion] ([Id])
GO
ALTER TABLE [dbo].[DeduccionObligatoria] CHECK CONSTRAINT [FK_Tipo_Deduccion_Obligatoria]
GO
ALTER TABLE [dbo].[DetalleCorrida]  WITH CHECK ADD  CONSTRAINT [FK_IdCorrida] FOREIGN KEY([IdCorrida])
REFERENCES [dbo].[Corrida] ([Id])
GO
ALTER TABLE [dbo].[DetalleCorrida] CHECK CONSTRAINT [FK_IdCorrida]
GO
ALTER TABLE [dbo].[DetalleCorrida]  WITH CHECK ADD  CONSTRAINT [FK_IdTipoOperacionXML] FOREIGN KEY([IdTipoOperacionXML])
REFERENCES [dbo].[TipoOperacionXML] ([Id])
GO
ALTER TABLE [dbo].[DetalleCorrida] CHECK CONSTRAINT [FK_IdTipoOperacionXML]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Departamentos] FOREIGN KEY([IdDepartamento])
REFERENCES [dbo].[Departamentos] ([Id])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_Departamentos]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Puesto] FOREIGN KEY([IdPuesto])
REFERENCES [dbo].[Puesto] ([Id])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_Puesto]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_Tipo_de_Documento_de_Identidad] FOREIGN KEY([IdTipoIdentificacion])
REFERENCES [dbo].[Tipo_de_Documento_de_Identidad] ([Id])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_Empleados_Tipo_de_Documento_de_Identidad]
GO
ALTER TABLE [dbo].[MarcaAsistencia]  WITH CHECK ADD  CONSTRAINT [FK_Marca_AsistenciaIdSemanaPlanillaXEmpleado] FOREIGN KEY([IdSemanaPlanillaXEmpleado])
REFERENCES [dbo].[SemanaPlanillaXEmpleado] ([Id])
GO
ALTER TABLE [dbo].[MarcaAsistencia] CHECK CONSTRAINT [FK_Marca_AsistenciaIdSemanaPlanillaXEmpleado]
GO
ALTER TABLE [dbo].[MesPlanillaXEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleados_MesPlanilla] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleados] ([Id])
GO
ALTER TABLE [dbo].[MesPlanillaXEmpleado] CHECK CONSTRAINT [FK_Empleados_MesPlanilla]
GO
ALTER TABLE [dbo].[MesPlanillaXEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_Mes_MesPlanilla] FOREIGN KEY([IdMesPlanilla])
REFERENCES [dbo].[MesPlanilla] ([Id])
GO
ALTER TABLE [dbo].[MesPlanillaXEmpleado] CHECK CONSTRAINT [FK_Mes_MesPlanilla]
GO
ALTER TABLE [dbo].[MovimientoPlanilla]  WITH CHECK ADD  CONSTRAINT [FK_Id_Tipo_Movimiento] FOREIGN KEY([IdTipoMovimiento])
REFERENCES [dbo].[TipoMovimiento] ([Id])
GO
ALTER TABLE [dbo].[MovimientoPlanilla] CHECK CONSTRAINT [FK_Id_Tipo_Movimiento]
GO
ALTER TABLE [dbo].[MovimientoPlanilla]  WITH CHECK ADD  CONSTRAINT [FK_IdSPXE] FOREIGN KEY([IdSemanaPlanillaXEmpleado])
REFERENCES [dbo].[SemanaPlanillaXEmpleado] ([Id])
GO
ALTER TABLE [dbo].[MovimientoPlanilla] CHECK CONSTRAINT [FK_IdSPXE]
GO
ALTER TABLE [dbo].[SemanaPlanilla]  WITH CHECK ADD  CONSTRAINT [FK_Semana_Planilla] FOREIGN KEY([IdMesPlanilla])
REFERENCES [dbo].[MesPlanilla] ([Id])
GO
ALTER TABLE [dbo].[SemanaPlanilla] CHECK CONSTRAINT [FK_Semana_Planilla]
GO
ALTER TABLE [dbo].[SemanaPlanillaXEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_Planilla_Empleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleados] ([Id])
GO
ALTER TABLE [dbo].[SemanaPlanillaXEmpleado] CHECK CONSTRAINT [FK_Planilla_Empleado]
GO
ALTER TABLE [dbo].[SemanaPlanillaXEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_PlanillaXEmpleado_SemanaPlanilla] FOREIGN KEY([IdSemanaPlanilla])
REFERENCES [dbo].[SemanaPlanilla] ([Id])
GO
ALTER TABLE [dbo].[SemanaPlanillaXEmpleado] CHECK CONSTRAINT [FK_PlanillaXEmpleado_SemanaPlanilla]
GO
ALTER TABLE [dbo].[SemanaPlanillaXEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_PlanillaXEmpleado_TipoJornada] FOREIGN KEY([IdTipoDeJornada])
REFERENCES [dbo].[TipoJornada] ([Id])
GO
ALTER TABLE [dbo].[SemanaPlanillaXEmpleado] CHECK CONSTRAINT [FK_PlanillaXEmpleado_TipoJornada]
GO
ALTER TABLE [dbo].[TipoMovimientoDeduccion]  WITH CHECK ADD  CONSTRAINT [FK_Id] FOREIGN KEY([Id])
REFERENCES [dbo].[MovimientoPlanilla] ([Id])
GO
ALTER TABLE [dbo].[TipoMovimientoDeduccion] CHECK CONSTRAINT [FK_Id]
GO
ALTER TABLE [dbo].[TipoMovimientoDeduccion]  WITH CHECK ADD  CONSTRAINT [FK_Id_Deduccion] FOREIGN KEY([IdDeduccion])
REFERENCES [dbo].[TipoDeduccion] ([Id])
GO
ALTER TABLE [dbo].[TipoMovimientoDeduccion] CHECK CONSTRAINT [FK_Id_Deduccion]
GO
/****** Object:  StoredProcedure [dbo].[Actualizar_Puesto]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Actualizar_Puesto]
	@inId int,
	@inNuevoNombre varchar(64),
	@inNuevoSalario money
AS
BEGIN

	SET NOCOUNT ON;
	UPDATE dbo.Puesto
	SET Nombre=@inNuevoNombre, SalarioXHora=@inNuevoSalario
	WHERE Id=@inId
	SET NOCOUNT OFF;
END	
GO
/****** Object:  StoredProcedure [dbo].[Add_Empleado]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_Empleado]
	@inIdTipoId INT,
	@inIdPuesto INT,
	@inIdDepartamento INT,
	@inValorId INT,
	@inNombre VARCHAR(64),
	@inFechaNacimiento DATE,
	@inUsuario VARCHAR(32),
	@inPassword VARCHAR(32),
	@outCode INT OUT
AS
BEGIN

	SET NOCOUNT ON;
	BEGIN TRY
		INSERT INTO Empleados (IdTipoIdentificacion, IdPuesto, IdDepartamento, Activo, ValorDocIdentidad, Nombre, FechaDeNacimiento, Usuario, Pwd) 
		VALUES (@inIdTipoId, @inIdPuesto, @inIdDepartamento, 1, @inValorId, @inNombre, @inFechaNacimiento, @inUsuario, @inPassword)
		SET @outCode = 50001 -- Operacion Exitosa
	END TRY
	BEGIN CATCH
		SET @outCode = 50002

	END CATCH
	SET NOCOUNT OFF;
END	
GO
/****** Object:  StoredProcedure [dbo].[Add_Puesto]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_Puesto]
	@inNombre varchar(40),
	@inSalario money
AS
BEGIN

	SET NOCOUNT ON;
	DECLARE @idMax int
	SELECT @idMax = Max(Id) FROM Puesto

	IF (SELECT COUNT(*) FROM Puesto)=0
	BEGIN
		SET @idMax = 0
	END

	INSERT INTO Puesto VALUES (@idMax+1,1, @inNombre,@inSalario)
	SET NOCOUNT OFF;
END	
GO
/****** Object:  StoredProcedure [dbo].[AsociarEmpleadoConDeduccion]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AsociarEmpleadoConDeduccion]
	@inValorDocID INT,
	@inIdDeduccion INT,
	@inMonto FLOAT,
	@outResultCode INT OUT
AS BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		BEGIN TRANSACTION AsociarDeduccion
			DECLARE @idEmpleado INT
			SELECT @idEmpleado = Id FROM Empleados WHERE ValorDocIdentidad = @inValorDocID

			DECLARE @existe INT
			SELECT @existe = Id
			FROM DeduccionesXEmpleado
			WHERE IdEmpleado = @idEmpleado AND IdDeduccion = @inIdDeduccion

			IF (@existe > 0)
			BEGIN
				UPDATE DeduccionNoObligatoria
				SET Monto = @inMonto, Activo = 1
				WHERE Id = @existe
			END

			ELSE
			BEGIN
				INSERT INTO DeduccionesXEmpleado (IdEmpleado, IdDeduccion)
				VALUES (@idEmpleado, @inIdDeduccion)

				DECLARE @idDeduccion INT
				SELECT @idDeduccion = Id 
				FROM DeduccionesXEmpleado 
				WHERE IdEmpleado = @idEmpleado AND IdDeduccion = @inIdDeduccion

				INSERT INTO DeduccionNoObligatoria (Id, Monto, Activo)
				VALUES (@idDeduccion, @inMonto, 1)
			END

			SET @outResultCode = 50001

		COMMIT TRANSACTION AsociarDeduccion
		--PRINT 'SE REALIZÓ LA ASOCIACION'
	END TRY
	BEGIN CATCH
		IF (@@TRANCOUNT > 0)
		BEGIN
			ROLLBACK TRANSACTION AsociarDeduccion
		END
		SET @outResultCode = 50005
	END CATCH
	SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[Borrar_Empleado]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Borrar_Empleado]
	@inId INT
AS
BEGIN
	SET NOCOUNT ON;
		BEGIN TRY
		IF EXISTS(SELECT 1 FROM Empleados E WHERE E.Activo=1)
		BEGIN
			UPDATE Empleados
			SET Activo=0
			WHERE Id=@inId
		END

	END TRY
	BEGIN CATCH
	END CATCH

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Borrar_Puesto]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Borrar_Puesto]
	@inId INT,
	@outResultCode INT OUT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		DECLARE @cantidadEmpleadosAsociados INT
		SELECT @cantidadEmpleadosAsociados = COUNT(*)
		FROM Empleados 
		WHERE IdPuesto = @inId AND Activo = 1
		
		IF (@cantidadEmpleadosAsociados = 0)
		BEGIN
			UPDATE dbo.Puesto
			SET Activo=0
			WHERE Id=@inId
		END

		SET @outResultCode = 50001
	END TRY
	BEGIN CATCH
		SET @outResultCode = 50005
	END CATCH
	SET NOCOUNT OFF;
END	
GO
/****** Object:  StoredProcedure [dbo].[CargarCatalogosXML]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CargarCatalogosXML] 
	@outResultCode INT OUT,
	@outResultMessage VARCHAR(64) OUT
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		BEGIN TRANSACTION CargarDatos

			DECLARE @doc XML
			SELECT @doc = BulkColumn
			FROM OPENROWSET(BULK 'C:\ArchivosProyecto\Datos_Tarea3.xml', SINGLE_CLOB) AS xmlData

			INSERT INTO Users (Username, pwd, Type)
			SELECT  U.value('@username', 'VARCHAR(64)'), U.value('@pwd', 'VARCHAR(64)'), U.value('@tipo', 'VARCHAR(64)')
			FROM    @doc.nodes('/Datos/Usuarios/Usuario') as x1(U)

		--Insertar Puestos
			INSERT INTO Puesto (Id, Activo, Nombre, SalarioXHora)
			SELECT  P.value('@Id', 'INT'), 1, P.value('@Nombre', 'VARCHAR(32)'), P.value('@SalarioXHora', 'MONEY')
			FROM    @doc.nodes('/Datos/Catalogos/Puestos/Puesto') as x1(P)

		--Insertar Departamentos
			INSERT INTO Departamentos (Id, Activo, Nombre)
			SELECT  D.value('@Id', 'INT'), 1, D.value('@Nombre', 'VARCHAR(32)')
			FROM    @doc.nodes('/Datos/Catalogos/Departamentos/Departamento') as x1(D)

		--Insertar Tipos_de_Documento_Identidad
			INSERT INTO Tipo_de_Documento_de_Identidad (Id, Nombre)
			SELECT  TID.value('@Id', 'INT'), TID.value('@Nombre', 'VARCHAR(32)')
			FROM    @doc.nodes('/Datos/Catalogos/Tipos_de_Documento_de_Identificacion/TipoIdDoc') as x1(TID)

		--Insertar TipoDeJornada
			INSERT INTO TipoJornada(Id, Nombre, HoraInicio, HoraSalida)
			SELECT  TJ.value('@Id', 'INT'), TJ.value('@Nombre', 'VARCHAR(32)'), 
					TJ.value('@HoraEntrada', 'DATETIME'), TJ.value('@HoraSalida', 'DATETIME')
			FROM    @doc.nodes('/Datos/Catalogos/TiposDeJornada/TipoDeJornada') as x1(TJ)

		--Insertar Tipo de movimientos
			INSERT INTO TipoMovimiento (Id, Nombre)
			SELECT  TM.value('@Id', 'INT'), TM.value('@Nombre', 'VARCHAR(32)')
			FROM    @doc.nodes('/Datos/Catalogos/TiposDeMovimiento/TipoDeMovimiento') as x1(TM)

		--Insertar Feriado
			INSERT INTO Feriado(Fecha, Nombre)
			SELECT  F.value('@Fecha', 'DATE'), F.value('@Nombre', 'VARCHAR(32)')
			FROM    @doc.nodes('/Datos/Catalogos/Feriados/Feriado') as x1(F)

		
		--Insertar Tipos de Deducción
		
			DECLARE @doccnt INT,@XmlDoc XML
			EXEC sp_xml_preparedocument @doccnt OUTPUT,@doc

			DECLARE @size INT
			SELECT @size  = COUNT(*) FROM OPENXML(@doccnt,'Datos/Catalogos/Deducciones/TipoDeDeduccion',1) WITH(Id INT)
		

			DECLARE @Cont INT = 1;

			WHILE(@Cont <= @Size) 
			BEGIN
			
				DECLARE @ruta VARCHAR(128)
				DECLARE @id INT;
				DECLARE @nombre VARCHAR(32);
				DECLARE @obligatorio VARCHAR(2)
				DECLARE @porcentual VARCHAR(2)
				DECLARE @valor FLOAT

				SET @ruta = 'Datos/Catalogos/Deducciones/TipoDeDeduccion['+CAST(@Cont AS VARCHAR(10))+']'


				SELECT @id = Id,
					   @nombre = Nombre,
					   @obligatorio = Obligatorio,
					   @porcentual = Porcentual,
					   @valor = Valor
				FROM OPENXML(@doccnt, @ruta, 1)
				WITH(Id INT, Nombre VARCHAR(64), Obligatorio VARCHAR(2), Porcentual VARCHAR(2), Valor FLOAT)t 

				SET @Cont += 1;

				INSERT INTO TipoDeduccion (Id, Nombre, Obligatoria, EsPorcentual)
				VALUES (@id, @nombre, @obligatorio, @porcentual) 

				IF (@obligatorio = 'Si') 
				BEGIN
					INSERT INTO DeduccionObligatoria (Id, Monto)
					VALUES (@id, @valor)
				END
			END

			INSERT INTO TipoOperacionXML (Id, Nombre)
			VALUES	(1, 'Agregar Empleado'),
					(2,'Eliminar Empleado'),
					(3, 'Asociar Deduccion'),
					(4, 'Desasociar Deduccion'),
					(5, 'Jornada para la nueva semana'),
					(6, 'Procesar Asistencia')
		
			-- EXEC CargarOperaciones @doc
			SET @outResultCode = 50001
			SET @outResultMessage = 'Se cargaron los catalogos'
		COMMIT TRANSACTION CargarDatos
	END TRY
	BEGIN CATCH
		IF (@@TRANCOUNT > 0)
		BEGIN
			ROLLBACK TRANSACTION CargarDatos
		END
		SET @outResultCode = 50005
		SET @outResultMessage = 'Error al cargar los catalogos'
	END CATCH 
	PRINT @outResultMessage
	SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[CargarOperaciones]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CargarOperaciones]
	@outResultCode INT OUT,
	@outResultMessage VARCHAR(128) OUT
AS BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		--BEGIN TRANSACTION Cargar_Operaciones

		DECLARE @doc XML
		SELECT @doc = BulkColumn
		FROM OPENROWSET(BULK 'C:\ArchivosProyecto\Datos_Tarea3.xml', SINGLE_CLOB) AS xmlData

		DECLARE @doccnt INT,@XmlDoc XML
		EXEC sp_xml_preparedocument @doccnt OUTPUT,@doc

		DECLARE @size INT
		SELECT @size  = COUNT(*) FROM OPENXML(@doccnt,'Datos/Operacion',1) WITH(Id INT)

		DECLARE @ContOperaciones INT = 1;

		DECLARE @idCorrida INT, @tipoRegistro INT
		SELECT @idCorrida = MAX(Id)
		FROM dbo.Corrida

		SELECT @idCorrida = MAX(IdCorrida)
		FROM dbo.DetalleCorrida

		SELECT @tipoRegistro = TipoRegistro
		FROM dbo.Corrida
		WHERE Id = @idCorrida

		DECLARE @reinicio BIT, @tipoOperacionXML INT, @secuenciaXML INT
		SET @reinicio = 0

		-- Debería iniciar en esto
		SET @tipoOperacionXML = 6
		SET @secuenciaXML = 0

		IF (@idCorrida > 0)
		BEGIN
			SELECT @ContOperaciones += COUNT(DISTINCT FechaOperacion)
			FROM dbo.Corrida

			IF (@tipoRegistro = 1)
			BEGIN
				SET @ContOperaciones -= 1
				SET @reinicio = 1

				DECLARE @idDetalleCorrida INT
				SELECT @idDetalleCorrida = MAX(Id) 
				FROM dbo.DetalleCorrida
				WHERE IdCorrida = @idCorrida

				SELECT	@tipoOperacionXML = IdTipoOperacionXML,
						@secuenciaXML = Secuencia
				FROM dbo.DetalleCorrida
				WHERE Id = @idDetalleCorrida
			END
		END

		PRINT ('Secuencia = ' + CAST (@secuenciaXML AS VARCHAR(10)))
		PRINT ('TipoOperacion = ' + CAST (@tipoOperacionXML AS VARCHAR(10)))

		WHILE(@ContOperaciones <= @Size) 
		BEGIN
			DECLARE @ruta VARCHAR(128)
			DECLARE @fechaOperacion DATE
			DECLARE @marcaAsistencia XML

			SET @ruta = 'Datos/Operacion['+CAST(@ContOperaciones AS VARCHAR(10))+']'

			SELECT @fechaOperacion = Fecha
			FROM OPENXML(@doccnt, @ruta, 1)
			WITH(Fecha DATE)t 

			INSERT INTO dbo.Corrida (FechaOperacion, PostTime, TipoRegistro)
			VALUES (@fechaOperacion, GETDATE(), 1)

			SELECT @idCorrida = MAX(Id)
			FROM dbo.Corrida

			PRINT ('Fecha = ' + CAST(@fechaOperacion AS VARCHAR(10)))


		-- CARGAR LAS MARCAS DE ASISTENCIA	
			IF (@tipoOperacionXML = 6)
			BEGIN
				DECLARE @cantidadMarcasAsistencia INT
				DECLARE @rutaMarcas VARCHAR(128)
				SET @rutaMarcas = @ruta + '/MarcaDeAsistencia'

				SELECT @cantidadMarcasAsistencia  = COUNT(*) FROM OPENXML(@doccnt, @rutaMarcas, 1) WITH(Id INT)
	
				DECLARE @contadorMarcas INT
				SET @contadorMarcas = 1 + @secuenciaXML

				WHILE (@contadorMarcas <= @cantidadMarcasAsistencia)
				BEGIN
					DECLARE @rutaMarcaAsistencia VARCHAR(128)
					SET @rutaMarcaAsistencia = @rutaMarcas + '[' + CAST(@contadorMarcas AS VARCHAR(10)) + ']'

					DECLARE @valorDoc INT
					DECLARE @horaEntrada DATETIME, @horaSalida DATETIME

					DECLARE @errorMarcasAsistencia INT, @secuenciaMarcaAsistencia INT
		
					SELECT  @valorDoc = ValorDocumentoIdentidad,
							@horaEntrada = FechaEntrada,
							@horaSalida = FechaSalida,
							@errorMarcasAsistencia = ProduceError,
							@secuenciaMarcaAsistencia = Secuencia
					FROM OPENXML(@doccnt, @rutaMarcaAsistencia, 1)
					WITH (ValorDocumentoIdentidad INT, FechaEntrada DATETIME, FechaSalida DATETIME, ProduceError INT, Secuencia INT)t 

					IF (@errorMarcasAsistencia = 1 AND @reinicio = 0)
					BEGIN
						PRINT ('Error en MarcaAsistencia')
						PRINT (@secuenciaMarcaAsistencia)
						SET @errorMarcasAsistencia = @errorMarcasAsistencia / 0
					END
				
					ELSE
					BEGIN
						EXEC HacerMarcaAsistencia @valorDoc, @horaEntrada, @horaSalida, 0

						INSERT INTO dbo.DetalleCorrida (IdCorrida, IdTipoOperacionXML, Secuencia)
						VALUES (@idCorrida, 6, @secuenciaMarcaAsistencia)
						SET @reinicio = 0
					END
		
					SET @contadorMarcas += 1
				END

				SET @tipoOperacionXML = 1
				SET @secuenciaXML = 0
			END


			DECLARE @diaDeLaSemana VARCHAR(10)
			SET @diaDeLaSemana = DATENAME(dw,@fechaOperacion)
			IF (@diaDeLaSemana = 'Jueves' OR @diaDeLaSemana = 'Thursday')
			BEGIN 
				
			-- AÑADIR NUEVOS EMPLEADOS----------------------------------------------------
			IF (@tipoOperacionXML = 1)
			BEGIN
				DECLARE @cantidadNuevosEmpleados INT
				DECLARE @rutaEmpleados VARCHAR (128)
				
				SET @rutaEmpleados = @ruta + '/NuevoEmpleado'
				SELECT @cantidadNuevosEmpleados  = COUNT(*) FROM OPENXML(@doccnt, @rutaEmpleados, 1) WITH(Id INT)
				
				DECLARE @contadorEmpleados INT
				SET @contadorEmpleados = 1 + @secuenciaXML

				WHILE (@contadorEmpleados <= @cantidadNuevosEmpleados)
				BEGIN
					DECLARE @rutaNuevoEmpleado VARCHAR(128)
					SET @rutaNuevoEmpleado = @rutaEmpleados + '[' + CAST(@contadorEmpleados AS VARCHAR(10)) + ']'
					
					DECLARE @idPuesto INT, @idDepto INT, @idTipDocId INT
					DECLARE @valorDocumentoIdentidad INT, @nacimiento DATE
					DECLARE @nombre VARCHAR(64), @user VARCHAR(32), @pass VARCHAR(32)

					DECLARE @errorNuevoEmpleado INT, @secuenciaNuevoEmpleado INT


					SELECT  @idTipDocId = idTipoDocumentacionIdentidad,
							@idPuesto = idPuesto,
							@idDepto = idDepartamento,
							@valorDocumentoIdentidad = ValorDocumentoIdentidad,
							@nombre = Nombre,
							@nacimiento = FechaNacimiento,
							@user = Username,
							@pass = Password,
							@errorNuevoEmpleado = ProduceError,
							@secuenciaNuevoEmpleado = Secuencia
					FROM OPENXML(@doccnt, @rutaNuevoEmpleado, 1)
					WITH (idTipoDocumentacionIdentidad INT, idPuesto INT, idDepartamento INT, ValorDocumentoIdentidad INT, 
							Nombre VARCHAR(64), FechaNacimiento DATE, Username VARCHAR(32), Password VARCHAR(32),
							ProduceError INT, Secuencia INT)t 
					

					IF (@errorNuevoEmpleado = 1 AND @reinicio = 0)
					BEGIN
						PRINT ('Error NuevoEmpleado')

						SET @errorNuevoEmpleado = @errorNuevoEmpleado / 0
					END
					ELSE
					BEGIN
						EXEC Add_Empleado @idTipDocId, @idPuesto, @idDepto, @valorDocumentoIdentidad, @nombre, @nacimiento, @user, @pass, 1

						INSERT INTO dbo.DetalleCorrida (IdCorrida, IdTipoOperacionXML, Secuencia)
						VALUES (@idCorrida, 1, @secuenciaNuevoEmpleado)

						SET @reinicio = 0
					END

					-- SET @secuenciaXML = 0

					SET @contadorEmpleados += 1
				END -- FIN DEL WHILE PARA AÑADIR EMPLEADOS

				SET @tipoOperacionXML = 2
				SET @secuenciaXML = 0
			END


			--ELIMINAR EMPLEADOS------------------------------------------------------
			IF (@tipoOperacionXML = 2)
			BEGIN
				DECLARE @cantidadEmpleadosEliminados INT
				DECLARE @rutaEmpleadosEliminados VARCHAR (128)
				
				SET @rutaEmpleadosEliminados = @ruta + '/EliminarEmpleado'
				SELECT @cantidadEmpleadosEliminados  = COUNT(*) FROM OPENXML(@doccnt, @rutaEmpleadosEliminados, 1) WITH(Id INT)
				
				DECLARE @contadorEmpleadosEliminados INT
				SET @contadorEmpleadosEliminados = 1 + @secuenciaXML

				WHILE (@contadorEmpleadosEliminados <= @cantidadEmpleadosEliminados)
				BEGIN
					DECLARE @rutaEmpleadoEliminado VARCHAR(256)
					SET @rutaEmpleadoEliminado = @rutaEmpleadosEliminados + '[' + CAST(@contadorEmpleadosEliminados AS VARCHAR(10)) + ']'
		
					DECLARE @valorDocumentoId INT
					DECLARE @errorEliminarEmpleado INT, @secuenciaEliminarEmpleado INT


					SELECT  @valorDocumentoId = ValorDocumentoIdentidad,
							@errorEliminarEmpleado = ProduceError,
							@secuenciaEliminarEmpleado = Secuencia
					FROM OPENXML(@doccnt, @rutaEmpleadoEliminado, 1)
					WITH (ValorDocumentoIdentidad INT, ProduceError INT, Secuencia INT)t
					
					IF (@errorEliminarEmpleado = 1 AND @reinicio = 0)
					BEGIN
						PRINT ('Error EliminarEmpleado')
						SET @errorEliminarEmpleado = @errorEliminarEmpleado / 0
					END

					ELSE
					BEGIN
						EXEC EliminarEmpleadoPorDocumentoIdentidad @valorDocumentoId, 1

						INSERT INTO dbo.DetalleCorrida (IdCorrida, IdTipoOperacionXML, Secuencia)
						VALUES (@idCorrida, 2, @secuenciaEliminarEmpleado)

						SET @reinicio = 0
					END

					-- SET @secuenciaXML = 0

					SET @contadorEmpleadosEliminados += 1
				END -- FIN DEL WHILE PARA ELIMINAR EMPLEADOS

				SET @tipoOperacionXML = 5
				SET @secuenciaXML = 0

			END

				EXEC GestionarFinDeSemana @fechaOperacion, 1


			--ACTUALIZAR LAS NUEVAS JORNADAS DE LOS EMPLEADOS
			IF (@tipoOperacionXML = 5)
			BEGIN
				DECLARE @rutaNuevasJornadas VARCHAR(64)
				SET @rutaNuevasJornadas = @ruta + '/TipoDeJornadaProximaSemana'

				DECLARE @cantidadJornadas INT
				SELECT @cantidadJornadas  = COUNT(*) FROM OPENXML(@doccnt, @rutaNuevasJornadas, 1) WITH(Id INT)
				
				DECLARE @contadorJornadas INT
				SET @contadorJornadas = 1 + @secuenciaXML

				WHILE (@contadorJornadas <= @cantidadJornadas)
				BEGIN
					DECLARE @rutaNuevaJornada VARCHAR(128)
					SET @rutaNuevaJornada = @rutaNuevasJornadas + '[' + CAST(@contadorJornadas AS VARCHAR(10)) + ']'
		
					DECLARE @valorDocId INT, @nuevaJornada INT

					DECLARE @errorSiguienteJornada INT, @secuenciaSiguienteJornada INT


					SELECT  @valorDocId = ValorDocumentoIdentidad,
							@nuevaJornada = IdJornada,
							@errorSiguienteJornada = ProduceError,
							@secuenciaSiguienteJornada = Secuencia
					FROM OPENXML(@doccnt, @rutaNuevaJornada, 1)
					WITH (IdJornada INT, ValorDocumentoIdentidad INT, ProduceError INT, Secuencia INT)t 


					IF (@errorSiguienteJornada = 1 AND @reinicio = 0)
					BEGIN
						PRINT ('Error SiguienteJornada')
						SET @errorSiguienteJornada = @errorSiguienteJornada / 0
					END

					ELSE
					BEGIN
						DECLARE @idSemana INT
						SELECT @idSemana = MAX(Id) FROM SemanaPlanilla

						DECLARE @idEmpleado INT
						SELECT @idEmpleado = Id FROM Empleados E WHERE @valorDocId = E.ValorDocIdentidad

						UPDATE SemanaPlanillaXEmpleado
						SET IdTipoDeJornada = @nuevaJornada
						WHERE @idEmpleado = IdEmpleado AND @idSemana = IdSemanaPlanilla

						INSERT INTO dbo.DetalleCorrida (IdCorrida, IdTipoOperacionXML, Secuencia)
						VALUES (@idCorrida, 5, @secuenciaSiguienteJornada)

						SET @reinicio = 0
					END

					--SET @secuenciaXML = 0

					SET @contadorJornadas += 1
				END -- FIN DEL WHILE PARA ACTUALIZAR LAS NUEVAS JORNADAS DE LOS EMPLEADOS

				SET @tipoOperacionXML = 3
				SET @secuenciaXML = 0
			END
		END

		ELSE 
		BEGIN
			IF (@tipoOperacionXML != 4)
			BEGIN
				SET @tipoOperacionXML = 3
			END
		END

			IF (@tipoOperacionXML = 3)
			BEGIN
				
				DECLARE @cantidadAsociaciones INT
				DECLARE @rutaAsociaciones VARCHAR(128)
				SET @rutaAsociaciones = @ruta + '/AsociaEmpleadoConDeduccion'

				SELECT @cantidadAsociaciones  = COUNT(*) FROM OPENXML(@doccnt, @rutaAsociaciones, 1) WITH(Id INT)
	
				DECLARE @contadorAsociaciones INT
				SET @contadorAsociaciones = 1 + @secuenciaXML

				WHILE (@contadorAsociaciones <= @cantidadAsociaciones)
				BEGIN
					DECLARE @rutaAsociacion VARCHAR(128)
					SET @rutaAsociacion = @rutaAsociaciones + '[' + CAST(@contadorAsociaciones AS VARCHAR(10)) + ']'

					DECLARE @valorDocuId INT
					DECLARE @idDeduccion INT, @monto FLOAT 

					DECLARE @errorAsociar INT, @secuenciaAsociar INT
		
					SELECT  @idDeduccion = IdDeduccion,
							@monto = Monto,
							@valorDocuId = ValorDocumentoIdentidad,
							@errorAsociar = ProduceError,
							@secuenciaAsociar = Secuencia
					FROM OPENXML(@doccnt, @rutaAsociacion, 1)
					WITH (IdDeduccion INT, Monto FLOAT, ValorDocumentoIdentidad INT, ProduceError INT, Secuencia INT)t 
			
					IF (@errorAsociar = 1 AND @reinicio = 0)
					BEGIN
						PRINT ('Error AsociarDeduccion')
						PRINT @secuenciaAsociar
						SET @errorAsociar = @errorAsociar / 0
					END

					ELSE
					BEGIN
						EXEC AsociarEmpleadoConDeduccion @valorDocuId, @idDeduccion, @monto, 0

						INSERT INTO dbo.DetalleCorrida (IdCorrida, IdTipoOperacionXML, Secuencia)
						VALUES (@idCorrida, 3, @secuenciaAsociar)

						SET @reinicio = 0
					END
				
					--SET @secuenciaXML = 0
					SET @contadorAsociaciones += 1
				END

				SET @tipoOperacionXML = 4
				SET @secuenciaXML = 0
			END


		-- DESASOCIAR EMPLEADOS DE DEDUCCIONES------------------------------------------------
			IF (@tipoOperacionXML = 4)
			BEGIN
				DECLARE @cantidadDesasociaciones INT
				DECLARE @rutaDesasociaciones VARCHAR(128)
				SET @rutaDesasociaciones = @ruta + '/DesasociaEmpleadoConDeduccion'

				SELECT @cantidadDesasociaciones  = COUNT(*) FROM OPENXML(@doccnt, @rutaDesasociaciones, 1) WITH(Id INT)
	
				DECLARE @contadorDesasociaciones INT 
				SET @contadorDesasociaciones = 1 + @secuenciaXML

				WHILE (@contadorDesasociaciones <= @cantidadDesasociaciones)
				BEGIN
					DECLARE @rutaDesasociacion VARCHAR(128)
					SET @rutaDesasociacion = @rutaDesasociaciones + '[' + CAST(@contadorDesasociaciones AS VARCHAR(10)) + ']'

					DECLARE @errorDesasociar INT, @secuenciaDesasociar INT
		
					SELECT  @idDeduccion = IdDeduccion,
							@valorDocuId = ValorDocumentoIdentidad,
							@errorDesasociar = ProduceError,
							@secuenciaDesasociar = Secuencia
					FROM OPENXML(@doccnt, @rutaDesasociacion, 1)
					WITH (IdDeduccion INT, ValorDocumentoIdentidad INT, ProduceError INT, Secuencia INT)t 
			
					IF (@errorDesasociar = 1 AND @reinicio = 0)
					BEGIN
						PRINT('Error DesasociarDeduccion')
						SET @errorDesasociar = @errorDesasociar / 0
					END

					ELSE
					BEGIN
						EXEC DesasociarEmpleadoConDeduccion @valorDocuId, @idDeduccion, 0

						INSERT INTO dbo.DetalleCorrida (IdCorrida, IdTipoOperacionXML, Secuencia)
						VALUES (@idCorrida, 4, @secuenciaDesasociar)

						SET @reinicio = 0
					END

					--SET @secuenciaXML = 0
		
					SET @contadorDesasociaciones += 1
				END

				SET @tipoOperacionXML = 6
				SET @secuenciaXML = 0
			END

			INSERT INTO dbo.Corrida (FechaOperacion, PostTime, TipoRegistro)
			VALUES (@fechaOperacion, GETDATE(), 2)


			SET @ContOperaciones += 1;

			-- PRINT('SE PROCESÓ LA FECHA ' + CAST(@fechaOperacion AS VARCHAR(10)))
		END

		SET @outResultCode = 50001
		SET @outResultMessage = 'Se cargaron correctamente las operaciones'
		-- COMMIT TRANSACTION Cargar_Operaciones
	END TRY

	BEGIN CATCH
		/*
		IF (@@TRANCOUNT > 0)
		BEGIN
			ROLLBACK TRANSACTION Cargar_Operaciones
		END
		*/

		SET @outResultCode = 50005
		SET @outResultMessage = 'Error al cargar las operaciones'
	END CATCH
	PRINT @outResultMessage
	SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarDeduccionesDeMes]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarDeduccionesDeMes]
	@inIdEmpleado INT,
	@inIdMesPlanilla INT,
	@outResultCode INT OUT
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY

		DECLARE @tablaSemanasXEmpleadoXMes TABLE (Id INT)

		INSERT INTO @tablaSemanasXEmpleadoXMes (Id)
		SELECT SPXE.Id FROM SemanaPlanillaXEmpleado SPXE
		INNER JOIN SemanaPlanilla SP ON SP.Id = SPXE.IdSemanaPlanilla 
		INNER JOIN MesPlanilla MP ON MP.Id = SP.IdMesPlanilla
		WHERE SPXE.IdEmpleado = @inIdEmpleado AND MP.Id = @inIdMesPlanilla

		DECLARE @contadorSemanasXEmpleadosXMes INT
		SELECT @contadorSemanasXEmpleadosXMes = COUNT(*) FROM @tablaSemanasXEmpleadoXMes

		DECLARE @tablaResultados TABLE (Fecha DATE, NombreDeduccion VARCHAR(64), PorcentajeAplicado VARCHAR(10), MontoAplicado MONEY)

		WHILE (@contadorSemanasXEmpleadosXMes > 0)
		BEGIN

			DECLARE @tablaMovimientos TABLE (Id INT, IdDeduccion INT, Monto MONEY, Fecha DATE)
			DECLARE @topIdSemanaXEmpleadoXMes INT
			SELECT TOP(1) @topIdSemanaXEmpleadoXMes = Id FROM @tablaSemanasXEmpleadoXMes

			DECLARE @idEmpleado INT
			SELECT @idEmpleado = IdEmpleado
			FROM SemanaPlanillaXEmpleado
			WHERE Id = @topIdSemanaXEmpleadoXMes

			INSERT INTO @tablaMovimientos (Id, IdDeduccion, Monto, Fecha)
			SELECT MP.Id, TMD.IdDeduccion, MP.Monto, Mp.Fecha
			FROM MovimientoPlanilla MP
			INNER JOIN TipoMovimientoDeduccion TMD ON TMD.Id = MP.Id
			WHERE MP.IdSemanaPlanillaXEmpleado = @topIdSemanaXEmpleadoXMes


			DECLARE @contador INT
			SELECT @contador = COUNT(*) FROM @tablaMovimientos
		
			WHILE (@contador > 0)
			BEGIN
			
				DECLARE @nombreDeduccion VARCHAR(63), @porcentajeAplicado VARCHAR(10), @montoAplicado MONEY, @fechaMovimiento DATE
				SET @porcentajeAplicado = 'No aplica'

				DECLARE @topIdMovimiento INT, @topIdDeduccion INT
				SELECT TOP(1) @topIdMovimiento = Id, @topIdDeduccion = IdDeduccion, @montoAplicado = Monto, @fechaMovimiento = Fecha
				FROM @tablaMovimientos

				DECLARE @esPorcentual VARCHAR(2), @esObligatoria VARCHAR(2)
				SELECT @esPorcentual = TD.EsPorcentual, @esObligatoria = TD.Obligatoria, @nombreDeduccion = TD.Nombre
				FROM TipoDeduccion TD
				WHERE TD.Id = @topIdDeduccion
			
				IF (@esPorcentual = 'Si')
				BEGIN
					DECLARE @porcentaje FLOAT
					IF (@esObligatoria = 'Si')
					BEGIN
						SELECT @porcentaje = DO.Monto
						FROM DeduccionObligatoria DO
						WHERE DO.Id = @topIdDeduccion
					END

					ELSE
					BEGIN
						SELECT TOP(1) @porcentaje = DNO.Monto
						FROM DeduccionNoObligatoria DNO
						INNER JOIN DeduccionesXEmpleado DXE ON DNO.Id = DXE.Id
						INNER JOIN TipoDeduccion TD ON TD.Id = DXE.IdDeduccion
						WHERE DXE.IdEmpleado = @idEmpleado AND TD.EsPorcentual = 'Si'
					END

					SET @porcentajeAplicado = CAST((@porcentaje*100) AS VARCHAR(10)) + '%'
				END

				INSERT INTO @tablaResultados (Fecha, NombreDeduccion, PorcentajeAplicado, MontoAplicado)
				VALUES (@fechaMovimiento, @nombreDeduccion, @porcentajeAplicado, @montoAplicado)

				DELETE FROM @tablaMovimientos WHERE Id = @topIdMovimiento
				SELECT @contador = COUNT(*) FROM @tablaMovimientos
			END

			DELETE FROM @tablaSemanasXEmpleadoXMes WHERE Id = @topIdSemanaXEmpleadoXMes
			SELECT @contadorSemanasXEmpleadosXMes = COUNT(*) FROM @tablaSemanasXEmpleadoXMes
		END

		SELECT Fecha, NombreDeduccion, PorcentajeAplicado, MontoAplicado
		FROM @tablaResultados
		ORDER BY Fecha

		SET @outResultCode = 50001
	END TRY
	BEGIN CATCH
		SET @outResultCode = 50005
	END CATCH

	SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarDetallesSemana]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarDetallesSemana]
	@inIdSemanaPlanillaXEmpleado INT,
	@outResultCode INT OUT
AS BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		
		DECLARE @pagoXHora MONEY
		SELECT @pagoXHora = P.SalarioXHora 
		FROM Puesto P
		INNER JOIN Empleados E ON E.IdPuesto = P.Id
		INNER JOIN SemanaPlanillaXEmpleado SPXE ON SPXE.IdEmpleado = E.Id
		WHERE SPXE.Id = @inIdSemanaPlanillaXEmpleado


		SELECT	HoraEntrada, HoraSalida, HorasOrdinarias, HorasExtraNormales, HorasExtraDobles,
				((HorasOrdinarias*@pagoXHora)+(HorasExtraNormales*@pagoXHora*1.5)+(HorasExtraDobles*@pagoXHora*2)) AS SalarioGanado
		FROM MarcaAsistencia
		WHERE IdSemanaPlanillaXEmpleado = @inIdSemanaPlanillaXEmpleado

		SET @outResultCode = 50001
	END TRY
	BEGIN CATCH
		SET @outResultCode = 50005
	END CATCH
	SET NOCOUNT OFF
END 
GO
/****** Object:  StoredProcedure [dbo].[ConsultarMeses]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarMeses]
	@inIdEmpleado INT,
	@outResultCode INT OUT
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		SELECT TOP(12)	MP.FechaInicio, MP.FechaFin, SalarioTotal AS SalarioBruto, SalarioNeto, 
						(SalarioTotal-SalarioNeto) AS TotalDeducciones, MPXE.IdMesPlanilla AS IdMesPlanilla
		FROM MesPlanillaXEmpleado MPXE
		INNER JOIN MesPlanilla MP ON MP.Id = MPXE.IdMesPlanilla
		WHERE MPXE.IdEmpleado = @inIdEmpleado
		ORDER BY MP.FechaInicio DESC

		SET @outResultCode = 50001
	END TRY
	BEGIN CATCH
		SET @outResultCode = 50005
	END CATCH

	SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarSemanas]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarSemanas]
	@inIdEmpleado INT,
	@outResultCode INT OUT
AS BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		DECLARE @tablaIdSemanas TABLE (IdSemanaPlanillaXEmpleado INT, SalarioBruto MONEY, SalarioNeto MONEY, Deducciones MONEY, FechaInicio DATE, FechaFin DATE)

		INSERT INTO @tablaIdSemanas (IdSemanaPlanillaXEmpleado, SalarioBruto, SalarioNeto, Deducciones, FechaInicio, FechaFin)
		SELECT TOP(15) SPXE.Id, SPXE.SalarioBruto, SPXE.SalarioNeto, (SPXE.SalarioBruto-SPXE.SalarioNeto), SP.FechaInicio, SP.FechaFin
		FROM SemanaPlanillaXEmpleado SPXE
		INNER JOIN SemanaPlanilla SP ON SP.Id = SPXE.IdSemanaPlanilla
		WHERE IdEmpleado = @inIdEmpleado

		DECLARE @tablaResultados TABLE (Id INT, SalarioBruto MONEY, Deducciones MONEY, SalarioNeto MONEY, HorasOrdinarias INT, HorasExtraNormales INT, HorasExtraDobles INT, FechaInicio DATE, FechaFin DATE)

		DECLARE @cuentaSemanas INT
		SELECT @cuentaSemanas = COUNT(*) FROM @tablaIdSemanas

		WHILE(@cuentaSemanas > 0)
		BEGIN
			DECLARE @topIdSemana INT, @topSalarioBruto MONEY, @topSalarioNeto MONEY, @topDeducciones MONEY
			DECLARE @fechaInicio DATE, @fechaFin DATE
			SELECT TOP(1)	@topIdSemana = IdSemanaPlanillaXEmpleado, @topSalarioBruto = SalarioBruto, 
							@topSalarioNeto = SalarioNeto, @topDeducciones = Deducciones, 
							@fechaInicio = FechaInicio, @fechaFin = FechaFin
			FROM @tablaIdSemanas

			INSERT INTO @tablaResultados (Id, SalarioBruto, Deducciones, SalarioNeto, HorasOrdinarias, HorasExtraNormales, HorasExtraDobles, FechaInicio, FechaFin)
			SELECT @topIdSemana, @topSalarioBruto, @topDeducciones, @topSalarioNeto, SUM(HorasOrdinarias), SUM(HorasExtraNormales), SUM(HorasExtraDobles), @fechaInicio, @fechaFin
			FROM MarcaAsistencia MA 
			WHERE MA.IdSemanaPlanillaXEmpleado = @topIdSemana

			DELETE @tablaIdSemanas WHERE IdSemanaPlanillaXEmpleado = @topIdSemana
			SELECT @cuentaSemanas = COUNT(*) FROM @tablaIdSemanas
		END

		SELECT * FROM @tablaResultados
		ORDER BY FechaInicio DESC
		SET @outResultCode = 50001
	END TRY
	BEGIN CATCH
		SET @outResultCode = 50005
	END CATCH
	SET NOCOUNT OFF
END 

EXEC ConsultarSemanas 4, 0
GO
/****** Object:  StoredProcedure [dbo].[Datos_Usuarios]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Datos_Usuarios] @inUsername varchar(64), @inPass varchar(64)
as
begin 
	SET NOCOUNT ON
	SELECT Type FROM Users U WHERE U.Username=@inUsername AND U.pwd=@inPass
	SET NOCOUNT OFF
end
GO
/****** Object:  StoredProcedure [dbo].[DesasociarEmpleadoConDeduccion]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DesasociarEmpleadoConDeduccion]
	@inValorDocID INT,
	@inIdDeduccion INT,
	@outResultCode INT OUT
AS BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		BEGIN TRANSACTION DesasociarDeduccion

			DECLARE @idEmpleado INT
			SELECT @idEmpleado = Id FROM Empleados WHERE ValorDocIdentidad = @inValorDocID

			DECLARE @idDeduccion INT
			SELECT @idDeduccion = Id 
			FROM DeduccionesXEmpleado 
			WHERE IdEmpleado = @idEmpleado AND IdDeduccion = @inIdDeduccion

			UPDATE DeduccionNoObligatoria
			SET Activo = 0
			WHERE Id = @idDeduccion

			SET @outResultCode = 50001

		COMMIT TRANSACTION DesasociarDeduccion
	END TRY
	BEGIN CATCH
		IF (@@TRANCOUNT > 0)
		BEGIN
			ROLLBACK TRANSACTION DesasociarDeduccion
		END
		SET @outResultCode = 50005
	END CATCH
	SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[Editar_Empleado]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Editar_Empleado]
	@inId INT,
	@inIdTipoId INT,
	@inIdPuesto INT,
	@inIdDepartamento INT,
	@inValorId INT,
	@inNombre VARCHAR(64),
	@outCode INT OUT
AS
BEGIN

	SET NOCOUNT ON;
	BEGIN TRY
		
		
		IF (@inIdTipoId != (SELECT IdTipoIdentificacion FROM dbo.Empleados WHERE Id = @inId))
		BEGIN
			UPDATE dbo.Empleados
			SET IdTipoIdentificacion = @inIdTipoId
			WHERE Id = @inId
		END


		IF (@inIdPuesto != (SELECT IdPuesto FROM dbo.Empleados WHERE Id = @inId))
		BEGIN
			UPDATE dbo.Empleados
			SET IdPuesto = @inIdPuesto
			WHERE Id = @inId
		END


		IF (@inIdDepartamento != (SELECT IdDepartamento FROM dbo.Empleados WHERE Id = @inId))
		BEGIN
			UPDATE dbo.Empleados
			SET IdDepartamento = @inIdDepartamento
			WHERE Id = @inId
		END

		IF (@inValorId != (SELECT ValorDocIdentidad FROM dbo.Empleados WHERE Id = @inId))
		BEGIN
			UPDATE dbo.Empleados
			SET ValorDocIdentidad = @inValorId
			WHERE Id = @inId
		END

		IF (@inNombre != (SELECT Nombre FROM dbo.Empleados WHERE Id = @inId))
		BEGIN
			UPDATE dbo.Empleados
			SET Nombre = @inNombre
			WHERE Id = @inId
		END

		SET @outCode = 50001
	END TRY

	BEGIN CATCH
		SET @outCode = 50005
	END CATCH
	SET NOCOUNT OFF;
END	
GO
/****** Object:  StoredProcedure [dbo].[EliminarEmpleadoPorDocumentoIdentidad]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarEmpleadoPorDocumentoIdentidad]
	@inDocumentoIdentidad INT,
	@outResultCode INT OUT
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		
		UPDATE Empleados
		SET Activo = 0
		WHERE ValorDocIdentidad = @inDocumentoIdentidad

		--PRINT 'SE ELIMINO EL EMPLEADO: ' + CAST(@inDocumentoIdentidad AS VARCHAR(10))
		SET @outResultCode = 50001
	END TRY
	BEGIN CATCH
		--PRINT 'ERROR AL ELIMINAR EL EMPLEADO ' + CAST(@inDocumentoIdentidad AS VARCHAR(10))
		SET @outResultCode = 50005
	END CATCH

	SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[Filtrar_Empleados]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Filtrar_Empleados]
	@inStr varchar(64)
AS
BEGIN

	SET NOCOUNT ON;
	SELECT E.Id, E.ValorDocIdentidad, E.Nombre, E.FechaDeNacimiento, P.Nombre AS NombrePuesto, D.Nombre AS NombreDept , T.Nombre AS DocId 
	FROM dbo.Empleados E
	INNER JOIN dbo.Puesto P ON E.IdPuesto = P.Id
	INNER JOIN dbo.Departamentos D ON E.IdDepartamento = D.Id
	INNER JOIN dbo.Tipo_de_Documento_de_Identidad T ON E.IdTipoIdentificacion = T.Id
	WHERE E.Nombre LIKE '%'+@inStr+'%' and E.Activo = 1  ORDER BY E.Nombre 
	SET NOCOUNT OFF;
END	
GO
/****** Object:  StoredProcedure [dbo].[GestionarFinDeMes]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GestionarFinDeMes]
	@inFecha DATE,
	@outResultCode INT OUT
AS BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		BEGIN TRANSACTION Fin_De_Mes
			DECLARE @idMes INT
			SELECT @idMes = MAX(IdMesPlanilla) FROM SemanaPlanilla

			--DECLARE @tablaEmpleadosDelMes TABLE (Id INT, IdEmpleado INT)

			--INSERT INTO @tablaEmpleadosDelMes (Id, IdEmpleado)
			--SELECT Id, IdEmpleado 
			--FROM MesPlanillaXEmpleado
			--WHERE IdMesPlanilla = @idMes

			--DECLARE @contadorEmpleadosDelMes INT
			--SELECT @contadorEmpleadosDelMes = COUNT(*) FROM @tablaEmpleadosDelMes

			--WHILE (@contadorEmpleadosDelMes > 0)
			--BEGIN 
			--	--PRINT 'ENTRA AL WHILE'
			--	DECLARE @topIdEmpleado INT, @topMesPlanillaXEmpleado INT
			--	SELECT TOP(1) @topMesPlanillaXEmpleado = Id , @topIdEmpleado = IdEmpleado
			--	FROM @tablaEmpleadosDelMes

			--	DECLARE @topSemanaPlanillaXEmpleado INT
			--	SELECT @topSemanaPlanillaXEmpleado = Id
			--	FROM SemanaPlanillaXEmpleado 
			--	WHERE IdEmpleado = @topIdEmpleado
			
			--	DECLARE @tablaDeduccionesDelEmpleado TABLE (IdDeduccion INT, Monto FLOAT)

			--	INSERT INTO @tablaDeduccionesDelEmpleado (IdDeduccion, Monto)
			--	SELECT DXE.IdDeduccion, DNO.Monto*-1
			--	FROM DeduccionesXEmpleado DXE
			--	INNER JOIN DeduccionNoObligatoria DNO ON DNO.Id = DXE.Id
			--	INNER JOIN TipoDeduccion TD ON TD.Id = DXE.IdDeduccion
			--	WHERE DXE.IdEmpleado = @topIdEmpleado AND DNO.Activo = 1 AND TD.EsPorcentual = 'No'

			--	DECLARE @contadorDeduccionesDelEmpleado INT
			--	SELECT @contadorDeduccionesDelEmpleado = COUNT(*)
			--	FROM @tablaDeduccionesDelEmpleado

			--	WHILE (@contadorDeduccionesDelEmpleado > 0)
			--	BEGIN
			--		--PRINT 'ENTRA EN EL SEGUNDO WHILE'
			--		DECLARE @topIdDeduccion INT, @topMonto FLOAT
			--		SELECT TOP(1) @topIdDeduccion = IdDeduccion, @topMonto = Monto 
			--		FROM @tablaDeduccionesDelEmpleado

			--		UPDATE MesPlanillaXEmpleado
			--		SET SalarioNeto += @topMonto
			--		WHERE Id = @topMesPlanillaXEmpleado

			--		UPDATE SemanaPlanillaXEmpleado
			--		SET SalarioNeto += @topMonto
			--		WHERE Id = @topSemanaPlanillaXEmpleado

			--		INSERT INTO MovimientoPlanilla (IdTipoMovimiento, IdSemanaPlanillaXEmpleado, Monto, Fecha)
			--		VALUES (5, @topSemanaPlanillaXEmpleado, @topMonto , @inFecha)

			--		DECLARE @idMovimiento INT
			--		SELECT @idMovimiento = MAX(Id) FROM MovimientoPlanilla

			--		INSERT INTO TipoMovimientoDeduccion (Id, IdDeduccion)
			--		VALUES (@idMovimiento, @topIdDeduccion)

			--		DELETE FROM @tablaDeduccionesDelEmpleado 
			--		WHERE IdDeduccion = @topIdDeduccion

			--		SELECT @contadorDeduccionesDelEmpleado = COUNT(*)
			--		FROM @tablaDeduccionesDelEmpleado
			--	END

			--	DELETE FROM @tablaEmpleadosDelMes WHERE IdEmpleado = @topIdEmpleado
			--	SELECT @contadorEmpleadosDelMes = COUNT(*) FROM @tablaEmpleadosDelMes
			--END

			DECLARE @siguienteFinDeMes DATE, @siguienteInicioDeMes DATE
			SET @siguienteInicioDeMes = DATEADD(DD, 1, @inFecha)
			SET @siguienteFinDeMes = DATEADD(DD, 7, @siguienteInicioDeMes)

			WHILE (DATEPART(MONTH, @siguienteFindeMes) = DATEPART(MONTH, @siguienteInicioDeMes))
			BEGIN
				SET @siguienteFinDeMes = DATEADD(DD, 7, @siguienteFinDeMes)
			END

			INSERT INTO MesPlanilla (FechaInicio, FechaFin)
			VALUES (@siguienteInicioDeMes, DATEADD(DD, -1, @siguienteFinDeMes))

			DECLARE @idNuevoMes INT
			SELECT @idNuevoMes = MAX(Id) FROM MesPlanilla

			INSERT INTO MesPlanillaXEmpleado (IdMesPlanilla, IdEmpleado, SalarioNeto, SalarioTotal)
			SELECT @idNuevoMes, Id, 0, 0
			FROM Empleados 
			WHERE Activo = 1
		
			SET @outResultCode = 50001
		COMMIT TRANSACTION Fin_De_Mes
	END TRY
	BEGIN CATCH
		
		IF (@@TRANCOUNT > 0)
		BEGIN
			ROLLBACK TRANSACTION Fin_De_Mes
		END
		SET @outResultCode = 50005
	END CATCH
	SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[GestionarFinDeSemana]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GestionarFinDeSemana] 
	@inFecha DATE,
	@outResultCode INT OUT
AS BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		BEGIN TRANSACTION TerminarSemana
			DECLARE @fechaFinDeMes DATE
			DECLARE @idMesActual INT

			SELECT @idMesActual = MAX(Id) FROM MesPlanilla

		-- PARA SACAR LOS SALARIOS SEMANALES DE LOS EMPLEADOS
			DECLARE @tabla TABLE (idPSemanaXEmpleado INT)

			DECLARE @idSemana INT
			SELECT @idSemana = MAX(Id) FROM SemanaPlanilla

			--INSERT INTO @tabla (idPSemanaXEmpleado)
			--SELECT DISTINCT (idSemanaPlanillaXEmpleado)
			--FROM MarcaAsistencia MA
			--INNER JOIN SemanaPlanillaXEmpleado SPXE ON SPXE.Id = MA.IdSemanaPlanillaXEmpleado
			--WHERE SPXE.IdSemanaPlanilla = @idSemana

			--DECLARE @contador INT 
			--SELECT @contador = COUNT(*) FROM @tabla

			--WHILE (@contador > 0)
			--BEGIN
				--DECLARE @topId INT
				--SELECT TOP(1) @topId =idPSemanaXEmpleado FROM @tabla


				--DECLARE @horasOrdinarias INT, @horasExtraordinarias INT,  @pagoBaseXHora MONEY
				--DECLARE @horasExtraDobles INT

				--SELECT	@horasOrdinarias = SUM(HorasOrdinarias), 
				--		@horasExtraordinarias = SUM(HorasExtraNormales), 
				--		@horasExtraDobles = SUM(HorasExtraDobles)
				--FROM MarcaAsistencia 
				--WHERE IdSemanaPlanillaXEmpleado = @topId

				--SELECT @pagoBaseXHora = SalarioXHora FROM Puesto P
				--INNER JOIN SemanaPlanillaXEmpleado SPXE ON SPXE.Id=@topId
				--INNER JOIN Empleados E ON E.Id = SPXE.IdEmpleado
				--WHERE P.Id = E.IdPuesto

			--	DECLARE @pagoOrdinario MONEY = @pagoBaseXHora * @horasOrdinarias
			--	DECLARE @pagoExtra MONEY = (@pagoBaseXhora * 1.5) * @horasExtraordinarias
			--	DECLARE @pagoExtraDoble MONEY = (@pagoBaseXhora * 2) * @horasExtraDobles
			--	DECLARE @pagoSemanal MONEY = @pagoOrdinario + @pagoExtra + @pagoExtraDoble

			--	UPDATE SemanaPlanillaXEmpleado
			--	SET SalarioBruto = @pagoSemanal, SalarioNeto = @pagoSemanal
			--	WHERE Id = @topId

			--	DECLARE @idEmpleado INT
			--	SELECT @idEmpleado = IdEmpleado 
			--	FROM SemanaPlanillaXEmpleado
			--	WHERE Id = @topId

			--	UPDATE MesPlanillaXEmpleado
			--	SET SalarioTotal += @pagoSemanal, SalarioNeto += @pagoSemanal
			--	WHERE @idEmpleado = IdEmpleado AND @idMesActual = IdMesPlanilla

			--	INSERT INTO MovimientoPlanilla (IdTipoMovimiento, IdSemanaPlanillaXEmpleado, Fecha, Monto)
			--	VALUES (1, @topId, @inFecha, @pagoOrdinario)

			--	IF (@pagoExtra > 0)
			--	BEGIN
			--		INSERT INTO MovimientoPlanilla (IdTipoMovimiento, IdSemanaPlanillaXEmpleado, Fecha, Monto)
			--		VALUES (2, @topId, @inFecha, @pagoExtra)
			--	END

			--	IF (@pagoExtraDoble > 0)
			--	BEGIN
			--		INSERT INTO MovimientoPlanilla (IdTipoMovimiento, IdSemanaPlanillaXEmpleado, Fecha, Monto)
			--		VALUES (3, @topId, @inFecha, @pagoExtraDoble)
			--	END

			---- APLICAR LAS DEDUCCIONES PORCENTUALES OBLIGATORIAS
			--	DECLARE @deduccionesDeLeyPorcentuales TABLE (Id INT, Monto FLOAT)

			--	INSERT INTO @deduccionesDeLeyPorcentuales (Id, Monto)
			--	SELECT TD.Id, DO.Monto FROM DeduccionesXEmpleado DXE
			--	INNER JOIN TipoDeduccion TD ON TD.Id = DXE.IdDeduccion
			--	INNER JOIN DeduccionObligatoria DO ON DO.Id = TD.Id
			--	WHERE TD.EsPorcentual = 'Si' AND TD.Obligatoria='Si'
			--	AND DXE.IdEmpleado = (SELECT IdEmpleado FROM SemanaPlanillaXEmpleado WHERE Id = @topId)


			--	DECLARE @cuentaDeducciones INT
			--	SELECT @cuentaDeducciones = COUNT(*) FROM @deduccionesDeLeyPorcentuales

			--	WHILE (@cuentaDeducciones > 0)
			--	BEGIN
			--		DECLARE @topDeduccionId INT
			--		SELECT TOP(1) @topDeduccionId = Id FROM @deduccionesDeLeyPorcentuales

			--		DECLARE @montoRebajado MONEY
			--		SELECT @montoRebajado = (-1)*(@pagoSemanal)*Monto 
			--		FROM @deduccionesDeLeyPorcentuales
			--		WHERE Id = @topDeduccionId

			--		INSERT INTO MovimientoPlanilla (IdTipoMovimiento, IdSemanaPlanillaXEmpleado, Fecha, Monto)
			--		VALUES (4, @topId, @inFecha, @montoRebajado)

			--		INSERT INTO TipoMovimientoDeduccion (Id, IdDeduccion)
			--		SELECT MAX(Id), @topDeduccionId 
			--		FROM MovimientoPlanilla

			--		UPDATE SemanaPlanillaXEmpleado
			--		SET SalarioNeto += @montoRebajado
			--		WHERE Id = @topId

			--		UPDATE MesPlanillaXEmpleado
			--		SET SalarioNeto += @montoRebajado
			--		WHERE @idEmpleado = IdEmpleado AND @idMesActual = IdMesPlanilla

			--		DELETE FROM @deduccionesDeLeyPorcentuales WHERE Id = @topDeduccionId
			--		SELECT @cuentaDeducciones = COUNT(*) FROM @deduccionesDeLeyPorcentuales
			--	END

		--APLICAR DEDUCCIONES PORCENTUALES NO OBLIGATORIAS
			--	DECLARE @deduccionesNoObligariasPorcentuales TABLE (Id INT, Monto FLOAT)

			--	INSERT INTO @deduccionesNoObligariasPorcentuales (Id, Monto)
			--	SELECT TD.Id, DNO.Monto FROM DeduccionesXEmpleado DXE
			--	INNER JOIN TipoDeduccion TD ON TD.Id = DXE.IdDeduccion
			--	INNER JOIN DeduccionNoObligatoria DNO ON DNO.Id = DXE.Id
			--	WHERE TD.EsPorcentual = 'Si' AND TD.Obligatoria='No' AND DNO.Activo = 1
			--	AND DXE.IdEmpleado = (SELECT IdEmpleado FROM SemanaPlanillaXEmpleado WHERE Id = @topId)

			--	SELECT @cuentaDeducciones = COUNT(*) FROM @deduccionesNoObligariasPorcentuales

			--	WHILE (@cuentaDeducciones > 0)
			--	BEGIN
			--		SELECT TOP(1) @topDeduccionId = Id FROM @deduccionesNoObligariasPorcentuales

			--		SELECT @montoRebajado = (-1)*(@pagoSemanal)*Monto 
			--		FROM @deduccionesNoObligariasPorcentuales
			--		WHERE Id = @topDeduccionId

			--		INSERT INTO MovimientoPlanilla (IdTipoMovimiento, IdSemanaPlanillaXEmpleado, Fecha, Monto)
			--		VALUES (5, @topId, @inFecha, @montoRebajado)

			--		INSERT INTO TipoMovimientoDeduccion (Id, IdDeduccion)
			--		SELECT MAX(Id), @topDeduccionId 
			--		FROM MovimientoPlanilla

			--		DECLARE @ultimoId INT
			--		SELECT @ultimoId = MAX(Id)
			--		FROM MovimientoPlanilla

			--		UPDATE SemanaPlanillaXEmpleado
			--		SET SalarioNeto += @montoRebajado
			--		WHERE Id = @topId

			--		UPDATE MesPlanillaXEmpleado
			--		SET SalarioNeto += @montoRebajado
			--		WHERE @idEmpleado = IdEmpleado AND @idMesActual = IdMesPlanilla

			--		DELETE FROM @deduccionesNoObligariasPorcentuales WHERE Id = @topDeduccionId
			--		SELECT @cuentaDeducciones = COUNT(*) FROM @deduccionesNoObligariasPorcentuales
			--	END

			--	DELETE FROM @tabla WHERE idPSemanaXEmpleado = @topId
			--	SELECT @contador = COUNT(*) FROM @tabla
			--END

			SELECT @idMesActual = MAX(Id) FROM MesPlanilla

			IF (@idMesActual != 0)
			BEGIN
				--SELECT @fechaFinDeMes = FechaFin 
				--FROM MesPlanilla WHERE @idMesActual=Id

				SELECT @fechaFinDeMes = MAX(FechaFin)
				FROM dbo.MesPlanilla

				-- En caso de que sea fin de mes
				IF @fechaFinDeMes = @inFecha
				BEGIN
					EXEC GestionarFinDeMes @inFecha, 1
				END
				ELSE
				BEGIN
					DECLARE @tablaNuevosEmpleados TABLE (IdEmpleado INT)

					INSERT INTO @tablaNuevosEmpleados (IdEmpleado)
					SELECT E.Id 
					FROM Empleados E
					WHERE E.Activo = 1
					      AND NOT EXISTS(SELECT IdEmpleado FROM MesPlanillaXEmpleado WHERE IdMesPlanilla = @idMesActual AND E.Id = IdEmpleado)

					INSERT INTO MesPlanillaXEmpleado (IdMesPlanilla, IdEmpleado, SalarioNeto, SalarioTotal)
					SELECT @idMesActual, IdEmpleado, 0, 0 FROM @tablaNuevosEmpleados

				END
			END
			ELSE
			BEGIN
				EXEC GestionarFinDeMes @inFecha, 1
			END

			SELECT @idMesActual = MAX(Id) FROM MesPlanilla

			INSERT INTO SemanaPlanilla (IdMesPlanilla, FechaInicio, FechaFin)
			VALUES (@idMesActual, DATEADD(DD, 1, @inFecha), DATEADD(DD, 7, @inFecha))

			DECLARE @idSiguienteSemana INT
			SELECT @idSiguienteSemana = MAX(Id) FROM SemanaPlanilla

			INSERT INTO SemanaPlanillaXEmpleado (IdEmpleado, IdSemanaPlanilla, IdTipoDeJornada, SalarioNeto, SalarioBruto)
			SELECT E.Id, @idSiguienteSemana, 1, 0, 0
			FROM Empleados E
			WHERE E.Activo = 1

		COMMIT TRANSACTION TerminarSemana

		SET @outResultCode = 50001
	END TRY
	BEGIN CATCH
		 
		 IF (@@TRANCOUNT > 0)
		 BEGIN
			ROLLBACK TRANSACTION TerminarSemana
		 END
		 SET @outResultCode = 50005
	END CATCH
	SET NOCOUNT OFF
END

GO
/****** Object:  StoredProcedure [dbo].[HacerMarcaAsistencia]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HacerMarcaAsistencia]
	@inValDocIdentidadEmpleado INT,
	@inFechaEntrada DATETIME,
	@inFechaSalida DATETIME,
	@outResultCode INT OUT
AS
BEGIN
	BEGIN TRY

		DECLARE @idEmp INT
		SELECT @idEmp = Id 
		FROM Empleados 
		WHERE @inValDocIdentidadEmpleado = ValorDocIdentidad
		
		DECLARE @idSPXE INT, @idMPXE INT

		SELECT @idSPXE = MAX(Id) 
		FROM SemanaPlanillaXEmpleado 
		WHERE IdEmpleado = @idEmp

		SELECT @idMPXE = MAX(Id)
		FROM dbo.MesPlanillaXEmpleado
		WHERE IdEmpleado = @idEmp

		DECLARE @salarioBaseDelEmpleado MONEY
		SELECT @salarioBaseDelEmpleado = P.SalarioXHora
		FROM Puesto P
		INNER JOIN Empleados E ON E.IdPuesto = P.Id
		WHERE E.Id = @idEmp

		DECLARE @horasTrabajadas INT
		SET @horasTrabajadas = DATEDIFF(MINUTE, @inFechaEntrada, @inFechaSalida)

		SET @horasTrabajadas = @horasTrabajadas / 60
		
		DECLARE @idJornada INT

		SELECT @idJornada = IdTipoDeJornada
		FROM SemanaPlanillaXEmpleado 
		WHERE @idSPXE = Id

		DECLARE @horasJornada INT
		SELECT @horasJornada = DATEDIFF(HOUR, HoraInicio, HoraSalida) 
		FROM TipoJornada
		WHERE Id = @idJornada

		DECLARE @horasOrdinarias INT
		DECLARE @horasExtra INT = 0
		DECLARE @horasExtraDobles INT = 0
		
		IF (@horasTrabajadas > @horasJornada)
		BEGIN
			SET @horasExtra = @horasTrabajadas - @horasJornada
			SET @horasOrdinarias = @horasJornada
		END
		ELSE
		BEGIN
			--PRINT 'ENTRA EN EL ELSE'
			SET @horasExtra = 0
			SET @horasOrdinarias = @horasTrabajadas
		END

		DECLARE @diaDeLaSemana VARCHAR(10)
		SET @diaDeLaSemana = DATENAME(dw, @inFechaEntrada)
		IF (@diaDeLaSemana = 'Domingo' OR @diaDeLaSemana = 'Sunday') OR (SELECT COUNT(*) FROM Feriado WHERE Fecha = CAST(@inFechaEntrada AS DATE))>0
		BEGIN 
			SET @horasExtraDobles = @horasExtra
			SET @horasExtra = 0
		END

		INSERT INTO MarcaAsistencia (IdSemanaPlanillaXEmpleado, HoraEntrada, HoraSalida, HorasOrdinarias, HorasExtraNormales, HorasExtraDobles)
		VALUES (@idSPXE, @inFechaEntrada, @inFechaSalida, @horasOrdinarias, @horasExtra, @horasExtraDobles)


		-- CAMBIOS PARA LA TERCERA TAREA

		-- Primero se agrega el salario de las horasOrdinarias
		DECLARE @salarioOrdinario MONEY, @salarioExtra MONEY, @salarioExtraDoble MONEY, @fecha DATE

		SET @fecha = CAST(@inFechaSalida AS DATE)

		SET @salarioOrdinario = @salarioBaseDelEmpleado * @horasOrdinarias

		INSERT INTO dbo.MovimientoPlanilla (IdTipoMovimiento, IdSemanaPlanillaXEmpleado, Fecha, Monto)
		VALUES (1, @idSPXE, @fecha, @salarioOrdinario)

		UPDATE dbo.SemanaPlanillaXEmpleado
		SET SalarioBruto += @salarioOrdinario, SalarioNeto += @salarioOrdinario
		WHERE Id = @idSPXE

		UPDATE dbo.MesPlanillaXEmpleado
		SET SalarioTotal += @salarioOrdinario, SalarioNeto += @salarioOrdinario
		WHERE Id = @idMPXE

		IF (@horasExtra > 0)
		BEGIN
			SET @salarioExtra = @salarioBaseDelEmpleado * @horasExtra * 1.5
			INSERT INTO dbo.MovimientoPlanilla (IdTipoMovimiento, IdSemanaPlanillaXEmpleado, Fecha, Monto)
			VALUES (2, @idSPXE, @fecha, @salarioOrdinario)

			UPDATE dbo.SemanaPlanillaXEmpleado
			SET SalarioBruto += @salarioExtra, SalarioNeto += @salarioExtra
			WHERE Id = @idSPXE

			UPDATE dbo.MesPlanillaXEmpleado
			SET SalarioTotal += @salarioExtra, SalarioNeto += @salarioExtra
			WHERE Id = @idMPXE

		END

		IF (@horasExtraDobles > 0)
		BEGIN
			SET @salarioExtraDoble = @salarioBaseDelEmpleado * @horasExtraDobles * 2

			INSERT INTO dbo.MovimientoPlanilla (IdTipoMovimiento, IdSemanaPlanillaXEmpleado, Fecha, Monto)
			VALUES (3, @idSPXE, @fecha, @salarioExtraDoble)

			UPDATE dbo.SemanaPlanillaXEmpleado
			SET SalarioBruto += @salarioExtraDoble, SalarioNeto += @salarioExtraDoble
			WHERE Id = @idSPXE

			UPDATE dbo.MesPlanillaXEmpleado
			SET SalarioTotal += @salarioExtraDoble, SalarioNeto += @salarioExtraDoble
			WHERE Id = @idMPXE

		END

		-- Si es fin de semana
		IF (@fecha = (SELECT MAX(FechaFin) FROM dbo.SemanaPlanilla))
		BEGIN
			DECLARE @salarioTotalSemanal MONEY
			DECLARE @deduccionesDeLeyPorcentuales TABLE (Id INT, Porcentaje FLOAT)

			SELECT @salarioTotalSemanal = SalarioBruto
			FROM dbo.SemanaPlanillaXEmpleado
			WHERE Id = @idSPXE

			INSERT INTO @deduccionesDeLeyPorcentuales (Id, Porcentaje)
			SELECT TD.Id, DO.Monto FROM DeduccionesXEmpleado DXE
			INNER JOIN TipoDeduccion TD ON TD.Id = DXE.IdDeduccion
			INNER JOIN DeduccionObligatoria DO ON DO.Id = TD.Id
			WHERE TD.EsPorcentual = 'Si' AND TD.Obligatoria='Si'
			AND DXE.IdEmpleado = (SELECT IdEmpleado FROM SemanaPlanillaXEmpleado WHERE Id = @idEmp)

			DECLARE @cuentaDeducciones INT
			SELECT @cuentaDeducciones = COUNT(*) FROM @deduccionesDeLeyPorcentuales

			WHILE (@cuentaDeducciones > 0)
			BEGIN
				DECLARE @topIdDeduccion INT, @porcentaje FLOAT, @monto MONEY
				SELECT TOP(1) @topIdDeduccion = Id, @porcentaje = Porcentaje
				FROM @deduccionesDeLeyPorcentuales

				SET @monto = @salarioTotalSemanal * @porcentaje * -1

				INSERT INTO dbo.MovimientoPlanilla (IdTipoMovimiento, IdSemanaPlanillaXEmpleado, Fecha, Monto)
				VALUES (4, @idSPXE, @fecha, @monto)

				INSERT INTO TipoMovimientoDeduccion (Id, IdDeduccion)
				SELECT MAX(Id), @topIdDeduccion
				FROM MovimientoPlanilla

				UPDATE dbo.SemanaPlanillaXEmpleado
				SET SalarioNeto += @monto
				WHERE Id = @idSPXE

				UPDATE dbo.MesPlanillaXEmpleado
				SET SalarioNeto += @monto
				WHERE Id = @idMPXE

				DELETE FROM @deduccionesDeLeyPorcentuales WHERE Id = @topIdDeduccion
				SELECT @cuentaDeducciones = COUNT(*) FROM @deduccionesDeLeyPorcentuales
			END

			--PRINT ('SALE DEL WHILE DE LAS DEDUCCIONES DE LEY')

			DECLARE @deduccionesNoObligariasPorcentuales TABLE (Id INT, Porcentaje FLOAT)

			INSERT INTO @deduccionesNoObligariasPorcentuales (Id, Porcentaje)
			SELECT TD.Id, DNO.Monto FROM DeduccionesXEmpleado DXE
			INNER JOIN TipoDeduccion TD ON TD.Id = DXE.IdDeduccion
			INNER JOIN DeduccionNoObligatoria DNO ON DNO.Id = DXE.Id
			WHERE TD.EsPorcentual = 'Si' AND TD.Obligatoria='No' AND DNO.Activo = 1
			AND DXE.IdEmpleado = (SELECT IdEmpleado FROM SemanaPlanillaXEmpleado WHERE Id = @idEmp)

			SELECT @cuentaDeducciones = COUNT(*) FROM @deduccionesNoObligariasPorcentuales

			WHILE (@cuentaDeducciones > 0)
			BEGIN
				SELECT TOP(1) @topIdDeduccion = Id, @porcentaje = Porcentaje
				FROM @deduccionesNoObligariasPorcentuales

				SET @monto = @salarioTotalSemanal * @porcentaje * -1

				INSERT INTO MovimientoPlanilla (IdTipoMovimiento, IdSemanaPlanillaXEmpleado, Fecha, Monto)
				VALUES (5, @idSPXE, @fecha, @monto)

				-- PRINT (@monto)

				INSERT INTO TipoMovimientoDeduccion (Id, IdDeduccion)
				SELECT MAX(Id), @topIdDeduccion
				FROM MovimientoPlanilla

				UPDATE SemanaPlanillaXEmpleado
				SET SalarioNeto += @monto
				WHERE Id = @idSPXE

				UPDATE MesPlanillaXEmpleado
				SET SalarioNeto += @monto
				WHERE Id = @idMPXE
				--WHERE @idEmpleado = IdEmpleado AND @idMesActual = IdMesPlanilla

				DELETE FROM @deduccionesNoObligariasPorcentuales WHERE Id = @topIdDeduccion
				SELECT @cuentaDeducciones = COUNT(*) FROM @deduccionesNoObligariasPorcentuales
			END

			--PRINT ('SALE DEL WHILE DE LAS DEDUCCIONES PORCENTUALES NO OBLIGATORIAS')

			-- SI ES FIN DE MES
			IF (@fecha = (SELECT MAX(FechaFin) FROM dbo.MesPlanilla))
			BEGIN
				DECLARE @salarioTotalMensual MONEY
				SELECT @salarioTotalMensual = SalarioNeto
				FROM dbo.MesPlanillaXEmpleado
				WHERE Id = @idMPXE

				DECLARE @tablaDeduccionesNoPorcentuales TABLE (IdDeduccion INT, Monto FLOAT)

				INSERT INTO @tablaDeduccionesNoPorcentuales (IdDeduccion, Monto)
				SELECT DXE.IdDeduccion, DNO.Monto*-1
				FROM DeduccionesXEmpleado DXE
				INNER JOIN DeduccionNoObligatoria DNO ON DNO.Id = DXE.Id
				INNER JOIN TipoDeduccion TD ON TD.Id = DXE.IdDeduccion
				WHERE DXE.IdEmpleado = @idEmp AND DNO.Activo = 1 AND TD.EsPorcentual = 'No'

				DECLARE @contadorDeduccionesNoObligatorias INT
				SELECT @contadorDeduccionesNoObligatorias = COUNT(*) 
				FROM @tablaDeduccionesNoPorcentuales

				WHILE (@contadorDeduccionesNoObligatorias > 0)
				BEGIN
					DECLARE @topIdDeduccionNoObligatoria INT, @montoRebajado MONEY
					SELECT TOP(1) @topIdDeduccionNoObligatoria = IdDeduccion, @montoRebajado = Monto
					FROM @tablaDeduccionesNoPorcentuales

					UPDATE MesPlanillaXEmpleado
					SET SalarioNeto += @montoRebajado
					WHERE Id = @idMPXE

					UPDATE SemanaPlanillaXEmpleado
					SET SalarioNeto += @montoRebajado
					WHERE Id = @idSPXE

					INSERT INTO MovimientoPlanilla (IdTipoMovimiento, IdSemanaPlanillaXEmpleado, Monto, Fecha)
					VALUES (5, @idSPXE, @montoRebajado , @fecha)

					DECLARE @idMovimiento INT
					SELECT @idMovimiento = MAX(Id) FROM MovimientoPlanilla

					INSERT INTO TipoMovimientoDeduccion (Id, IdDeduccion)
					VALUES (@idMovimiento, @topIdDeduccionNoObligatoria)

					DELETE FROM @tablaDeduccionesNoPorcentuales WHERE IdDeduccion = @topIdDeduccionNoObligatoria
					SELECT @contadorDeduccionesNoObligatorias = COUNT(*) 
					FROM @tablaDeduccionesNoPorcentuales
				END
			END
		END
		SET @outResultCode = 50001
	END TRY
	BEGIN CATCH
		SET @outResultCode = 50005
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[Limpiar_BD]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Limpiar_BD]
AS
BEGIN

	SET NOCOUNT ON

	DELETE FROM Users

	DELETE FROM dbo.DetalleCorrida
	DBCC CHECKIDENT (DetalleCorrida, RESEED, 0)

	DELETE FROM dbo.Corrida
	DBCC CHECKIDENT (Corrida, RESEED, 0)

	DELETE FROM dbo.TipoOperacionXML

	DELETE FROM TipoMovimientoDeduccion

	DELETE FROM DeduccionesXEmpleado
	DBCC CHECKIDENT (DeduccionesXEmpleado, RESEED, 0)

	DELETE FROM DeduccionNoObligatoria

	DELETE FROM DeduccionObligatoria
	DELETE FROM TipoDeduccion

	DELETE FROM MovimientoPlanilla
	DBCC CHECKIDENT (MovimientoPlanilla, RESEED, 0)

	DELETE FROM MarcaAsistencia
	DBCC CHECKIDENT (MarcaAsistencia, RESEED, 0)

	DELETE FROM SemanaPlanillaXEmpleado
	DBCC CHECKIDENT (SemanaPlanillaXEmpleado, RESEED, 0)

	DELETE FROM SemanaPlanilla
	DBCC CHECKIDENT (SemanaPlanilla, RESEED, 0)

	DELETE MesPlanillaXEmpleado
	DBCC CHECKIDENT (MesPlanillaXEmpleado, RESEED, 0)

	DELETE MesPlanilla
	DBCC CHECKIDENT (MesPlanilla, RESEED, 0)

	DELETE FROM Empleados
	DBCC CHECKIDENT (Empleados, RESEED, 0)

	DELETE FROM SemanaPlanilla
	DBCC CHECKIDENT (SemanaPlanilla, RESEED, 0)

	DELETE FROM MesPlanilla
	DBCC CHECKIDENT (MesPlanilla, RESEED, 0)

	DELETE FROM Departamentos
	DELETE FROM Puesto
	DELETE FROM Tipo_de_Documento_de_Identidad
	DELETE FROM TipoMovimiento
	DELETE FROM TipoJornada
	DELETE FROM Feriado

	

	SET NOCOUNT OFF
	
END
GO
/****** Object:  StoredProcedure [dbo].[LogInEmpleado]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LogInEmpleado]
	@inUser VARCHAR(32),
	@inPwd VARCHAR(32),
	@outResultCode INT OUT
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		
		SELECT Id 
		FROM Empleados
		WHERE @inUser = Usuario AND @inPwd = Pwd

		SET @outResultCode = 50001
	END TRY
	BEGIN CATCH
		SET @outResultCode = 50005
	END CATCH

	SET NOCOUNT OFF
END





GO
/****** Object:  StoredProcedure [dbo].[Mostrar_Departamentos]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mostrar_Departamentos]
AS
BEGIN

	SET NOCOUNT ON;
	SELECT Id,Nombre FROM Departamentos WHERE Activo=1
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Mostrar_Empleados]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mostrar_Empleados]
AS
BEGIN

	SET NOCOUNT ON;
	SELECT E.Id, E.ValorDocIdentidad, E.Nombre, E.FechaDeNacimiento, P.Nombre AS NombrePuesto, D.Nombre AS NombreDept , T.Nombre AS DocId 
	FROM dbo.Empleados E
	INNER JOIN dbo.Puesto P ON E.IdPuesto = P.Id
	INNER JOIN dbo.Departamentos D ON E.IdDepartamento = D.Id
	INNER JOIN dbo.Tipo_de_Documento_de_Identidad T ON E.IdTipoIdentificacion = T.Id
	WHERE E.Activo = 1 ORDER BY E.Nombre
	SET NOCOUNT OFF;
END	
GO
/****** Object:  StoredProcedure [dbo].[Mostrar_Puestos]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mostrar_Puestos]
AS
BEGIN

	SET NOCOUNT ON;
	SELECT Id, Nombre, SalarioxHora FROM Puesto WHERE Activo=1 ORDER BY Nombre
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Mostrar_TipoDocID]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mostrar_TipoDocID]
AS
BEGIN

	SET NOCOUNT ON;
	SELECT Id,Nombre FROM Tipo_de_Documento_de_Identidad
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[MostrarDeduccionesXSemenaPlanilla]    Script Date: 30/6/2021 19:58:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MostrarDeduccionesXSemenaPlanilla]
	@inSemanaPlanillaXEmpleado INT,
	@outOutResultCode INT OUT
AS BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		DECLARE @tablaMovimientos TABLE (Id INT, IdDeduccion INT, Monto MONEY, Fecha DATE)

		DECLARE @idEmpleado INT
		SELECT @idEmpleado = IdEmpleado
		FROM SemanaPlanillaXEmpleado
		WHERE Id = @inSemanaPlanillaXEmpleado

		INSERT INTO @tablaMovimientos (Id, IdDeduccion, Monto, Fecha)
		SELECT MP.Id, TMD.IdDeduccion, MP.Monto, MP.Fecha 
		FROM MovimientoPlanilla MP
		INNER JOIN TipoMovimientoDeduccion TMD ON TMD.Id = MP.Id
		WHERE MP.IdSemanaPlanillaXEmpleado = @inSemanaPlanillaXEmpleado

		DECLARE @tablaResultados TABLE (Fecha DATE, NombreDeduccion VARCHAR(64), PorcentajeAplicado VARCHAR(10), MontoAplicado MONEY)

		DECLARE @contador INT
		SELECT @contador = COUNT(*) FROM @tablaMovimientos
		
		WHILE (@contador > 0)
		BEGIN
			
			DECLARE @nombreDeduccion VARCHAR(63), @porcentajeAplicado VARCHAR(10), @montoAplicado MONEY, @fecha DATE
			SET @porcentajeAplicado = 'No aplica'

			DECLARE @topIdMovimiento INT, @topIdDeduccion INT
			SELECT TOP(1) @topIdMovimiento = Id, @topIdDeduccion = IdDeduccion, @montoAplicado = Monto, @fecha = Fecha
			FROM @tablaMovimientos

			DECLARE @esPorcentual VARCHAR(2), @esObligatoria VARCHAR(2)
			SELECT @esPorcentual = TD.EsPorcentual, @esObligatoria = TD.Obligatoria, @nombreDeduccion = TD.Nombre
			FROM TipoDeduccion TD
			WHERE TD.Id = @topIdDeduccion
			
			IF (@esPorcentual = 'Si')
			BEGIN
				DECLARE @porcentaje FLOAT
				IF (@esObligatoria = 'Si')
				BEGIN
					SELECT @porcentaje = DO.Monto
					FROM DeduccionObligatoria DO
					WHERE DO.Id = @topIdDeduccion
				END

				ELSE
				BEGIN
					SELECT TOP(1) @porcentaje = DNO.Monto
					FROM DeduccionNoObligatoria DNO
					INNER JOIN DeduccionesXEmpleado DXE ON DNO.Id = DXE.Id
					INNER JOIN TipoDeduccion TD ON TD.Id = DXE.IdDeduccion
					WHERE DXE.IdEmpleado = @idEmpleado AND TD.EsPorcentual = 'Si'
				END

				SET @porcentajeAplicado = CAST((@porcentaje*100) AS VARCHAR(10)) + '%'
			END

			INSERT INTO @tablaResultados (Fecha, NombreDeduccion, PorcentajeAplicado, MontoAplicado)
			VALUES (@fecha, @nombreDeduccion, @porcentajeAplicado, @montoAplicado)

			DELETE FROM @tablaMovimientos WHERE Id = @topIdMovimiento
			SELECT @contador = COUNT(*) FROM @tablaMovimientos
		END

		SELECT *
		FROM @tablaResultados
		ORDER BY Fecha

		SET @outOutResultCode = 50001
	END TRY
	BEGIN CATCH
		SET @outOutResultCode = 50005
	END CATCH
	SET NOCOUNT OFF
END
GO
USE [master]
GO
ALTER DATABASE [Planilla_Empleados] SET  READ_WRITE 
GO
