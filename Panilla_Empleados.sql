USE [Planilla_Empleados]
GO
/****** Object:  Table [dbo].[Departamentos]    Script Date: 16/4/2021 21:59:42 ******/
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
/****** Object:  Table [dbo].[Empleados]    Script Date: 16/4/2021 21:59:42 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Puesto]    Script Date: 16/4/2021 21:59:42 ******/
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
/****** Object:  Table [dbo].[Tipo_de_Documento_de_Identidad]    Script Date: 16/4/2021 21:59:42 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 16/4/2021 21:59:42 ******/
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
/****** Object:  StoredProcedure [dbo].[Actualizar_Puesto]    Script Date: 16/4/2021 21:59:42 ******/
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
/****** Object:  StoredProcedure [dbo].[Add_Empleado]    Script Date: 16/4/2021 21:59:42 ******/
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
/****** Object:  StoredProcedure [dbo].[Add_Puesto]    Script Date: 16/4/2021 21:59:42 ******/
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
/****** Object:  StoredProcedure [dbo].[Borrar_Empleado]    Script Date: 16/4/2021 21:59:42 ******/
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
/****** Object:  StoredProcedure [dbo].[Borrar_Puesto]    Script Date: 16/4/2021 21:59:42 ******/
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
/****** Object:  StoredProcedure [dbo].[Datos_Usuarios]    Script Date: 16/4/2021 21:59:42 ******/
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
/****** Object:  StoredProcedure [dbo].[Editar_Empleado]    Script Date: 16/4/2021 21:59:42 ******/
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
/****** Object:  StoredProcedure [dbo].[Filtrar_Empleados]    Script Date: 16/4/2021 21:59:42 ******/
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
/****** Object:  StoredProcedure [dbo].[Mostrar_Departamentos]    Script Date: 16/4/2021 21:59:42 ******/
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
/****** Object:  StoredProcedure [dbo].[Mostrar_Empleados]    Script Date: 16/4/2021 21:59:42 ******/
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
/****** Object:  StoredProcedure [dbo].[Mostrar_Puestos]    Script Date: 16/4/2021 21:59:42 ******/
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
/****** Object:  StoredProcedure [dbo].[Mostrar_TipoDocID]    Script Date: 16/4/2021 21:59:42 ******/
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
