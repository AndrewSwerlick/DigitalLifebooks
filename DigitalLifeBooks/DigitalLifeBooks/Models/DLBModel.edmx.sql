
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
<<<<<<< HEAD
-- Date Created: 10/20/2012 14:06:16
-- Generated from EDMX file: C:\Users\Administrator\Documents\GitHub\DigitalLifebooks\DigitalLifeBooks\DigitalLifeBooks\Models\DLBModel.edmx
=======
-- Date Created: 10/20/2012 12:26:38
-- Generated from EDMX file: C:\Projects\DigitalLifebooks\DigitalLifebooks\DigitalLifeBooks\DigitalLifeBooks\Models\DLBModel.edmx
>>>>>>> 1d7f230df3291155adfcfa370fdaea55c9baeeda
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

<<<<<<< HEAD
IF OBJECT_ID(N'[dbo].[FK_AssetAlbum]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Assets] DROP CONSTRAINT [FK_AssetAlbum];
GO
=======
>>>>>>> 1d7f230df3291155adfcfa370fdaea55c9baeeda
IF OBJECT_ID(N'[dbo].[FK_UserSibliing_Users]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserSibliings] DROP CONSTRAINT [FK_UserSibliing_Users];
GO
IF OBJECT_ID(N'[dbo].[FK_UserAssets_Asset]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserAssets] DROP CONSTRAINT [FK_UserAssets_Asset];
GO
IF OBJECT_ID(N'[dbo].[FK_UserAssets_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserAssets] DROP CONSTRAINT [FK_UserAssets_User];
GO
<<<<<<< HEAD
IF OBJECT_ID(N'[dbo].[FK_ChildUser_Child]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ChildUser] DROP CONSTRAINT [FK_ChildUser_Child];
GO
IF OBJECT_ID(N'[dbo].[FK_ChildUser_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ChildUser] DROP CONSTRAINT [FK_ChildUser_User];
=======
IF OBJECT_ID(N'[dbo].[FK_AssetAlbum]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Assets] DROP CONSTRAINT [FK_AssetAlbum];
>>>>>>> 1d7f230df3291155adfcfa370fdaea55c9baeeda
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
<<<<<<< HEAD
IF OBJECT_ID(N'[dbo].[Children]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Children];
GO
IF OBJECT_ID(N'[dbo].[UserAssets]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserAssets];
GO
IF OBJECT_ID(N'[dbo].[ChildUser]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ChildUser];
=======
IF OBJECT_ID(N'[dbo].[UserAssets]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserAssets];
>>>>>>> 1d7f230df3291155adfcfa370fdaea55c9baeeda
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
    [EventDate] datetime  NULL
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

-- Creating table 'UserAssets'
CREATE TABLE [dbo].[UserAssets] (
    [Assets_ID] bigint  NOT NULL,
    [Users_ID] uniqueidentifier  NOT NULL
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

-- Creating primary key on [Assets_ID], [Users_ID] in table 'UserAssets'
ALTER TABLE [dbo].[UserAssets]
ADD CONSTRAINT [PK_UserAssets]
    PRIMARY KEY NONCLUSTERED ([Assets_ID], [Users_ID] ASC);
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

-- Creating foreign key on [Assets_ID] in table 'UserAssets'
ALTER TABLE [dbo].[UserAssets]
ADD CONSTRAINT [FK_UserAssets_Asset]
    FOREIGN KEY ([Assets_ID])
    REFERENCES [dbo].[Assets]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Users_ID] in table 'UserAssets'
ALTER TABLE [dbo].[UserAssets]
ADD CONSTRAINT [FK_UserAssets_User]
    FOREIGN KEY ([Users_ID])
    REFERENCES [dbo].[Users]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserAssets_User'
CREATE INDEX [IX_FK_UserAssets_User]
ON [dbo].[UserAssets]
    ([Users_ID]);
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

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------