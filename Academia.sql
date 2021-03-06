USE [master]
GO
/****** Object:  Database [academia]    Script Date: 30/08/2020 16:28:43 ******/
CREATE DATABASE [academia] ON  PRIMARY 
( NAME = N'academia', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\academia.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'academia_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\academia_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [academia] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [academia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [academia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [academia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [academia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [academia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [academia] SET ARITHABORT OFF 
GO
ALTER DATABASE [academia] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [academia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [academia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [academia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [academia] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [academia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [academia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [academia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [academia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [academia] SET  DISABLE_BROKER 
GO
ALTER DATABASE [academia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [academia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [academia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [academia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [academia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [academia] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [academia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [academia] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [academia] SET  MULTI_USER 
GO
ALTER DATABASE [academia] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [academia] SET DB_CHAINING OFF 
GO
USE [academia]
GO
/****** Object:  Table [dbo].[tb_aluno]    Script Date: 30/08/2020 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_aluno](
	[IdAluno] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[RG] [varchar](50) NOT NULL,
	[CPF] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Endereco] [varchar](50) NOT NULL,
	[CEP] [varchar](50) NOT NULL,
	[Bairro] [varchar](50) NOT NULL,
	[Cidade] [varchar](50) NOT NULL,
	[Estado] [varchar](50) NOT NULL,
	[TipoPlano] [int] NOT NULL,
	[DataInicio] [datetime] NOT NULL,
	[DataFim] [datetime] NOT NULL,
	[DescricaoPlano] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAluno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_aula]    Script Date: 30/08/2020 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_aula](
	[IdAula] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[HoraInicio] [time](7) NOT NULL,
	[HoraFim] [time](7) NOT NULL,
	[IdInstrutor] [int] NOT NULL,
	[IdTipoAula] [int] NOT NULL,
	[DiaSegunda] [bit] NOT NULL,
	[DiaTerca] [bit] NOT NULL,
	[DiaQuarta] [bit] NOT NULL,
	[DiaQuinta] [bit] NOT NULL,
	[DiaSexta] [bit] NOT NULL,
	[DiaSabado] [bit] NOT NULL,
	[NomeInstrutor] [varchar](50) NULL,
	[DescricaoTipoAula] [varchar](50) NULL,
	[NomeAluno] [varchar](50) NULL,
	[Descricaoituacao] [varchar](50) NULL,
	[DescricaoPlano] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_avaliacao]    Script Date: 30/08/2020 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_avaliacao](
	[IdAvaliacao] [int] NOT NULL,
	[IdFisioterapeuta] [int] NOT NULL,
	[IdAluno] [int] NOT NULL,
	[DataAvaliacao] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAvaliacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_fisioterapeuta]    Script Date: 30/08/2020 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_fisioterapeuta](
	[IdFisioterapeuta] [int] NOT NULL,
	[IdFuncionario] [int] NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Login] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdFisioterapeuta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_funcionario]    Script Date: 30/08/2020 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_funcionario](
	[IdFuncionario] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[RG] [varchar](50) NOT NULL,
	[CPF] [varchar](50) NOT NULL,
	[Funcao] [int] NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Senha] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdFuncionario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_funcionario_funcao]    Script Date: 30/08/2020 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_funcionario_funcao](
	[IdFuncao] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdFuncao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_gerente]    Script Date: 30/08/2020 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_gerente](
	[IdGerente] [int] NOT NULL,
	[IdFuncionario] [int] NOT NULL,
	[Nome] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdGerente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_instrutor]    Script Date: 30/08/2020 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_instrutor](
	[IdInstrutor] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[RG] [varchar](50) NOT NULL,
	[CPF] [varchar](50) NOT NULL,
	[TipoAtividade] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdInstrutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_pagamento]    Script Date: 30/08/2020 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_pagamento](
	[IdPagamento] [int] IDENTITY(1,1) NOT NULL,
	[IdAluno] [int] NOT NULL,
	[IdTipoPlano] [int] NOT NULL,
	[DataPagamento] [datetime] NOT NULL,
	[DataProximoPagamento] [datetime] NOT NULL,
	[Situacao] [int] NOT NULL,
	[NomeAluno] [varchar](50) NULL,
	[DescricaoSituacao] [varchar](50) NULL,
	[DescricaoPlano] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPagamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_presenca]    Script Date: 30/08/2020 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_presenca](
	[IdPresenca] [int] NOT NULL,
	[IdAluno] [int] NOT NULL,
	[IdAula] [int] NOT NULL,
	[Data] [date] NOT NULL,
	[Horario] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPresenca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_recepcionista]    Script Date: 30/08/2020 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_recepcionista](
	[IdRecepcionista] [int] NOT NULL,
	[IdFuncionario] [int] NOT NULL,
	[Nome] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRecepcionista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_situacao_aluno]    Script Date: 30/08/2020 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_situacao_aluno](
	[IdSituacao] [int] IDENTITY(1,1) NOT NULL,
	[DescricaoSituacao] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSituacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_tipo_atividade]    Script Date: 30/08/2020 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_tipo_atividade](
	[IdAtividade] [int] IDENTITY(1,1) NOT NULL,
	[DescricaoAtividade] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAtividade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_tipo_plano]    Script Date: 30/08/2020 16:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_tipo_plano](
	[IdTipoPlano] [int] IDENTITY(1,1) NOT NULL,
	[DescricaoPlano] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipoPlano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [academia] SET  READ_WRITE 
GO
