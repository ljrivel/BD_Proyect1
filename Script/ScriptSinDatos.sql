USE [Planilla_Empleados]
GO
/****** Object:  Table [dbo].[DeduccionesXEmpleado]    Script Date: 21/05/2021 2:27:31 ******/
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
/****** Object:  Table [dbo].[DeduccionNoObligatoria]    Script Date: 21/05/2021 2:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeduccionNoObligatoria](
	[Id] [int] NOT NULL,
	[Monto] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeduccionObligatoria]    Script Date: 21/05/2021 2:27:31 ******/
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
/****** Object:  Table [dbo].[Departamentos]    Script Date: 21/05/2021 2:27:31 ******/
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
/****** Object:  Table [dbo].[Empleados]    Script Date: 21/05/2021 2:27:31 ******/
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
/****** Object:  Table [dbo].[Feriado]    Script Date: 21/05/2021 2:27:31 ******/
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
/****** Object:  Table [dbo].[MarcaAsistencia]    Script Date: 21/05/2021 2:27:31 ******/
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
	[HorasExtraordinarias] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MesPlanilla]    Script Date: 21/05/2021 2:27:31 ******/
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
/****** Object:  Table [dbo].[MesPlanillaXEmpleado]    Script Date: 21/05/2021 2:27:31 ******/
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
/****** Object:  Table [dbo].[MovimientoPlanilla]    Script Date: 21/05/2021 2:27:31 ******/
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
/****** Object:  Table [dbo].[Puesto]    Script Date: 21/05/2021 2:27:31 ******/
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
/****** Object:  Table [dbo].[SemanaPlanilla]    Script Date: 21/05/2021 2:27:31 ******/
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
/****** Object:  Table [dbo].[SemanaPlanillaXEmpleado]    Script Date: 21/05/2021 2:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SemanaPlanillaXEmpleado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[IdSemanaPlanilla] [int] NOT NULL,
	[IdTipoDeJornada] [int] NOT NULL,
	[SalarioNeto] [money] NULL,
	[SalarioBruto] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_de_Documento_de_Identidad]    Script Date: 21/05/2021 2:27:31 ******/
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
/****** Object:  Table [dbo].[TipoDeduccion]    Script Date: 21/05/2021 2:27:31 ******/
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
/****** Object:  Table [dbo].[TipoJornada]    Script Date: 21/05/2021 2:27:31 ******/
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
/****** Object:  Table [dbo].[TipoMovimiento]    Script Date: 21/05/2021 2:27:31 ******/
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
/****** Object:  Table [dbo].[TipoMovimientoDeduccion]    Script Date: 21/05/2021 2:27:31 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 21/05/2021 2:27:31 ******/
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
ALTER TABLE [dbo].[MarcaAsistencia]  WITH CHECK ADD  CONSTRAINT [FK_MarcaAsistencia_SemanaXEmpleado] FOREIGN KEY([IdSemanaPlanillaXEmpleado])
REFERENCES [dbo].[SemanaPlanillaXEmpleado] ([Id])
GO
ALTER TABLE [dbo].[MarcaAsistencia] CHECK CONSTRAINT [FK_MarcaAsistencia_SemanaXEmpleado]
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
ALTER TABLE [dbo].[MovimientoPlanilla]  WITH CHECK ADD  CONSTRAINT [FK_Id_Semana_Planilla] FOREIGN KEY([IdSemanaPlanillaXEmpleado])
REFERENCES [dbo].[SemanaPlanillaXEmpleado] ([Id])
GO
ALTER TABLE [dbo].[MovimientoPlanilla] CHECK CONSTRAINT [FK_Id_Semana_Planilla]
GO
ALTER TABLE [dbo].[MovimientoPlanilla]  WITH CHECK ADD  CONSTRAINT [FK_Id_Tipo_Movimiento] FOREIGN KEY([IdTipoMovimiento])
REFERENCES [dbo].[TipoMovimiento] ([Id])
GO
ALTER TABLE [dbo].[MovimientoPlanilla] CHECK CONSTRAINT [FK_Id_Tipo_Movimiento]
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
REFERENCES [dbo].[TipoMovimiento] ([Id])
GO
ALTER TABLE [dbo].[TipoMovimientoDeduccion] CHECK CONSTRAINT [FK_Id]
GO
ALTER TABLE [dbo].[TipoMovimientoDeduccion]  WITH CHECK ADD  CONSTRAINT [FK_Id_Deduccion] FOREIGN KEY([IdDeduccion])
REFERENCES [dbo].[TipoDeduccion] ([Id])
GO
ALTER TABLE [dbo].[TipoMovimientoDeduccion] CHECK CONSTRAINT [FK_Id_Deduccion]
GO
/****** Object:  StoredProcedure [dbo].[Actualizar_Puesto]    Script Date: 21/05/2021 2:27:31 ******/
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
/****** Object:  StoredProcedure [dbo].[Add_Empleado]    Script Date: 21/05/2021 2:27:31 ******/
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
/****** Object:  StoredProcedure [dbo].[Add_Puesto]    Script Date: 21/05/2021 2:27:31 ******/
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
/****** Object:  StoredProcedure [dbo].[Borrar_Empleado]    Script Date: 21/05/2021 2:27:31 ******/
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
/****** Object:  StoredProcedure [dbo].[Borrar_Puesto]    Script Date: 21/05/2021 2:27:31 ******/
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
/****** Object:  StoredProcedure [dbo].[Cargar_Info]    Script Date: 21/05/2021 2:27:31 ******/
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
/****** Object:  StoredProcedure [dbo].[CargarOperaciones]    Script Date: 21/05/2021 2:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CargarOperaciones]
	@doc XML
AS BEGIN
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

		IF (DATENAME(dw,@fechaOperacion) = 'Jueves')
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
			-- Añadir empleados
			DECLARE @cantidadEmpleadosEliminados INT
			DECLARE @rutaEmpleadosEliminados VARCHAR (128)
				
			SET @rutaEmpleadosEliminados = @ruta + '/EliminarEmpleado'
			SELECT @cantidadEmpleadosEliminados  = COUNT(*) FROM OPENXML(@doccnt, @rutaEmpleadosEliminados, 1) WITH(Id INT)
				
			DECLARE @contadorEmpleadosEliminados INT
			SET @contadorEmpleadosEliminados = 1

			WHILE (@contadorEmpleadosEliminados <= @cantidadEmpleadosEliminados)
			BEGIN
				DECLARE @rutaEmpleadoEliminado VARCHAR(128)
				SET @rutaEmpleadoEliminado = @rutaEmpleadosEliminados + '[' + CAST(@contadorEmpleados AS VARCHAR(10)) + ']'
		
				DECLARE @valorDocumentoId INT


				SELECT  @valorDocumentoId = ValorDocumentoIdentidad
				FROM OPENXML(@doccnt, @rutaNuevoEmpleado, 1)
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

		SET @ContOperaciones += 1;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[CargarXML]    Script Date: 21/05/2021 2:27:31 ******/
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
		DECLARE @doc XML
		SELECT @doc = BulkColumn
		FROM OPENROWSET(BULK 'C:\Archivos_Proyecto\Datos_Tarea2.xml', SINGLE_CLOB) AS xmlData

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
		
		SET @outResultCode = 50001
		SET @outResultMessage = 'Se cargaron exitosamente'
	END TRY
	BEGIN CATCH
		
		SET @outResultCode = 50005
		SET @outResultMessage = 'Error al cargar los archivos'
	END CATCH 
	PRINT @outResultMessage
	SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[Datos_Usuarios]    Script Date: 21/05/2021 2:27:31 ******/
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
/****** Object:  StoredProcedure [dbo].[Editar_Empleado]    Script Date: 21/05/2021 2:27:31 ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarEmpleadoPorDocumentoIdentidad]    Script Date: 21/05/2021 2:27:31 ******/
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

		SET @outResultCode = 50001
	END TRY
	BEGIN CATCH

		SET @outResultCode = 50005
	END CATCH

	SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[Filtrar_Empleados]    Script Date: 21/05/2021 2:27:31 ******/
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
/****** Object:  StoredProcedure [dbo].[GestionarFinDeMes]    Script Date: 21/05/2021 2:27:31 ******/
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
	END TRY
	BEGIN CATCH
		SET @outResultCode = 50005
	END CATCH
	SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[GestionarFinDeSemana]    Script Date: 21/05/2021 2:27:31 ******/
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

				SELECT @horasOrdinarias = SUM(HorasOrdinarias), @horasExtraordinarias = SUM(HorasExtraordinarias)
				FROM MarcaAsistencia 
				WHERE IdSemanaPlanillaXEmpleado = @topId

				SELECT @pagoBaseXHora = SalarioXHora FROM Puesto P
				INNER JOIN SemanaPlanillaXEmpleado SPXE ON SPXE.Id=@topId
				INNER JOIN Empleados E ON E.Id = SPXE.IdEmpleado
				WHERE P.Id = E.IdPuesto

				DECLARE @pagoOrdinario MONEY = @pagoBaseXHora * @horasOrdinarias
				DECLARE @pagoExtraordinario MONEY = (@pagoBaseXhora * 1.5) * @horasExtraordinarias

				UPDATE SemanaPlanillaXEmpleado
				SET SalarioBruto = @pagoOrdinario + @pagoExtraordinario
				WHERE Id = @topId

				INSERT INTO MovimientoPlanilla (IdTipoMovimiento, IdSemanaPlanillaXEmpleado, Fecha, Monto)
				VALUES (1, @topId, @inFecha, @pagoOrdinario)

				INSERT INTO MovimientoPlanilla (IdTipoMovimiento, IdSemanaPlanillaXEmpleado, Fecha, Monto)
				VALUES (2, @topId, @inFecha, @pagoExtraordinario)

				DELETE FROM @tabla WHERE idPSemanaXEmpleado = @topId
				SELECT @contador = COUNT(*) FROM @tabla
			END

			DECLARE @idMesActual INT

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




