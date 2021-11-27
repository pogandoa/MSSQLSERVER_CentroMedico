USE CentroMedico
GO

--1
CREATE TABLE Pacientes(
	idPaciente Paciente identity(1,1) NOT NULL,
	num_Identif varchar(20) NOT NULL,
	tipo_Identif smallint NOT NULL,
	nombre varchar(20) NOT NULL,
	apellidos varchar (50) NOT NULL,
	f_Naciemiento date NOT NULL,
	direccion varchar(100),
	email varchar(100) NOT NULL,
	idpais char(3) NOT NULL,
	observacion Observacion,
	CONSTRAINT PK_Paciente PRIMARY KEY(idPaciente)
)
GO

CREATE TABLE Tipos(
	idTipo smallint NOT NULL,
	tipo char(10) NOT NULL, 
	descripcion varchar(30) NOT NULL
	CONSTRAINT PK_TipoId PRIMARY KEY(idTipo)
)
GO

--2
CREATE TABLE Historias
(
	idHistoria Historia identity(1,1),
	f_Historia datetime,
	observacion Observacion,
	CONSTRAINT PK_idHistoria PRIMARY KEY(idHistoria)
)
GO

--3
CREATE TABLE HistoriasPacientes
(
	idHistoria Historia,
	idPaciente Paciente,
	idMedico  Medico,
	CONSTRAINT PK_HistoriaPaciente PRIMARY KEY(idHistoria, idPaciente, idMedico)
)
GO

--4
CREATE TABLE Turnos(
	idTurno Turno identity(1,1),
	f_Turno datetime not null,
	estado Estado not null,
	observacion Observacion,
	CONSTRAINT PK_idTurno PRIMARY KEY(idTurno)
)
GO

--5
CREATE TABLE TurnosPacientes(
	idTurno Turno,
	idPaciente Paciente,
	idMedico Medico,
	CONSTRAINT PK_TurnoPaciente PRIMARY KEY(idTurno, idPaciente, idMedico)
)
GO

--6
CREATE TABLE TurnosEstados(
	idEstado Estado NOT NULL,
	descripcion VARCHAR(50) NOT NULL,
	CONSTRAINT PK_TurnoEstado PRIMARY KEY(idEstado)
)
GO

--7
CREATE TABLE Medicos(
	idMedico Medico identity(1,1),
	nombre varchar(50) not null,
	apellido varchar(50) not null,
	telefono varchar(20) not null,
	email varchar(100),
	CONSTRAINT PK_idMedico PRIMARY KEY(idMedico)
)
GO

--8
CREATE TABLE Especialidades(
	idEspecialidad Especialidad identity(1,1),
	especialidad varchar(50),
	CONSTRAINT PK_idEspecialidad PRIMARY KEY(idEspecialidad)
)
GO

--9
CREATE TABLE MedicosEspecialidades(
	idMedico Medico,
	idEspecialidad Especialidad,
	CONSTRAINT PK_MedicoEspecialiad PRIMARY KEY(idMedico, idEspecialidad)
)
GO

--10
CREATE TABLE Paises(
	idPais char(3) not null,
	pais varchar(50),
	CONSTRAINT PK_idPais PRIMARY KEY(idPais)
)
GO

--11
CREATE TABLE Pagos(
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
CREATE TABLE PagosPacientes(
	idPago Pago,
	idPaciente Paciente,
	idTurno Turno,
	CONSTRAINT PK_PagoPaciente PRIMARY KEY(idPago, idPaciente, idTurno)
)
GO

--13
CREATE TABLE Conceptos(
	idConcepto Concepto identity(1,1),
	descripcion varchar(100),
	CONSTRAINT PK_idConcepto PRIMARY KEY(idConcepto)
)
GO