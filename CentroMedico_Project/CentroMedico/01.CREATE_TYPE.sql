USE CentroMedico
GO
CREATE TYPE Paciente FROM INT NOT NULL;
CREATE TYPE Medico FROM INT NOT NULL;
CREATE TYPE Historia FROM INT NOT NULL;
CREATE TYPE Pago FROM INT NOT NULL;
CREATE TYPE Turno FROM INT NOT NULL;
CREATE TYPE Concepto FROM TINYINT NOT NULL;
CREATE TYPE Especialidad FROM INT NOT NULL;
CREATE TYPE Observacion FROM VARCHAR(1000);
CREATE TYPE Estado FROM SMALLINT NOT NULL;