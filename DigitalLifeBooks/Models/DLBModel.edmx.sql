
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 10/21/2012 09:42:00
-- Generated from EDMX file: C:\Users\Administrator\Documents\GitHub\DigitalLifebooks\DigitalLifeBooks\Models\DLBModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [DigitalLifeBooks];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_AssetAlbum]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Assets] DROP CONSTRAINT [FK_AssetAlbum];
GO
IF OBJECT_ID(N'[dbo].[FK_ChildUser_Child]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ChildUser] DROP CONSTRAINT [FK_ChildUser_Child];
GO
IF OBJECT_ID(N'[dbo].[FK_ChildUser_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ChildUser] DROP CONSTRAINT [FK_ChildUser_User];
GO
IF OBJECT_ID(N'[dbo].[FK_ChildAlbum]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Albums] DROP CONSTRAINT [FK_ChildAlbum];
GO
IF OBJECT_ID(N'[dbo].[FK_HospitalChild]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Children] DROP CONSTRAINT [FK_HospitalChild];
GO
IF OBJECT_ID(N'[dbo].[FK_ChildFosterFamily]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Children] DROP CONSTRAINT [FK_ChildFosterFamily];
GO
IF OBJECT_ID(N'[dbo].[FK_ChildSchool]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Children] DROP CONSTRAINT [FK_ChildSchool];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Assets]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Assets];
GO
IF OBJECT_ID(N'[dbo].[Albums]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Albums];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[Children]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Children];
GO
IF OBJECT_ID(N'[dbo].[Hospitals]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Hospitals];
GO
IF OBJECT_ID(N'[dbo].[FosterFamilies]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FosterFamilies];
GO
IF OBJECT_ID(N'[dbo].[Schools]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Schools];
GO
IF OBJECT_ID(N'[dbo].[ChildUser]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ChildUser];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Assets'
CREATE TABLE [dbo].[Assets] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [URL] varchar(255)  NULL,
    [Type] varchar(20)  NULL,
    [Location] varchar(255)  NULL,
    [Caption] varchar(max)  NULL,
    [Album_ID] bigint  NOT NULL
);
GO

-- Creating table 'Albums'
CREATE TABLE [dbo].[Albums] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [Title] varchar(255)  NULL,
    [DateCreated] datetime  NULL,
    [Description] varchar(max)  NULL,
    [EventDate] datetime  NULL,
    [ChildId] bigint  NOT NULL,
    [IsImportanDocumentsAlbum] bit  NOT NULL,
    [IsProfilePictureAlbum] bit  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [FirstName] varchar(50)  NULL,
    [LastName] varchar(50)  NULL,
    [UserType] varchar(50)  NULL,
    [Email] varchar(max)  NULL,
    [PhoneNumber] varchar(50)  NULL,
    [City] varchar(50)  NULL,
    [State] varchar(50)  NULL,
    [LoginName] varchar(50)  NOT NULL
);
GO

-- Creating table 'Children'
CREATE TABLE [dbo].[Children] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [DateOfBirth] datetime  NOT NULL,
    [City] nvarchar(max)  NULL,
    [State] nvarchar(max)  NULL,
    [Country] nvarchar(max)  NULL,
    [HospitalID] bigint  NULL,
    [BirthWeight] nvarchar(max)  NULL,
    [BirthLength] nvarchar(max)  NULL,
    [Last4SSN] nvarchar(max)  NOT NULL,
    [FosterFamilyId] bigint  NULL,
    [SchoolId] bigint  NULL,
    [BirthSibling] nvarchar(60)  NULL,
    [BirthSiblingRelationship] nvarchar(15)  NULL,
    [CaseWorker] nvarchar(60)  NULL
);
GO

-- Creating table 'Hospitals'
CREATE TABLE [dbo].[Hospitals] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [City] nvarchar(max)  NOT NULL,
    [State] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'FosterFamilies'
CREATE TABLE [dbo].[FosterFamilies] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [FatherName] nvarchar(max)  NOT NULL,
    [MotherName] nvarchar(max)  NOT NULL,
    [FosterSibling] nvarchar(60)  NULL,
    [City] nvarchar(max)  NOT NULL,
    [State] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [Country] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL,
    [FosterSiblingRelationship] nvarchar(15)  NULL
);
GO

-- Creating table 'Schools'
CREATE TABLE [dbo].[Schools] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [City] nvarchar(max)  NOT NULL,
    [State] nvarchar(max)  NOT NULL,
    [Country] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ChildUser'
CREATE TABLE [dbo].[ChildUser] (
    [Children_Id] bigint  NOT NULL,
    [Users_ID] bigint  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID] in table 'Assets'
ALTER TABLE [dbo].[Assets]
ADD CONSTRAINT [PK_Assets]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Albums'
ALTER TABLE [dbo].[Albums]
ADD CONSTRAINT [PK_Albums]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [Id] in table 'Children'
ALTER TABLE [dbo].[Children]
ADD CONSTRAINT [PK_Children]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Hospitals'
ALTER TABLE [dbo].[Hospitals]
ADD CONSTRAINT [PK_Hospitals]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'FosterFamilies'
ALTER TABLE [dbo].[FosterFamilies]
ADD CONSTRAINT [PK_FosterFamilies]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Schools'
ALTER TABLE [dbo].[Schools]
ADD CONSTRAINT [PK_Schools]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Children_Id], [Users_ID] in table 'ChildUser'
ALTER TABLE [dbo].[ChildUser]
ADD CONSTRAINT [PK_ChildUser]
    PRIMARY KEY NONCLUSTERED ([Children_Id], [Users_ID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Album_ID] in table 'Assets'
ALTER TABLE [dbo].[Assets]
ADD CONSTRAINT [FK_AssetAlbum]
    FOREIGN KEY ([Album_ID])
    REFERENCES [dbo].[Albums]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_AssetAlbum'
CREATE INDEX [IX_FK_AssetAlbum]
ON [dbo].[Assets]
    ([Album_ID]);
GO

-- Creating foreign key on [Children_Id] in table 'ChildUser'
ALTER TABLE [dbo].[ChildUser]
ADD CONSTRAINT [FK_ChildUser_Child]
    FOREIGN KEY ([Children_Id])
    REFERENCES [dbo].[Children]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Users_ID] in table 'ChildUser'
ALTER TABLE [dbo].[ChildUser]
ADD CONSTRAINT [FK_ChildUser_User]
    FOREIGN KEY ([Users_ID])
    REFERENCES [dbo].[Users]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ChildUser_User'
CREATE INDEX [IX_FK_ChildUser_User]
ON [dbo].[ChildUser]
    ([Users_ID]);
GO

-- Creating foreign key on [ChildId] in table 'Albums'
ALTER TABLE [dbo].[Albums]
ADD CONSTRAINT [FK_ChildAlbum]
    FOREIGN KEY ([ChildId])
    REFERENCES [dbo].[Children]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ChildAlbum'
CREATE INDEX [IX_FK_ChildAlbum]
ON [dbo].[Albums]
    ([ChildId]);
GO

-- Creating foreign key on [HospitalID] in table 'Children'
ALTER TABLE [dbo].[Children]
ADD CONSTRAINT [FK_HospitalChild]
    FOREIGN KEY ([HospitalID])
    REFERENCES [dbo].[Hospitals]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_HospitalChild'
CREATE INDEX [IX_FK_HospitalChild]
ON [dbo].[Children]
    ([HospitalID]);
GO

-- Creating foreign key on [FosterFamilyId] in table 'Children'
ALTER TABLE [dbo].[Children]
ADD CONSTRAINT [FK_ChildFosterFamily]
    FOREIGN KEY ([FosterFamilyId])
    REFERENCES [dbo].[FosterFamilies]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ChildFosterFamily'
CREATE INDEX [IX_FK_ChildFosterFamily]
ON [dbo].[Children]
    ([FosterFamilyId]);
GO

-- Creating foreign key on [SchoolId] in table 'Children'
ALTER TABLE [dbo].[Children]
ADD CONSTRAINT [FK_ChildSchool]
    FOREIGN KEY ([SchoolId])
    REFERENCES [dbo].[Schools]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ChildSchool'
CREATE INDEX [IX_FK_ChildSchool]
ON [dbo].[Children]
    ([SchoolId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------