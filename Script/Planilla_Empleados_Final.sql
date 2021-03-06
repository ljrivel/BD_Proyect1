USE [master]
GO
/****** Object:  Database [Planilla_Empleados]    Script Date: 28/05/2021 13:58:25 ******/
CREATE DATABASE [Planilla_Empleados]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Planilla_Empleados', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Planilla_Empleados.mdf' , SIZE = 139264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Planilla_Empleados_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Planilla_Empleados_log.ldf' , SIZE = 3481600KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [Planilla_Empleados] SET QUERY_STORE = OFF
GO
USE [Planilla_Empleados]
GO
/****** Object:  Table [dbo].[DeduccionesXEmpleado]    Script Date: 28/05/2021 13:58:26 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeduccionNoObligatoria]    Script Date: 28/05/2021 13:58:26 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeduccionObligatoria]    Script Date: 28/05/2021 13:58:26 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamentos]    Script Date: 28/05/2021 13:58:26 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 28/05/2021 13:58:26 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feriado]    Script Date: 28/05/2021 13:58:26 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MarcaAsistencia]    Script Date: 28/05/2021 13:58:26 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MesPlanilla]    Script Date: 28/05/2021 13:58:26 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MesPlanillaXEmpleado]    Script Date: 28/05/2021 13:58:26 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientoPlanilla]    Script Date: 28/05/2021 13:58:26 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Puesto]    Script Date: 28/05/2021 13:58:26 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SemanaPlanilla]    Script Date: 28/05/2021 13:58:26 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SemanaPlanillaXEmpleado]    Script Date: 28/05/2021 13:58:26 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_de_Documento_de_Identidad]    Script Date: 28/05/2021 13:58:26 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDeduccion]    Script Date: 28/05/2021 13:58:26 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoJornada]    Script Date: 28/05/2021 13:58:26 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimiento]    Script Date: 28/05/2021 13:58:26 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimientoDeduccion]    Script Date: 28/05/2021 13:58:26 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 28/05/2021 13:58:26 ******/
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
/****** Object:  StoredProcedure [dbo].[Actualizar_Puesto]    Script Date: 28/05/2021 13:58:26 ******/
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
/****** Object:  StoredProcedure [dbo].[Add_Empleado]    Script Date: 28/05/2021 13:58:26 ******/
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
/****** Object:  StoredProcedure [dbo].[Add_Puesto]    Script Date: 28/05/2021 13:58:26 ******/
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
/****** Object:  StoredProcedure [dbo].[AsociarEmpleadoConDeduccion]    Script Date: 28/05/2021 13:58:26 ******/
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
/****** Object:  StoredProcedure [dbo].[Borrar_Empleado]    Script Date: 28/05/2021 13:58:26 ******/
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
/****** Object:  StoredProcedure [dbo].[Borrar_Puesto]    Script Date: 28/05/2021 13:58:26 ******/
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
/****** Object:  StoredProcedure [dbo].[Cargar_Info]    Script Date: 28/05/2021 13:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Cargar_Info] @info XML

AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @doccnt INT,@XmlDoc XML
	SET @XmlDoc =@info;

	EXEC sp_xml_preparedocument @doccnt OUTPUT,@XmlDoc

	DECLARE @Size INT;


	-- Insert de puestos 
	Select @size  = COUNT(*)
	FROM
	OPENXML(@doccnt,'Datos/Catalogos/Puestos/Puesto',1)
	WITH(Id INT)

	DECLARE @Cont INT = 1;

	WHILE(@Cont <= @Size) BEGIN
   
		DECLARE @ruta VARCHAR(128)
		SET @ruta = 'Datos/Catalogos/Puestos/Puesto['+CAST(@Cont AS VARCHAR(10))+']'
		DECLARE @id INT;
		DECLARE @salario INT;
		DECLARE @nom VARCHAR(64)
		SELECT @id = Id,
			   @nom = Nombre,
			   @salario = SalarioXHora
		FROM
		OPENXML(@doccnt,@ruta,1)
		WITH(Id INT,Nombre VARCHAR(64),SalarioXHora INT)t -- 
		INSERT INTO Puesto VALUES (@id, 1, @nom,@salario)
		SET @Cont += 1;
	END


	-- Insert de Departamentos
	Select @size  = COUNT(*)
	FROM
	OPENXML(@doccnt,'Datos/Catalogos/Departamentos/Departamento',1)
	WITH(Id INT)

	SET @Cont = 1;

	WHILE(@Cont <= @Size) BEGIN
   
		SET @ruta = 'Datos/Catalogos/Departamentos/Departamento['+CAST(@Cont AS VARCHAR(10))+']'
		SELECT @id = Id,
			   @nom = Nombre
		FROM
		OPENXML(@doccnt,@ruta,1)
		WITH(Id INT,Nombre VARCHAR(64))t -- 
		INSERT INTO Departamentos VALUES (@id, 1, @nom)
		SET @Cont += 1;
	END

	--Insert de Tipo Identificacion
	Select @size  = COUNT(*)
	FROM
	OPENXML(@doccnt,'Datos/Catalogos/Tipos_de_Documento_de_Identificacion/TipoIdDoc',1)
	WITH(Id INT)



	SET @Cont = 1;

	WHILE(@Cont <= @Size) BEGIN
   
		SET @ruta = 'Datos/Catalogos/Tipos_de_Documento_de_Identificacion/TipoIdDoc['+CAST(@Cont AS VARCHAR(10))+']'
		SELECT @id = Id,
		       @nom = Nombre
		FROM
		OPENXML(@doccnt,@ruta,1)
		WITH(Id INT,Nombre VARCHAR(64))t -- 

		INSERT INTO Tipo_de_Documento_de_Identidad VALUES (@id, @nom)
		SET @Cont += 1;
	END
	
	-- Insert de Empleados
	Select @size  = COUNT(*)
	FROM
	OPENXML(@doccnt,'Datos/Empleados/Empleado',1)
	WITH(idTipoDocumentacionIdentidad INT)

	SET @Cont = 1;

	WHILE(@Cont <= @Size) BEGIN
   
		SET @ruta = 'Datos/Empleados/Empleado['+CAST(@Cont AS VARCHAR(10))+']'
			DECLARE @idTipoDoc INT;
			DECLARE @idPuest INT
			DECLARE @idDto INT
			DECLARE @valId INT
			DECLARE @fecha DATE
			SELECT @idTipoDoc =  idTipoDocumentacionIdentidad,
				   @idPuest = idPuesto,
				   @idDto = IdDepartamento,
				   @valId = ValorDocumentoIdentidad,
				   @nom = Nombre,
				   @fecha = FechaNacimiento

		FROM
		OPENXML(@doccnt,@ruta,1)
		WITH(idTipoDocumentacionIdentidad INT, idPuesto INT,IdDepartamento INT,ValorDocumentoIdentidad INT, Nombre NVARCHAR(64), FechaNacimiento DATE)t -- formato de los archivos a escribir
		INSERT INTO Empleados VALUES (@idTipoDoc, @idPuest, @idDto, 1, @valId, @nom, @fecha)
		SET @Cont += 1;
	END 


	-- Insert de Usuarios
	Select @size  = COUNT(*)
	FROM
	OPENXML(@doccnt,'Datos/Usuarios/Usuario',1)
	WITH(username INT)

	SET @Cont = 1;

	WHILE(@Cont <= @Size) BEGIN
		
		DECLARE @user VARCHAR(64);
		DECLARE @pass VARCHAR(64);
		DECLARE @type VARCHAR(64);
		SET @ruta = 'Datos/Usuarios/Usuario['+CAST(@Cont AS VARCHAR(10))+']'
		SELECT @user = username,
		       @pass= pwd,
			   @type = tipo
		FROM
		OPENXML(@doccnt,@ruta,1)
		WITH(username VARCHAR(64),pwd VARCHAR(64),tipo VARCHAR(64))t -- 
		INSERT INTO Users VALUES (@user, @pass, @type)
		SET @Cont += 1;
	END

	SET NOCOUNT OFF;


END
GO
/****** Object:  StoredProcedure [dbo].[CargarOperaciones]    Script Date: 28/05/2021 13:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CargarOperaciones]
	@doc XML
AS BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		BEGIN TRANSACTION Cargar_Operaciones
			DECLARE @doccnt INT,@XmlDoc XML
			EXEC sp_xml_preparedocument @doccnt OUTPUT,@doc

			DECLARE @size INT
			SELECT @size  = COUNT(*) FROM OPENXML(@doccnt,'Datos/Operacion',1) WITH(Id INT)

			DECLARE @ContOperaciones INT = 1;

			WHILE(@ContOperaciones <= @Size) 
			BEGIN
   
				DECLARE @ruta VARCHAR(128)
				DECLARE @fechaOperacion DATE
				DECLARE @marcaAsistencia XML

				SET @ruta = 'Datos/Operacion['+CAST(@ContOperaciones AS VARCHAR(10))+']'


				SELECT @fechaOperacion = Fecha
				FROM OPENXML(@doccnt, @ruta, 1)
				WITH(Fecha DATE)t 

				DECLARE @cantidadMarcasAsistencia INT
				DECLARE @rutaMarcas VARCHAR(128)
				SET @rutaMarcas = @ruta + '/MarcaDeAsistencia'

				SELECT @cantidadMarcasAsistencia  = COUNT(*) FROM OPENXML(@doccnt, @rutaMarcas, 1) WITH(Id INT)
	
				DECLARE @contadorMarcas INT
				SET @contadorMarcas = 1

				WHILE (@contadorMarcas <= @cantidadMarcasAsistencia)
				BEGIN
					DECLARE @rutaMarcaAsistencia VARCHAR(128)
					SET @rutaMarcaAsistencia = @rutaMarcas + '[' + CAST(@contadorMarcas AS VARCHAR(10)) + ']'

					DECLARE @valorDoc INT
					DECLARE @horaEntrada DATETIME, @horaSalida DATETIME
		
					SELECT  @valorDoc = ValorDocumentoIdentidad,
							@horaEntrada = FechaEntrada,
							@horaSalida = FechaSalida
					FROM OPENXML(@doccnt, @rutaMarcaAsistencia, 1)
					WITH (ValorDocumentoIdentidad INT, FechaEntrada DATETIME, FechaSalida DATETIME)t 
		
					EXEC HacerMarcaAsistencia @valorDoc, @horaEntrada, @horaSalida, 0

		
					SET @contadorMarcas += 1
				END


				DECLARE @diaDeLaSemana VARCHAR(10)
				SET @diaDeLaSemana = DATENAME(dw,@fechaOperacion)
				IF (@diaDeLaSemana = 'Jueves' OR @diaDeLaSemana = 'Thursday')
				BEGIN 
				
					-- Añadir empleados
					DECLARE @cantidadNuevosEmpleados INT
					DECLARE @rutaEmpleados VARCHAR (128)
				
					SET @rutaEmpleados = @ruta + '/NuevoEmpleado'
					SELECT @cantidadNuevosEmpleados  = COUNT(*) FROM OPENXML(@doccnt, @rutaEmpleados, 1) WITH(Id INT)
				
					DECLARE @contadorEmpleados INT
					SET @contadorEmpleados = 1

					WHILE (@contadorEmpleados <= @cantidadNuevosEmpleados)
					BEGIN
						DECLARE @rutaNuevoEmpleado VARCHAR(128)
						SET @rutaNuevoEmpleado = @rutaEmpleados + '[' + CAST(@contadorEmpleados AS VARCHAR(10)) + ']'
					
						DECLARE @idPuesto INT, @idDepto INT, @idTipDocId INT
						DECLARE @valorDocumentoIdentidad INT, @nacimiento DATE
						DECLARE @nombre VARCHAR(64), @user VARCHAR(32), @pass VARCHAR(32)


						SELECT  @idTipDocId = idTipoDocumentacionIdentidad,
								@idPuesto = idPuesto,
								@idDepto = idDepartamento,
								@valorDocumentoIdentidad = ValorDocumentoIdentidad,
								@nombre = Nombre,
								@nacimiento = FechaNacimiento,
								@user = Username,
								@pass = Password
						FROM OPENXML(@doccnt, @rutaNuevoEmpleado, 1)
						WITH (idTipoDocumentacionIdentidad INT, idPuesto INT, idDepartamento INT, ValorDocumentoIdentidad INT, 
								Nombre VARCHAR(64), FechaNacimiento DATE, Username VARCHAR(32), Password VARCHAR(32))t 

						EXEC Add_Empleado @idTipDocId, @idPuesto, @idDepto, @valorDocumentoIdentidad, @nombre, @nacimiento, @user, @pass, 1

						SET @contadorEmpleados += 1
					END -- FIN DEL WHILE PARA AÑADIR EMPLEADOS


					--Eliminar empleados
					DECLARE @cantidadEmpleadosEliminados INT
					DECLARE @rutaEmpleadosEliminados VARCHAR (128)
				
					SET @rutaEmpleadosEliminados = @ruta + '/EliminarEmpleado'
					SELECT @cantidadEmpleadosEliminados  = COUNT(*) FROM OPENXML(@doccnt, @rutaEmpleadosEliminados, 1) WITH(Id INT)
				
					DECLARE @contadorEmpleadosEliminados INT
					SET @contadorEmpleadosEliminados = 1

					WHILE (@contadorEmpleadosEliminados <= @cantidadEmpleadosEliminados)
					BEGIN
						DECLARE @rutaEmpleadoEliminado VARCHAR(256)
						SET @rutaEmpleadoEliminado = @rutaEmpleadosEliminados + '[' + CAST(@contadorEmpleadosEliminados AS VARCHAR(10)) + ']'
		
						DECLARE @valorDocumentoId INT


						SELECT  @valorDocumentoId = ValorDocumentoIdentidad
						FROM OPENXML(@doccnt, @rutaEmpleadoEliminado, 1)
						WITH (ValorDocumentoIdentidad INT)t 

						EXEC EliminarEmpleadoPorDocumentoIdentidad @valorDocumentoId, 1

						SET @contadorEmpleadosEliminados += 1
					END -- FIN DEL WHILE PARA ELIMINAR EMPLEADOS

					EXEC GestionarFinDeSemana @fechaOperacion, 1


					--ACTUALIZAR LAS NUEVAS JORNADAS DE LOS EMPLEADOS
					DECLARE @rutaNuevasJornadas VARCHAR(64)
					SET @rutaNuevasJornadas = @ruta + '/TipoDeJornadaProximaSemana'

					DECLARE @cantidadJornadas INT
					SELECT @cantidadJornadas  = COUNT(*) FROM OPENXML(@doccnt, @rutaNuevasJornadas, 1) WITH(Id INT)
				
					DECLARE @contadorJornadas INT
					SET @contadorJornadas = 1

					WHILE (@contadorJornadas <= @cantidadJornadas)
					BEGIN
						DECLARE @rutaNuevaJornada VARCHAR(128)
						SET @rutaNuevaJornada = @rutaNuevasJornadas + '[' + CAST(@contadorJornadas AS VARCHAR(10)) + ']'
		
						DECLARE @valorDocId INT, @nuevaJornada INT


						SELECT  @valorDocId = ValorDocumentoIdentidad,
								@nuevaJornada = IdJornada
						FROM OPENXML(@doccnt, @rutaNuevaJornada, 1)
						WITH (IdJornada INT, ValorDocumentoIdentidad INT)t 

						DECLARE @idSemana INT
						SELECT @idSemana = MAX(Id) FROM SemanaPlanilla

						DECLARE @idEmpleado INT
						SELECT @idEmpleado = Id FROM Empleados E WHERE @valorDocId = E.ValorDocIdentidad

						UPDATE SemanaPlanillaXEmpleado
						SET IdTipoDeJornada = @nuevaJornada
						WHERE @idEmpleado = IdEmpleado AND @idSemana = IdSemanaPlanilla

						SET @contadorJornadas += 1
					END -- FIN DEL WHILE PARA ACTUALIZAR LAS NUEVAS JORNADAS DE LOS EMPLEADOS
				END

				DECLARE @cantidadAsociaciones INT
				DECLARE @rutaAsociaciones VARCHAR(128)
				SET @rutaAsociaciones = @ruta + '/AsociaEmpleadoConDeduccion'

				SELECT @cantidadAsociaciones  = COUNT(*) FROM OPENXML(@doccnt, @rutaAsociaciones, 1) WITH(Id INT)
	
				DECLARE @contadorAsociaciones INT = 1

				WHILE (@contadorAsociaciones <= @cantidadAsociaciones)
				BEGIN
					DECLARE @rutaAsociacion VARCHAR(128)
					SET @rutaAsociacion = @rutaAsociaciones + '[' + CAST(@contadorAsociaciones AS VARCHAR(10)) + ']'

					DECLARE @valorDocuId INT
					DECLARE @idDeduccion INT, @monto FLOAT 
		
					SELECT  @idDeduccion = IdDeduccion,
							@monto = Monto,
							@valorDocuId = ValorDocumentoIdentidad
					FROM OPENXML(@doccnt, @rutaAsociacion, 1)
					WITH (IdDeduccion INT, Monto FLOAT, ValorDocumentoIdentidad INT )t 
			
					EXEC AsociarEmpleadoConDeduccion @valorDocuId, @idDeduccion, @monto, 0
		
					SET @contadorAsociaciones += 1
				END


			-- DESASOCIAR EMPLEADOS DE DEDUCCIONES
			DECLARE @cantidadDesasociaciones INT
				DECLARE @rutaDesasociaciones VARCHAR(128)
				SET @rutaDesasociaciones = @ruta + '/DesasociaEmpleadoConDeduccion'

				SELECT @cantidadDesasociaciones  = COUNT(*) FROM OPENXML(@doccnt, @rutaDesasociaciones, 1) WITH(Id INT)
	
				DECLARE @contadorDesasociaciones INT = 1

				WHILE (@contadorDesasociaciones <= @cantidadDesasociaciones)
				BEGIN
					DECLARE @rutaDesasociacion VARCHAR(128)
					SET @rutaDesasociacion = @rutaDesasociaciones + '[' + CAST(@contadorDesasociaciones AS VARCHAR(10)) + ']'
		
					SELECT  @idDeduccion = IdDeduccion,
							@valorDocuId = ValorDocumentoIdentidad
					FROM OPENXML(@doccnt, @rutaDesasociacion, 1)
					WITH (IdDeduccion INT, ValorDocumentoIdentidad INT)t 
			
					EXEC DesasociarEmpleadoConDeduccion @valorDocuId, @idDeduccion, 0
		
					SET @contadorDesasociaciones += 1
				END

				SET @ContOperaciones += 1;
			END

		COMMIT TRANSACTION Cargar_Operaciones
	END TRY

	BEGIN CATCH
		IF (@@TRANCOUNT > 0)
		BEGIN
			ROLLBACK TRANSACTION Cargar_Operaciones
		END
	END CATCH
	SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[CargarXML]    Script Date: 28/05/2021 13:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CargarXML] 
	@outResultCode INT OUT,
	@outResultMessage VARCHAR(64) OUT
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		BEGIN TRANSACTION CargarDatos

			DECLARE @doc XML
			SELECT @doc = BulkColumn
			FROM OPENROWSET(BULK 'C:\Archivos_Proyecto\Datos_Tarea2.xml', SINGLE_CLOB) AS xmlData

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
		
			EXEC CargarOperaciones @doc
			SET @outResultCode = 50001
			SET @outResultMessage = 'Se cargaron exitosamente'
		COMMIT TRANSACTION CargarDatos
	END TRY
	BEGIN CATCH
		IF (@@TRANCOUNT > 0)
		BEGIN
			ROLLBACK TRANSACTION CargarDatos
		END
		SET @outResultCode = 50005
		SET @outResultMessage = 'Error al cargar los archivos'
	END CATCH 
	PRINT @outResultMessage
	SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarDeduccionesDeMes]    Script Date: 28/05/2021 13:58:26 ******/
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

		SELECT *
		FROM @tablaResultados
		ORDER BY Fecha

		SET @outResultCode = 50001
	END TRY
	BEGIN CATCH
		SET @outResultCode = 50005
	END CATCH

	SET NOCOUNT OFF
