USE CentroMedico
GO

--Insertar Paciente
ALTER PROC sp_InsertPaciente(@numIdent varchar(20), @tipoIdent smallint, @nombre varchar(20),
							  @apellidos varchar(50), @fechaNac varchar(8), @direccion varchar(100), 
							  @email varchar(100), @idpais char(3), @observacion Observacion = '')
AS
SET NOCOUNT ON
IF NOt EXISTS ( SELECT TOP 1 idPaciente FROM Paciente WHERE numIdentificacion = @numIdent)
BEGIN
	INSERT INTO Paciente(numIdentificacion, tipoIdentificacion, nombre, apellidos, fNacimiento, direccion, email, 
						 idpais, observacion) 
	VALUES(@numIdent, @tipoIdent, @nombre, @apellidos, @fechaNac, @direccion, @email, @idpais, @observacion)
	PRINT 'El paciente se agregó correctamente.'
	RETURN
END
ELSE
BEGIN
	PRINT 'El paciente ya existe.'
	RETURN
END
GO

--Insertar TipoIndentificacion
ALTER PROC sp_InsertTipoIdentificacion(@idtipo smallint, @descripcion varchar(10))
AS
SET NOCOUNT ON
IF NOT EXISTS(SELECT TOP 1 idTipo FROM TipoIdentificacion WHERE descripcion = @descripcion )
BEGIN
	INSERT INTO TipoIdentificacion(idTipo, descripcion)
	VALUES(@idtipo, @descripcion)
	PRINT 'El tipo de identificación se agregó correctamente.'
	RETURN
END
ELSE
BEGIN
	PRINT 'El tipo de identificación ya existe.'
	RETURN
END
GO

--Insertar Medico
ALTER PROC sp_InsertMedico (@nombre varchar(50), @apellido varchar(50), @telefono varchar(20), 
							 @email varchar(100), @idespecialidad int)
AS
SET NOCOUNT ON
IF NOT EXISTS(SELECT TOP 1 idMedico FROM Medico WHERE nombre = @nombre AND apellido = @apellido)
BEGIN
	INSERT INTO Medico (nombre, apellido, telefono, email)
	VALUES(@nombre, @apellido, @telefono, @email)

	DECLARE @auxIdMedico Medico 
	SET @auxIdMedico = @@IDENTITY

	INSERT INTO MedicoEspecialidad (idMedico, idEspecialidad)
	VALUES(@auxIdMedico, @idespecialidad)
	PRINT 'El Medico se agregó correctamente.'
	RETURN
END
ELSE
BEGIN
	PRINT 'El medico ya existe.'
	RETURN
END
GO

--Insertar Especialidad
ALTER PROC sp_InsertEspecialidad(@especialidad varchar(50))
AS
SET NOCOUNT ON
IF NOT EXISTS(SELECT TOP 1 idEspecialidad FROM Especialidad WHERE especialidad = @especialidad)
BEGIN
	INSERT INTO Especialidad(especialidad)
	VALUES(@especialidad)
	PRINT 'La especialidad se agregó correctamente.'
	RETURN
END
ELSE
BEGIN
	PRINT 'La especialidad ya existe.'
	RETURN
END
GO

--Insertar TurnoEstado
ALTER PROC sp_InsertTurnoEstado(@descripcion varchar(50))
AS

--ESTADO = 0 (PENDIENTE)
--ESTADO = 1 (REALIZADO)
--ESTADO = 2 (CANCELADO)

SET NOCOUNT ON
IF NOT EXISTS(SELECT TOP 1 idEstado FROM TurnoEstado WHERE descripcion = @descripcion)
BEGIN
	INSERT INTO TurnoEstado(descripcion)
	VALUES(@descripcion)
	PRINT 'El estadopara turno se agregó correctamente.'
	RETURN
END
ELSE
BEGIN
	PRINT 'El estado para el turno ya existe.'
	RETURN
END
GO

--Insertar Turno
ALTER PROC sp_InsertTurno(@fecha char(14), @estado smallint, @observacion Observacion = '',
						   @idPaciente Paciente, @idMedico Medico)
AS
SET NOCOUNT ON
IF NOT EXISTS(SELECT TOP 1 idTurno FROM Turno WHERE fechaTurno = @fecha)
BEGIN
	INSERT INTO Turno(fechaTurno, estado, observacion)
	VALUES(@fecha, @estado, @observacion)

	DECLARE @auxIdTurno int
	SET @auxIdTurno = @@IDENTITY

	INSERT INTO TurnoPaciente(idTurno, idPaciente, idMedico)
	VALUES(@auxIdTurno, @idPaciente, @idMedico)
	PRINT 'El turno se agregó correctamente.'
	RETURN
END
ELSE
BEGIN
	PRINT 'El turno ya existe.'
	RETURN
END 
GO