--SELECT MAX(Id) FROM Empleados
--SELECT * FROM Empleados

GO
/****** Object:  StoredProcedure [dbo].[HacerMarcaAsistencia]    Script Date: 21/05/2021 2:27:31 ******/
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

		INSERT INTO MarcaAsistencia (IdSemanaPlanillaXEmpleado, HoraEntrada, HoraSalida, HorasOrdinarias, HorasExtraordinarias)
		VALUES (@idSPXE, @inFechaEntrada, @inFechaSalida, @horasOrdinarias, @horasExtra)

		
		
		SET @outResultCode = 50001
	END TRY
	BEGIN CATCH
		SET @outResultCode = 50005
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[Limpiar_BD]    Script Date: 21/05/2021 2:27:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Limpiar_BD]
AS
BEGIN
	DELETE FROM Departamentos
	DELETE FROM Puesto
	DELETE FROM Tipo_de_Documento_de_Identidad
	DELETE FROM TipoMovimiento
	DELETE FROM TipoJornada
	DELETE FROM Feriado

	DELETE FROM DeduccionObligatoria
	DELETE FROM TipoDeduccion
	
END
GO
/****** Object:  StoredProcedure [dbo].[Mostrar_Departamentos]    Script Date: 21/05/2021 2:27:31 ******/
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
/****** Object:  StoredProcedure [dbo].[Mostrar_Empleados]    Script Date: 21/05/2021 2:27:31 ******/
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
/****** Object:  StoredProcedure [dbo].[Mostrar_Puestos]    Script Date: 21/05/2021 2:27:31 ******/
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
/****** Object:  StoredProcedure [dbo].[Mostrar_TipoDocID]    Script Date: 21/05/2021 2:27:31 ******/
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
