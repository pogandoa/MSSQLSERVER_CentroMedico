USE CentroMedico
GO

--1
CREATE TABLE Paciente(
	idPaciente Paciente identity(1,1),
	nombre varchar(50) NOT NULL,
	apellidos varchar (100) NOT NULL,
	direccion varchar(50),
	email varchar(100) NOT NULL,
	idpais char(3) NOT NULL,
	observacion Observacion,
	CONSTRAINT FK_Paciente PRIMARY KEY(idPaciente)
)
GO

--2
CREATE TABLE Historia
(
	idHistoria Historia identity(1,1),
	fechaHistoria datetime,
	observacion Observacion,
	CONSTRAINT PK_idHistoria PRIMARY KEY(idHistoria)
)
GO

--3
CREATE TABLE HistoriaPaciente
(
	idHistoria Historia,
	idPaciente Paciente,
	idMedico  Medico,
	CONSTRAINT PK_HistoriaPaciente PRIMARY KEY(idHistoria, idPaciente, idMedico)
)
GO

--4
CREATE TABLE Turno(
	idTurno Turno identity(1,1),
	fechaTurno datetime not null,
	estado Estado not null,
	observacion Observacion,
	CONSTRAINT PK_idTurno PRIMARY KEY(idTurno)
)
GO

--5
CREATE TABLE TurnoPaciente(
	idTurno Turno,
	idPaciente Paciente,
	idMedico Medico,
	CONSTRAINT PK_TurnoPaciente PRIMARY KEY(idTurno, idPaciente, idMedico)
)
GO

--6
CREATE TABLE TurnoEstado(
	idEstado Estado NOT NULL,
	descripcion VARCHAR(50) NOT NULL,
	CONSTRAINT PK_TurnoEstado PRIMARY KEY(idEstado)
)
GO

--7
CREATE TABLE Medico(
	idMedico Medico identity(1,1),
	nombre varchar(50) not null,
	apellido varchar(50) not null,
	telefono varchar(20) not null,
	email varchar(100),
	CONSTRAINT PK_idMedico PRIMARY KEY(idMedico)
)
GO

--8
CREATE TABLE Especialidad(
	idEspecialidad Especialidad identity(1,1),
	especialidad varchar(50),
	CONSTRAINT PK_idEspecialidad PRIMARY KEY(idEspecialidad)
)
GO

--9
CREATE TABLE MedicoEspecialidad(
	idMedico Medico,
	idEspecialidad Especialidad,
	CONSTRAINT PK_MedicoEspecialiad PRIMARY KEY(idMedico, idEspecialidad)
)
GO

--10
CREATE TABLE Pais(
	idPais char(3) not null,
	pais varchar(50),
	CONSTRAINT PK_idPais PRIMARY KEY(idPais)
)
GO

--11
CREATE TABLE Pago(
	idPago Pago identity(1,1),
	idConcepto Concepto not null,
	fecha datetime not null,
	monto money not null,
	estado tinyint,
	observacion Observacion,
	CONSTRAINT PK_idPago PRIMARY KEY(idPago)
)
GO

--12
CREATE TABLE PagoPaciente(
	idPago Pago,
	idPaciente Paciente,
	idTurno Turno,
	CONSTRAINT PK_PagoPaciente PRIMARY KEY(idPago, idPaciente, idTurno)
)
GO

--13
CREATE TABLE Concepto(
	idConcepto Concepto identity(1,1),
	descripcion varchar(100),
	CONSTRAINT PK_idConcepto PRIMARY KEY(idConcepto)
)
GO