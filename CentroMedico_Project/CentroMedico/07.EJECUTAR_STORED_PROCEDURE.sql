USE CentroMedico
GO

--SELECT * FROM MedicoEspecialidad

EXEC sp_InsertTipoIdentificacion '0','CEDULA'
EXEC sp_InsertTipoIdentificacion '1','RNC'
EXEC sp_InsertTipoIdentificacion '2','PASAPORTE'
GO

EXEC sp_InsertEspecialidad 'CARDIOLOGO'
EXEC sp_InsertEspecialidad 'FISIATRA'
EXEC sp_InsertEspecialidad 'TRAUMATOLOGO'
EXEC sp_InsertEspecialidad 'PEDIATRA'
GO

EXEC sp_InsertPaciente '00114904402', 0, 'Pedro', 'Ogando Aquino', '19810502', 'Julio Catillo #1', 'pogandoa@gmail.com', 'DOM', ''
GO

EXEC sp_InsertMedico 'Manuel','Jimenez','8099541452','jmcarrasco@cm.com',1
GO