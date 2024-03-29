USE [master]
GO
/****** Object:  Database [DigitalLifeBooks]    Script Date: 10/20/2012 09:58:56 ******/
CREATE DATABASE [DigitalLifeBooks] ON  PRIMARY 
( NAME = N'DigitalLifeBooks', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\DigitalLifeBooks.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DigitalLifeBooks_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\DigitalLifeBooks_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DigitalLifeBooks] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DigitalLifeBooks].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DigitalLifeBooks] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [DigitalLifeBooks] SET ANSI_NULLS OFF
GO
ALTER DATABASE [DigitalLifeBooks] SET ANSI_PADDING OFF
GO
ALTER DATABASE [DigitalLifeBooks] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [DigitalLifeBooks] SET ARITHABORT OFF
GO
ALTER DATABASE [DigitalLifeBooks] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [DigitalLifeBooks] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [DigitalLifeBooks] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [DigitalLifeBooks] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [DigitalLifeBooks] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [DigitalLifeBooks] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [DigitalLifeBooks] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [DigitalLifeBooks] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [DigitalLifeBooks] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [DigitalLifeBooks] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [DigitalLifeBooks] SET  DISABLE_BROKER
GO
ALTER DATABASE [DigitalLifeBooks] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [DigitalLifeBooks] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [DigitalLifeBooks] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [DigitalLifeBooks] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [DigitalLifeBooks] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [DigitalLifeBooks] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [DigitalLifeBooks] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [DigitalLifeBooks] SET  READ_WRITE
GO
ALTER DATABASE [DigitalLifeBooks] SET RECOVERY FULL
GO
ALTER DATABASE [DigitalLifeBooks] SET  MULTI_USER
GO
ALTER DATABASE [DigitalLifeBooks] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [DigitalLifeBooks] SET DB_CHAINING OFF
GO
USE [DigitalLifeBooks]
GO
/****** Object:  User [dlbappuser]    Script Date: 10/20/2012 09:58:56 ******/
CREATE USER [dlbappuser] FOR LOGIN [dlbappuser] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Assets]    Script Date: 10/20/2012 09:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Assets](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[URL] [varchar](255) NULL,
	[Type] [varchar](20) NULL,
	[Location] [varchar](255) NULL,
	[Caption] [varchar](max) NULL,
 CONSTRAINT [PK_Assets] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Albums]    Script Date: 10/20/2012 09:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Albums](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](255) NULL,
	[DateCreated] [date] NULL,
	[Description] [varchar](max) NULL,
	[EventDate] [date] NULL,
 CONSTRAINT [PK_Albums] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/20/2012 09:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [uniqueidentifier] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[UserType] [varchar](50) NULL,
	[Email] [varchar](max) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[DateOfBrith] [date] NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[HospitalID] [uniqueidentifier] NULL,
	[BirthWeight] [varchar](50) NULL,
	[BirthLength] [varchar](50) NULL,
	[BirthMother] [varchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserSibliings]    Script Date: 10/20/2012 09:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserSibliings](
	[ID] [uniqueidentifier] NOT NULL,
	[SiblingName] [varchar](max) NULL,
	[Relationship] [varchar](50) NULL,
	[UserID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_UserSibliing] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserAssets]    Script Date: 10/20/2012 09:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAssets](
	[UserID] [uniqueidentifier] NOT NULL,
	[AssetID] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetsAlbums]    Script Date: 10/20/2012 09:58:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetsAlbums](
	[AssetID] [bigint] NOT NULL,
	[AlbumID] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_UserSibliing_Users]    Script Date: 10/20/2012 09:58:57 ******/
ALTER TABLE [dbo].[UserSibliings]  WITH NOCHECK ADD  CONSTRAINT [FK_UserSibliing_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UserSibliings] NOCHECK CONSTRAINT [FK_UserSibliing_Users]
GO
/****** Object:  ForeignKey [FK_Assets_UserAssets]    Script Date: 10/20/2012 09:58:57 ******/
ALTER TABLE [dbo].[UserAssets]  WITH CHECK ADD  CONSTRAINT [FK_Assets_UserAssets] FOREIGN KEY([AssetID])
REFERENCES [dbo].[Assets] ([ID])
GO
ALTER TABLE [dbo].[UserAssets] CHECK CONSTRAINT [FK_Assets_UserAssets]
GO
/****** Object:  ForeignKey [FK_Users_UserAssets]    Script Date: 10/20/2012 09:58:57 ******/
ALTER TABLE [dbo].[UserAssets]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserAssets] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UserAssets] CHECK CONSTRAINT [FK_Users_UserAssets]
GO
/****** Object:  ForeignKey [FK_Albums_AssetsAlbums]    Script Date: 10/20/2012 09:58:57 ******/
ALTER TABLE [dbo].[AssetsAlbums]  WITH CHECK ADD  CONSTRAINT [FK_Albums_AssetsAlbums] FOREIGN KEY([AlbumID])
REFERENCES [dbo].[Albums] ([ID])
GO
ALTER TABLE [dbo].[AssetsAlbums] CHECK CONSTRAINT [FK_Albums_AssetsAlbums]
GO
/****** Object:  ForeignKey [FK_Assets_AssetsAlbums]    Script Date: 10/20/2012 09:58:57 ******/
ALTER TABLE [dbo].[AssetsAlbums]  WITH CHECK ADD  CONSTRAINT [FK_Assets_AssetsAlbums] FOREIGN KEY([AssetID])
REFERENCES [dbo].[Assets] ([ID])
GO
ALTER TABLE [dbo].[AssetsAlbums] CHECK CONSTRAINT [FK_Assets_AssetsAlbums]
GO
