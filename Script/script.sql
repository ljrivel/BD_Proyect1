USE [master]
GO
/****** Object:  Database [Planilla_Empleados]    Script Date: 17/05/2021 16:53:48 ******/
CREATE DATABASE [Planilla_Empleados]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Planilla_Empleados', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Planilla_Empleados.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Planilla_Empleados_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Planilla_Empleados_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[Departamentos]    Script Date: 17/05/2021 16:53:49 ******/
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
/****** Object:  Table [dbo].[Empleados]    Script Date: 17/05/2021 16:53:49 ******/
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
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feriado]    Script Date: 17/05/2021 16:53:49 ******/
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
/****** Object:  Table [dbo].[MarcaAsistencia]    Script Date: 17/05/2021 16:53:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarcaAsistencia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdSemanaPlanillaXEmpleado] [int] NOT NULL,
	[HoraEntrada] [datetime] NOT NULL,
	[HoraSalida] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MesPlanilla]    Script Date: 17/05/2021 16:53:49 ******/
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
/****** Object:  Table [dbo].[Puesto]    Script Date: 17/05/2021 16:53:49 ******/
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
/****** Object:  Table [dbo].[SemanaPlanilla]    Script Date: 17/05/2021 16:53:49 ******/
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
/****** Object:  Table [dbo].[SemanaPlanillaXEmpleado]    Script Date: 17/05/2021 16:53:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SemanaPlanillaXEmpleado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[IdSemanaPlanilla] [int] NOT NULL,
	[IdTipoDeJornada] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_de_Documento_de_Identidad]    Script Date: 17/05/2021 16:53:49 ******/
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
/****** Object:  Table [dbo].[TipoJornada]    Script Date: 17/05/2021 16:53:49 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 17/05/2021 16:53:49 ******/
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
ALTER TABLE [dbo].[MarcaAsistencia]  WITH CHECK ADD  CONSTRAINT [FK_MarcaAsistencia_SemanaXEmpleado] FOREIGN KEY([IdSemanaPlanillaXEmpleado])
REFERENCES [dbo].[SemanaPlanillaXEmpleado] ([Id])
GO
ALTER TABLE [dbo].[MarcaAsistencia] CHECK CONSTRAINT [FK_MarcaAsistencia_SemanaXEmpleado]
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
/****** Object:  StoredProcedure [dbo].[Actualizar_Puesto]    Script Date: 17/05/2021 16:53:49 ******/
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
/****** Object:  StoredProcedure [dbo].[Add_Empleado]    Script Date: 17/05/2021 16:53:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_Empleado]
	@inIdTipoId int,
	@inIdPuesto int,
	@inIdDepartamento int,
	@inValorId int,
	@inNombre varchar(64),
	@inFechaNacimiento date
AS
BEGIN

	SET NOCOUNT ON;
	insert into Empleados values (@inIdTipoId,@inIdPuesto,@inIdDepartamento,1,@inValorId,@inNombre, @inFechaNacimiento)
	SET NOCOUNT OFF;
END	
GO
/****** Object:  StoredProcedure [dbo].[Add_Puesto]    Script Date: 17/05/2021 16:53:49 ******/
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
/****** Object:  StoredProcedure [dbo].[Borrar_Empleado]    Script Date: 17/05/2021 16:53:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Borrar_Empleado]
	@inId INT
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS(SELECT 1 FROM Empleados E WHERE E.Activo=1)
	BEGIN
		UPDATE Empleados
		SET Activo=0
		WHERE Id=@inId
	END

	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[Borrar_Puesto]    Script Date: 17/05/2021 16:53:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Borrar_Puesto]
	@inId int
AS
BEGIN

	SET NOCOUNT ON;
	UPDATE dbo.Puesto
	SET Activo=0
	WHERE Id=@inId
	SET NOCOUNT OFF;
END	
GO
/****** Object:  StoredProcedure [dbo].[Cargar_Info]    Script Date: 17/05/2021 16:53:49 ******/
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
/****** Object:  StoredProcedure [dbo].[Datos_Usuarios]    Script Date: 17/05/2021 16:53:49 ******/
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
/****** Object:  StoredProcedure [dbo].[Editar_Empleado]    Script Date: 17/05/2021 16:53:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Editar_Empleado]
	@inId int,
	@inIdTipoId int,
	@inIdPuesto int,
	@inIdDepartamento int,
	@inValorId int,
	@inNombre varchar(64),
	@inFechaNacimiento date
AS
BEGIN

	SET NOCOUNT ON;
	UPDATE Empleados
	SET IdTipoIdentificacion=@inIdTipoId, IdPuesto=@inIdPuesto, IdDepartamento=@inIdDepartamento,
		ValorDocIdentidad=@inValorId, Nombre=@inNombre, FechaDeNacimiento=@inFechaNacimiento
	WHERE Id=@inId
	SET NOCOUNT OFF;
END	
GO
/****** Object:  StoredProcedure [dbo].[Filtrar_Empleados]    Script Date: 17/05/2021 16:53:50 ******/
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
/****** Object:  StoredProcedure [dbo].[Mostrar_Departamentos]    Script Date: 17/05/2021 16:53:50 ******/
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
/****** Object:  StoredProcedure [dbo].[Mostrar_Empleados]    Script Date: 17/05/2021 16:53:50 ******/
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
/****** Object:  StoredProcedure [dbo].[Mostrar_Puestos]    Script Date: 17/05/2021 16:53:50 ******/
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
/****** Object:  StoredProcedure [dbo].[Mostrar_TipoDocID]    Script Date: 17/05/2021 16:53:50 ******/
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
USE [master]
GO
ALTER DATABASE [Planilla_Empleados] SET  READ_WRITE 
GO
