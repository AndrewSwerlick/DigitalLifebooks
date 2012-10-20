
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 10/20/2012 10:45:02
-- Generated from EDMX file: C:\Projects\DigitalLifebooks\DigitalLifebooks\DigitalLifeBooks\DigitalLifeBooks\Models\DLBModel.edmx
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

IF OBJECT_ID(N'[DigitalLifeBooksModelStoreContainer].[FK_Assets_UserAssets]', 'F') IS NOT NULL
    ALTER TABLE [DigitalLifeBooksModelStoreContainer].[UserAssets] DROP CONSTRAINT [FK_Assets_UserAssets];
GO
IF OBJECT_ID(N'[DigitalLifeBooksModelStoreContainer].[FK_Users_UserAssets]', 'F') IS NOT NULL
    ALTER TABLE [DigitalLifeBooksModelStoreContainer].[UserAssets] DROP CONSTRAINT [FK_Users_UserAssets];
GO
IF OBJECT_ID(N'[dbo].[FK_UserSibliing_Users]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserSibliings] DROP CONSTRAINT [FK_UserSibliing_Users];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Albums]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Albums];
GO
IF OBJECT_ID(N'[dbo].[Assets]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Assets];
GO
IF OBJECT_ID(N'[DigitalLifeBooksModelStoreContainer].[UserAssets]', 'U') IS NOT NULL
    DROP TABLE [DigitalLifeBooksModelStoreContainer].[UserAssets];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[UserSibliings]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserSibliings];
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
    [ID] uniqueidentifier  NOT NULL,
    [URL] varchar(255)  NULL,
    [Type] varchar(20)  NULL,
    [Location] varchar(255)  NULL,
    [Caption] varchar(max)  NULL,
    [AlbumID] bigint  NOT NULL,
    [Album_ID] uniqueidentifier  NOT NULL
);
GO

-- Creating table 'Albums'
CREATE TABLE [dbo].[Albums] (
    [ID] uniqueidentifier  NOT NULL,
    [Title] varchar(255)  NULL,
    [DateCreated] datetime  NULL,
    [Description] varchar(max)  NULL,
    [EventDate] datetime  NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [ID] uniqueidentifier  NOT NULL,
    [FirstName] varchar(50)  NULL,
    [LastName] varchar(50)  NULL,
    [UserType] varchar(50)  NULL,
    [Email] varchar(max)  NULL,
    [PhoneNumber] varchar(50)  NULL,
    [DateOfBrith] datetime  NULL,
    [City] varchar(50)  NULL,
    [State] varchar(50)  NULL,
    [Country] varchar(50)  NULL,
    [HospitalID] uniqueidentifier  NULL,
    [BirthWeight] varchar(50)  NULL,
    [BirthLength] varchar(50)  NULL,
    [BirthMother] varchar(max)  NULL,
    [LoginName] varchar(50)  NOT NULL
);
GO

-- Creating table 'UserAssets'
CREATE TABLE [dbo].[UserAssets] (
    [Assets_ID] uniqueidentifier  NOT NULL,
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

-- Creating primary key on [Assets_ID], [Users_ID] in table 'UserAssets'
ALTER TABLE [dbo].[UserAssets]
ADD CONSTRAINT [PK_UserAssets]
    PRIMARY KEY NONCLUSTERED ([Assets_ID], [Users_ID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

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

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------