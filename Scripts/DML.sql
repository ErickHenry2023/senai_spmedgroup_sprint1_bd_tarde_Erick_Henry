USE SpMedGroup;
GO

INSERT INTO Clinica(NomeFantasia,CNPJ,HorarioAberto,HorarioFechado) VALUES
 ('SpMedGroup','86.400.902/0001-30','8:00','10:00');

 INSERT INTO Especialidade(Titulo) VALUES
 ('Acupuntura')
,('Anestesiologia')
,('Angiologia')
,('Cardiologia')
,('Cirurgia Cardiovascular')
,('Cirurgia da Mão')
,('Cirurgia do Aparelho Digestivo')
,('Cirurgia Geral')
,('Cirurgia Pediátrica')
,('Cirurgia Plástica')
,('Cirurgia Torácica')
,('Cirurgia Vascular')
,('Dermatologia')
,('Radioterapia')
,('Urologia')
,('Pediatria')
,('Psiquiatria');

INSERT INTO TipoUsuario(Titulo) VALUES
 ('Administrador')
,('Médico')
,('Paciente');

INSERT INTO Usuario(Email,Senha,IdTipoUsuario) VALUES
 ('Cesar@gmail.com','13570753',3)
,('Alexandre@gmail.com','75310135',3)
,('Porssarle@gmail.com','10293847',3)
,('Saulo@spmedicalgroup.com.br','12345678',2)
,('Carol@spmedicalgroup.com.br','87654321',2);

INSERT INTO Endereco(Endereco,Telefone,IdClinica,IdUsuario) VALUES
 ('Alameda Barão de Limeira, 539','(11) 3273-5000',1, NULL)
,('R. Eng. Roberto Mange, 95','(11) 4523-6400',NULL,1)
,('Av. Dr. Renato de Andrade Maia, 601','(11) 2461-6750',1,2)
,('Av. Senador Feijó, 421','(13) 3269-8100',1,3);

INSERT INTO Prontuario(Nome,DataNascimento,RG,CPF,IdUsuario,IdEndereco) VALUES
 ('Cesar','20/09/2000','43522543-5','94839859000',1,2)
,('Alexandre','21/09/2000','32654345-7','73556944057',2,3)
,('Possarle','22/09/2000','54636525-3','16839338002',3,4);

INSERT INTO Medico(Nome,CRM,IdEspecialista,IdClinica,IdUsuario) VALUES
 ('Saulo','748357',1,1,4)
,('Carol','633567',2,1,5);

INSERT INTO Consulta(DataConsulta,Situacao,IdProntuario,IdMedico) VALUES
 ('12/02/2000','Agendada',4,2)
,('13/02/2001','Realizada',5,1)
,('14/02/2002','Cancelada',6,2);


SELECT * FROM Clinica;
SELECT * FROM Especialidade;
SELECT * FROM TipoUsuario;
SELECT * FROM Usuario;
SELECT * FROM Endereco;
SELECT * FROM Prontuario;
SELECT * FROM Medico;
SELECT * FROM Consulta;







