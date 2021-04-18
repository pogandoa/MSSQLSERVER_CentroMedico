USE CentroMedico
GO


CREATE TABLE Historia
(
	idHistoria int identity(1,1) NOT NULL,
	fechaHistoria datetime,
	observacion varchar(1000),
	CONSTRAINT PK_idHistoria PRIMARY KEY(idHistoria)
)
GO

CREATE TABLE HistoriaClinica
(
	idHistoria int not null,
	idPaciente int not null,
	idMedico  int not null,
	CONSTRAINT PK_HistoriaClinica PRIMARY KEY(idHistoria,idPaciente,idMedico)
)
GO

CREATE TABLE Turno(
	idTurno int identity(1,1) not null,
	fechaTurno datetime not null,
	estado smallint not null,
	observacion varchar(1000),
	CONSTRAINT PK_idTurno PRIMARY KEY(idTurno)
)
GO

CREATE TABLE TurnoPaciente(
	idTurno int not null,
	idPaciente int not null,
	idMedico int not null,
	CONSTRAINT PK_TurnoPaciente PRIMARY KEY(idTurno,idPaciente,idMedico)
)
GO

CREATE TABLE Medico(
	idMedico int identity(1,1) not null,
	nombre varchar(50) not null,
	apellido varchar(50) not null,
	telefono varchar(20) not null,
	email varchar(100),
	CONSTRAINT PK_idMedico PRIMARY KEY(idMedico)
)
GO

CREATE TABLE Especialidad(
	idEspecialidad int identity(1,1) not null,
	especialidad varchar(50),
	CONSTRAINT PK_idEspecialidad PRIMARY KEY(idEspecialidad)
)
GO

CREATE TABLE MedicoEspecialidad(
	idMedico int not null,
	idEspecialidad int not null,
	CONSTRAINT PK_MedicoEspecialiad PRIMARY KEY(idMedico, idEspecialidad)
)
GO

CREATE TABLE Pais(
	idPais char(3) not null,
	pais varchar(50),
	CONSTRAINT PK_idPais PRIMARY KEY(idPais)
)
GO

CREATE TABLE Pago(
	idPago int identity(1,1) not null CONSTRAINT PK_idPago PRIMARY KEY,
	concepto tinyint not null,
	fecha datetime not null,
	monto money not null,
	estado tinyint,
	observacion varchar(1000)
)
GO

CREATE TABLE PagoPaciente(
	idPago int not null,
	idPaciente int not null,
	idTurno int not null,
	CONSTRAINT PK_PagoPaciente PRIMARY KEY(idPago,idPaciente,idTurno)
)
GO

CREATE TABLE Concepto(
	idConepto tinyint identity(1,1) not null CONSTRAINT PK_idConcepto PRIMARY KEY,
	descripcion varchar(100)
)
GO