END

--EXEC ConsultarDeduccionesDeMes 2, 2, 0
--SELECT * FROM DeduccionNoObligatoria
GO
/****** Object:  StoredProcedure [dbo].[ConsultarDetallesSemana]    Script Date: 28/05/2021 13:58:26 ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarMeses]    Script Date: 28/05/2021 13:58:26 ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarSemanas]    Script Date: 28/05/2021 13:58:26 ******/
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
/****** Object:  StoredProcedure [dbo].[Datos_Usuarios]    Script Date: 28/05/2021 13:58:26 ******/
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
/****** Object:  StoredProcedure [dbo].[DesasociarEmpleadoConDeduccion]    Script Date: 28/05/2021 13:58:26 ******/
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
/****** Object:  StoredProcedure [dbo].[Editar_Empleado]    Script Date: 28/05/2021 13:58:26 ******/
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
	@inFechaNacimiento DATE,
	@outCode INT OUT
AS
BEGIN

	SET NOCOUNT ON;
	BEGIN TRY
	UPDATE [dbo].[Empleados]
		SET IdTipoIdentificacion = @inIdTipoId,
			IdPuesto = @inIdPuesto, 
			IdDepartamento = @inIdDepartamento,
			ValorDocIdentidad = @inValorId, 
			Nombre = @inNombre,
			FechaDeNacimiento = @inFechaNacimiento
		WHERE Id = @inId

		SET @outCode = 50001
	END TRY

	BEGIN CATCH
		SET @outCode = 50002
	END CATCH
	SET NOCOUNT OFF;
