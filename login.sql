USE [master]
GO

/****** Object:  Database [DataTracks]    Script Date: 03-11-2018 03:45:38 ******/
CREATE DATABASE [DataTracks]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DataTracks', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DataTracks.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DataTracks_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DataTracks_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [DataTracks] SET COMPATIBILITY_LEVEL = 110
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DataTracks].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [DataTracks] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [DataTracks] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [DataTracks] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [DataTracks] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [DataTracks] SET ARITHABORT OFF 
GO

ALTER DATABASE [DataTracks] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [DataTracks] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [DataTracks] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [DataTracks] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [DataTracks] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [DataTracks] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [DataTracks] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [DataTracks] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [DataTracks] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [DataTracks] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [DataTracks] SET  DISABLE_BROKER 
GO

ALTER DATABASE [DataTracks] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [DataTracks] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [DataTracks] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [DataTracks] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [DataTracks] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [DataTracks] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [DataTracks] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [DataTracks] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [DataTracks] SET  MULTI_USER 
GO

ALTER DATABASE [DataTracks] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [DataTracks] SET DB_CHAINING OFF 
GO

ALTER DATABASE [DataTracks] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [DataTracks] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [DataTracks] SET  READ_WRITE 
GO


/******  Create Employee table ******/

USE [DataTracks]
GO

/****** Object:  Table [dbo].[Employee]    Script Date: 03-11-2018 03:45:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Role] [int] NULL,
	[EmailId] [varchar](50) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Employee] FOREIGN KEY([Id])
REFERENCES [dbo].[Employee] ([Id])
GO

ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Employee]
GO


/****** Create Role table ******/
USE [DataTracks]
GO

/****** Object:  Table [dbo].[Role]    Script Date: 03-11-2018 03:47:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

