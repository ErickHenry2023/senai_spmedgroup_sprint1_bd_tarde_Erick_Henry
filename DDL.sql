CREATE DATABASE SpMedGroup;
GO

USE SpMedGroup;
GO

CREATE TABLE Clinica(
   IdClinica   INT  PRIMARY KEY IDENTITY
  ,NomeFantasia VARCHAR(255) NOT NULL
  ,CNPJ         VARCHAR (250)
  ,HorarioAberto   TIME  
  ,HorarioFechado	TIME 
);
 -------------------------
 CREATE TABLE Especialidade(
   IdEspecialidade INT  PRIMARY KEY IDENTITY
  ,Titulo          VARCHAR(250) NOT NULL
);
------------------
CREATE TABLE TipoUsuario(
   IdTipoUsuario INT  PRIMARY KEY IDENTITY
  ,Titulo        VARCHAR(250) 
);
------------------
CREATE TABLE Usuario(
   IdUsuario INT  PRIMARY KEY IDENTITY
  ,Email     VARCHAR(250) NOT NULL
  ,Senha     VARCHAR(250) NOT NULL
);
------------------
CREATE TABLE Endereco(
   IdEndereco INT  PRIMARY KEY IDENTITY
  ,Endereco   VARCHAR(250) NOT NULL
  ,Telefone   VARCHAR(250) NOT NULL
  ,IdClinica  INT  FOREIGN KEY REFERENCES Clinica(IdClinica), 
  IdUsuario  INT  FOREIGN KEY REFERENCES Usuario(IdUsuario)
);

------------------
CREATE TABLE Prontuario(
   IdProntuario   INT  PRIMARY KEY IDENTITY(1,1)
  ,Nome           VARCHAR(250) NOT NULL
  ,DataNascimento DATE  
  ,RG             VARCHAR(250) 
  ,CPF            VARCHAR(250) 
  ,IdUsuario      INT  FOREIGN KEY REFERENCES Usuario(IdUsuario),
  IdEndereco     INT  FOREIGN KEY REFERENCES Endereco(IdEndereco)
);

------------------
CREATE TABLE Medico(
   IdMedico       INT  NOT NULL PRIMARY KEY IDENTITY
  ,Nome           VARCHAR(250) NOT NULL
  ,CRM            INT  
  ,IdEspecialista INT  FOREIGN KEY REFERENCES Especialidade(IdEspecialidade)
  ,IdClinica      INT  FOREIGN KEY REFERENCES Clinica(IdClinica)
  ,IdUsuario      INT  FOREIGN KEY REFERENCES Usuario (IdUsuario)
);
------------------
CREATE TABLE Consulta(
   IdConsulta   INT  PRIMARY KEY IDENTITY
  ,DataConsulta DATE
  ,Situacao     VARCHAR(250) 
  ,IdProntuario INT  FOREIGN KEY REFERENCES Prontuario(IdProntuario)
  ,IdMedico     INT  FOREIGN KEY REFERENCES Medico(IdMedico)
);