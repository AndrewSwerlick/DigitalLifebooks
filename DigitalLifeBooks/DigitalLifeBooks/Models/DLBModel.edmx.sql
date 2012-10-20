
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
<<<<<<< HEAD
-- Date Created: 10/20/2012 14:27:56
=======
-- Date Created: 10/20/2012 16:00:10
>>>>>>> cf22adbf01b073c5b66e0b296b6db05cc5714abc
-- Generated from EDMX file: C:\Users\Administrator\Documents\GitHub\DigitalLifebooks\DigitalLifeBooks\DigitalLifeBooks\Models\DLBModel.edmx
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
IF OBJECT_ID(N'[dbo].[FK_UserSibliing_Users]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserSibliings] DROP CONSTRAINT [FK_UserSibliing_Users];
GO
IF OBJECT_ID(N'[dbo].[FK_ChildUser_Child]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ChildUser] DROP CONSTRAINT [FK_ChildUser_Child];
GO
IF OBJECT_ID(N'[dbo].[FK_ChildUser_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ChildUser] DROP CONSTRAINT [FK_ChildUser_User];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[UserSibliings]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserSibliings];
GO
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
IF OBJECT_ID(N'[dbo].[ChildUser]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ChildUser];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'UserSibliings'
CREATE TABLE [dbo].[UserSibliings] (
    [ID] uniqueidentifier  NOT NULL,
    [SiblingName] varchar(max)  NULL,
    [Relationship] varchar(50)  NULL,
    [UserID] uniqueidentifier  NULL
);
GO

-- Creating table 'Assets'
CREATE TABLE [dbo].[Assets] (
    [ID] bigint IDENTITY(1,1) NOT NULL,
    [URL] varchar(255)  NULL,
    [Type] varchar(20)  NULL,
    [Location] varchar(255)  NULL,
    [Caption] varchar(max)  NULL,
    [AlbumID] bigint  NOT NULL,
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
    [ChildId] bigint  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [ID] uniqueidentifier  NOT NULL,
    [FirstName] varchar(50)  NOT NULL,
    [LastName] varchar(50)  NOT NULL,
    [UserType] varchar(50)  NOT NULL,
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
    [Last4SSN] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ChildUser'
CREATE TABLE [dbo].[ChildUser] (
    [Children_Id] bigint  NOT NULL,
    [Users_ID] uniqueidentifier  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID] in table 'UserSibliings'
ALTER TABLE [dbo].[UserSibliings]
ADD CONSTRAINT [PK_UserSibliings]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

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

-- Creating foreign key on [UserID] in table 'UserSibliings'
ALTER TABLE [dbo].[UserSibliings]
ADD CONSTRAINT [FK_UserSibliing_Users]
    FOREIGN KEY ([UserID])
    REFERENCES [dbo].[Users]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserSibliing_Users'
CREATE INDEX [IX_FK_UserSibliing_Users]
ON [dbo].[UserSibliings]
    ([UserID]);
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

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------