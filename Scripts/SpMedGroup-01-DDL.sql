CREATE DATABASE SpMedGroup;
GO

USE SpMedGroup;
GO

CREATE TABLE Clinica(
   IdClinica   INT  PRIMARY KEY IDENTITY
  ,NomeFantasia VARCHAR(255) NOT NULL
  ,CNPJ         VARCHAR (255) NOT NULL UNIQUE
  ,HorarioAberto   TIME (0) --PARA MOSTRAR APENAS AS HORAS E MINUTOS (0) 
  ,HorarioFechado	TIME (0)
);
GO
 -------------------------
 CREATE TABLE Especialidade(
   IdEspecialidade INT  PRIMARY KEY IDENTITY
  ,Titulo          VARCHAR(255) NOT NULL
);
GO
------------------
CREATE TABLE TipoUsuario(
   IdTipoUsuario INT  PRIMARY KEY IDENTITY
  ,Titulo        VARCHAR(255) 
);
GO
------------------
CREATE TABLE Usuario(
   IdUsuario INT  PRIMARY KEY IDENTITY
  ,Email     VARCHAR(255) NOT NULL
  ,Senha     VARCHAR(255) NOT NULL
  ,IdTipoUsuario INT  FOREIGN KEY REFERENCES TipoUsuario(IdTipoUsuario)
);
GO
------------------
CREATE TABLE Endereco(
   IdEndereco INT  PRIMARY KEY IDENTITY
  ,Endereco   VARCHAR(255) NOT NULL
  ,Telefone   VARCHAR(255) NOT NULL
  ,IdClinica  INT  FOREIGN KEY REFERENCES Clinica(IdClinica), 
  IdUsuario  INT  FOREIGN KEY REFERENCES Usuario(IdUsuario)
);
GO
------------------
CREATE TABLE Prontuario(
   IdProntuario   INT  PRIMARY KEY IDENTITY
  ,Nome           VARCHAR(255) NOT NULL
  ,DataNascimento DATE  --PARA MOSTAR APENAS A DATA
  ,RG             VARCHAR(255) NOT NULL
  ,CPF            VARCHAR(255) NOT NULL
  ,IdUsuario      INT  FOREIGN KEY REFERENCES Usuario(IdUsuario),
  IdEndereco     INT  FOREIGN KEY REFERENCES Endereco(IdEndereco)
);
GO
------------------
CREATE TABLE Medico(
   IdMedico       INT  NOT NULL PRIMARY KEY IDENTITY
  ,Nome           VARCHAR(255) NOT NULL
  ,CRM            INT  
  ,IdEspecialista INT  FOREIGN KEY REFERENCES Especialidade(IdEspecialidade)
  ,IdClinica      INT  FOREIGN KEY REFERENCES Clinica(IdClinica)
  ,IdUsuario      INT  FOREIGN KEY REFERENCES Usuario (IdUsuario)
);
GO
------------------
CREATE TABLE Consulta(
   IdConsulta   INT  PRIMARY KEY IDENTITY
  ,DataConsulta DATE
  ,Situacao     VARCHAR(255) NOT NULL
  ,IdProntuario INT  FOREIGN KEY REFERENCES Prontuario(IdProntuario)
  ,IdMedico     INT  FOREIGN KEY REFERENCES Medico(IdMedico)
);
GO

SELECT * FROM Clinica;
SELECT * FROM Especialidade;
SELECT * FROM TipoUsuario;
SELECT * FROM Usuario;
SELECT * FROM Endereco;
SELECT * FROM Prontuario;
SELECT * FROM Medico;
SELECT * FROM Consulta;