END	
GO
/****** Object:  StoredProcedure [dbo].[EliminarEmpleadoPorDocumentoIdentidad]    Script Date: 28/05/2021 13:58:26 ******/
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
/****** Object:  StoredProcedure [dbo].[Filtrar_Empleados]    Script Date: 28/05/2021 13:58:26 ******/
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
/****** Object:  StoredProcedure [dbo].[GestionarFinDeMes]    Script Date: 28/05/2021 13:58:26 ******/
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

			DECLARE @tablaEmpleadosDelMes TABLE (Id INT, IdEmpleado INT)

			INSERT INTO @tablaEmpleadosDelMes (Id, IdEmpleado)
			SELECT Id, IdEmpleado 
			FROM MesPlanillaXEmpleado
			WHERE IdMesPlanilla = @idMes

			DECLARE @contadorEmpleadosDelMes INT
			SELECT @contadorEmpleadosDelMes = COUNT(*) FROM @tablaEmpleadosDelMes

			WHILE (@contadorEmpleadosDelMes > 0)
			BEGIN 
				--PRINT 'ENTRA AL WHILE'
				DECLARE @topIdEmpleado INT, @topMesPlanillaXEmpleado INT
				SELECT TOP(1) @topMesPlanillaXEmpleado = Id , @topIdEmpleado = IdEmpleado
				FROM @tablaEmpleadosDelMes

				DECLARE @topSemanaPlanillaXEmpleado INT
				SELECT @topSemanaPlanillaXEmpleado = Id
				FROM SemanaPlanillaXEmpleado 
				WHERE IdEmpleado = @topIdEmpleado
			
				DECLARE @tablaDeduccionesDelEmpleado TABLE (IdDeduccion INT, Monto FLOAT)

				INSERT INTO @tablaDeduccionesDelEmpleado (IdDeduccion, Monto)
				SELECT DXE.IdDeduccion, DNO.Monto*-1
				FROM DeduccionesXEmpleado DXE
				INNER JOIN DeduccionNoObligatoria DNO ON DNO.Id = DXE.Id
				INNER JOIN TipoDeduccion TD ON TD.Id = DXE.IdDeduccion
				WHERE DXE.IdEmpleado = @topIdEmpleado AND DNO.Activo = 1 AND TD.EsPorcentual = 'No'

				DECLARE @contadorDeduccionesDelEmpleado INT
				SELECT @contadorDeduccionesDelEmpleado = COUNT(*)
				FROM @tablaDeduccionesDelEmpleado

				WHILE (@contadorDeduccionesDelEmpleado > 0)
				BEGIN
					--PRINT 'ENTRA EN EL SEGUNDO WHILE'
					DECLARE @topIdDeduccion INT, @topMonto FLOAT
					SELECT TOP(1) @topIdDeduccion = IdDeduccion, @topMonto = Monto 
					FROM @tablaDeduccionesDelEmpleado

					UPDATE MesPlanillaXEmpleado
					SET SalarioNeto += @topMonto
					WHERE Id = @topMesPlanillaXEmpleado

					UPDATE SemanaPlanillaXEmpleado
					SET SalarioNeto += @topMonto
					WHERE Id = @topSemanaPlanillaXEmpleado

					INSERT INTO MovimientoPlanilla (IdTipoMovimiento, IdSemanaPlanillaXEmpleado, Monto, Fecha)
					VALUES (5, @topSemanaPlanillaXEmpleado, @topMonto , @inFecha)

					DECLARE @idMovimiento INT
					SELECT @idMovimiento = MAX(Id) FROM MovimientoPlanilla

					INSERT INTO TipoMovimientoDeduccion (Id, IdDeduccion)
					VALUES (@idMovimiento, @topIdDeduccion)

					DELETE FROM @tablaDeduccionesDelEmpleado 
					WHERE IdDeduccion = @topIdDeduccion

					SELECT @contadorDeduccionesDelEmpleado = COUNT(*)
					FROM @tablaDeduccionesDelEmpleado
				END

				DELETE FROM @tablaEmpleadosDelMes WHERE IdEmpleado = @topIdEmpleado
				SELECT @contadorEmpleadosDelMes = COUNT(*) FROM @tablaEmpleadosDelMes
			END

			DECLARE @siguienteFinDeMes  DATE
			SET @siguienteFinDeMes = DATEADD(DD, 1, @inFecha)

			WHILE (DATEPART(mm, @siguienteFindeMes) = DATEPART(mm, @inFecha))
			BEGIN
				SET @siguienteFinDeMes = DATEADD(DD, 7, @siguienteFinDeMes)
			END

			INSERT INTO MesPlanilla (FechaInicio, FechaFin)
			VALUES (DATEADD(DD, 1, @inFecha), DATEADD(DD, -1, @siguienteFinDeMes))

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
/****** Object:  StoredProcedure [dbo].[GestionarFinDeSemana]    Script Date: 28/05/2021 13:58:26 ******/
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

			INSERT INTO @tabla (idPSemanaXEmpleado)
			SELECT DISTINCT (idSemanaPlanillaXEmpleado)
			FROM MarcaAsistencia MA
			INNER JOIN SemanaPlanillaXEmpleado SPXE ON SPXE.Id = MA.IdSemanaPlanillaXEmpleado
			WHERE SPXE.IdSemanaPlanilla = @idSemana

			DECLARE @contador INT 
			SELECT @contador = COUNT(*) FROM @tabla

			WHILE (@contador > 0)
			BEGIN
				DECLARE @topId INT
				SELECT TOP(1) @topId =idPSemanaXEmpleado FROM @tabla


				DECLARE @horasOrdinarias INT, @horasExtraordinarias INT,  @pagoBaseXHora MONEY
				DECLARE @horasExtraDobles INT

				SELECT	@horasOrdinarias = SUM(HorasOrdinarias), 
						@horasExtraordinarias = SUM(HorasExtraNormales), 
						@horasExtraDobles = SUM(HorasExtraDobles)
				FROM MarcaAsistencia 
				WHERE IdSemanaPlanillaXEmpleado = @topId

				SELECT @pagoBaseXHora = SalarioXHora FROM Puesto P
				INNER JOIN SemanaPlanillaXEmpleado SPXE ON SPXE.Id=@topId
				INNER JOIN Empleados E ON E.Id = SPXE.IdEmpleado
				WHERE P.Id = E.IdPuesto

				DECLARE @pagoOrdinario MONEY = @pagoBaseXHora * @horasOrdinarias
				DECLARE @pagoExtra MONEY = (@pagoBaseXhora * 1.5) * @horasExtraordinarias
				DECLARE @pagoExtraDoble MONEY = (@pagoBaseXhora * 2) * @horasExtraDobles
				DECLARE @pagoSemanal MONEY = @pagoOrdinario + @pagoExtra + @pagoExtraDoble

				UPDATE SemanaPlanillaXEmpleado
				SET SalarioBruto = @pagoSemanal, SalarioNeto = @pagoSemanal
				WHERE Id = @topId

				DECLARE @idEmpleado INT
				SELECT @idEmpleado = IdEmpleado 
				FROM SemanaPlanillaXEmpleado
				WHERE Id = @topId

				UPDATE MesPlanillaXEmpleado
				SET SalarioTotal += @pagoSemanal, SalarioNeto += @pagoSemanal
				WHERE @idEmpleado = IdEmpleado AND @idMesActual = IdMesPlanilla

				INSERT INTO MovimientoPlanilla (IdTipoMovimiento, IdSemanaPlanillaXEmpleado, Fecha, Monto)
				VALUES (1, @topId, @inFecha, @pagoOrdinario)

				IF (@pagoExtra > 0)
				BEGIN
					INSERT INTO MovimientoPlanilla (IdTipoMovimiento, IdSemanaPlanillaXEmpleado, Fecha, Monto)
					VALUES (2, @topId, @inFecha, @pagoExtra)
				END

				IF (@pagoExtraDoble > 0)
				BEGIN
					INSERT INTO MovimientoPlanilla (IdTipoMovimiento, IdSemanaPlanillaXEmpleado, Fecha, Monto)
					VALUES (3, @topId, @inFecha, @pagoExtraDoble)
				END

			-- APLICAR LAS DEDUCCIONES PORCENTUALES OBLIGATORIAS
				DECLARE @deduccionesDeLeyPorcentuales TABLE (Id INT, Monto FLOAT)

				INSERT INTO @deduccionesDeLeyPorcentuales (Id, Monto)
				SELECT TD.Id, DO.Monto FROM DeduccionesXEmpleado DXE
				INNER JOIN TipoDeduccion TD ON TD.Id = DXE.IdDeduccion
				INNER JOIN DeduccionObligatoria DO ON DO.Id = TD.Id
				WHERE TD.EsPorcentual = 'Si' AND TD.Obligatoria='Si'
				AND DXE.IdEmpleado = (SELECT IdEmpleado FROM SemanaPlanillaXEmpleado WHERE Id = @topId)


				DECLARE @cuentaDeducciones INT
				SELECT @cuentaDeducciones = COUNT(*) FROM @deduccionesDeLeyPorcentuales

				WHILE (@cuentaDeducciones > 0)
				BEGIN
					DECLARE @topDeduccionId INT
					SELECT TOP(1) @topDeduccionId = Id FROM @deduccionesDeLeyPorcentuales

					DECLARE @montoRebajado MONEY
					SELECT @montoRebajado = (-1)*(@pagoSemanal)*Monto 
					FROM @deduccionesDeLeyPorcentuales
					WHERE Id = @topDeduccionId

					INSERT INTO MovimientoPlanilla (IdTipoMovimiento, IdSemanaPlanillaXEmpleado, Fecha, Monto)
					VALUES (4, @topId, @inFecha, @montoRebajado)

					INSERT INTO TipoMovimientoDeduccion (Id, IdDeduccion)
					SELECT MAX(Id), @topDeduccionId 
					FROM MovimientoPlanilla

					UPDATE SemanaPlanillaXEmpleado
					SET SalarioNeto += @montoRebajado
					WHERE Id = @topId

					UPDATE MesPlanillaXEmpleado
					SET SalarioNeto += @montoRebajado
					WHERE @idEmpleado = IdEmpleado AND @idMesActual = IdMesPlanilla

					DELETE FROM @deduccionesDeLeyPorcentuales WHERE Id = @topDeduccionId
					SELECT @cuentaDeducciones = COUNT(*) FROM @deduccionesDeLeyPorcentuales
				END

		--APLICAR DEDUCCIONES PORCENTUALES NO OBLIGATORIAS
				DECLARE @deduccionesNoObligariasPorcentuales TABLE (Id INT, Monto FLOAT)

				INSERT INTO @deduccionesNoObligariasPorcentuales (Id, Monto)
				SELECT TD.Id, DNO.Monto FROM DeduccionesXEmpleado DXE
				INNER JOIN TipoDeduccion TD ON TD.Id = DXE.IdDeduccion
				INNER JOIN DeduccionNoObligatoria DNO ON DNO.Id = DXE.Id
				WHERE TD.EsPorcentual = 'Si' AND TD.Obligatoria='No' AND DNO.Activo = 1
				AND DXE.IdEmpleado = (SELECT IdEmpleado FROM SemanaPlanillaXEmpleado WHERE Id = @topId)

				SELECT @cuentaDeducciones = COUNT(*) FROM @deduccionesNoObligariasPorcentuales

				WHILE (@cuentaDeducciones > 0)
				BEGIN
					SELECT TOP(1) @topDeduccionId = Id FROM @deduccionesNoObligariasPorcentuales

					SELECT @montoRebajado = (-1)*(@pagoSemanal)*Monto 
					FROM @deduccionesNoObligariasPorcentuales
					WHERE Id = @topDeduccionId

					INSERT INTO MovimientoPlanilla (IdTipoMovimiento, IdSemanaPlanillaXEmpleado, Fecha, Monto)
					VALUES (5, @topId, @inFecha, @montoRebajado)

					INSERT INTO TipoMovimientoDeduccion (Id, IdDeduccion)
					SELECT MAX(Id), @topDeduccionId 
					FROM MovimientoPlanilla

					DECLARE @ultimoId INT
					SELECT @ultimoId = MAX(Id)
					FROM MovimientoPlanilla

					UPDATE SemanaPlanillaXEmpleado
					SET SalarioNeto += @montoRebajado
					WHERE Id = @topId

					UPDATE MesPlanillaXEmpleado
					SET SalarioNeto += @montoRebajado
					WHERE @idEmpleado = IdEmpleado AND @idMesActual = IdMesPlanilla

					DELETE FROM @deduccionesNoObligariasPorcentuales WHERE Id = @topDeduccionId
					SELECT @cuentaDeducciones = COUNT(*) FROM @deduccionesNoObligariasPorcentuales
				END

				DELETE FROM @tabla WHERE idPSemanaXEmpleado = @topId
				SELECT @contador = COUNT(*) FROM @tabla
			END


			SELECT @idMesActual = MAX(Id) FROM MesPlanilla

			IF (@idMesActual != 0)
			BEGIN
				SELECT @fechaFinDeMes = FechaFin 
				FROM MesPlanilla WHERE @idMesActual=Id

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
/****** Object:  StoredProcedure [dbo].[HacerMarcaAsistencia]    Script Date: 28/05/2021 13:58:26 ******/
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

		
		DECLARE @idSPXE INT
		SELECT @idSPXE = MAX(Id) 
		FROM SemanaPlanillaXEmpleado 
		WHERE @idEmp = IdEmpleado


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

		DECLARE @horasOrdinarias INT, @horasExtra INT
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

		
		
		SET @outResultCode = 50001
	END TRY
	BEGIN CATCH
		SET @outResultCode = 50005
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[Limpiar_BD]    Script Date: 28/05/2021 13:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Limpiar_BD]
AS
BEGIN

	SET NOCOUNT ON

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
/****** Object:  StoredProcedure [dbo].[LogInEmpleado]    Script Date: 28/05/2021 13:58:26 ******/
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
/****** Object:  StoredProcedure [dbo].[Mostrar_Departamentos]    Script Date: 28/05/2021 13:58:26 ******/
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
/****** Object:  StoredProcedure [dbo].[Mostrar_Empleados]    Script Date: 28/05/2021 13:58:26 ******/
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
/****** Object:  StoredProcedure [dbo].[Mostrar_Puestos]    Script Date: 28/05/2021 13:58:26 ******/
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
/****** Object:  StoredProcedure [dbo].[Mostrar_TipoDocID]    Script Date: 28/05/2021 13:58:26 ******/
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
/****** Object:  StoredProcedure [dbo].[MostrarDeduccionesXSemenaPlanilla]    Script Date: 28/05/2021 13:58:26 ******/
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
