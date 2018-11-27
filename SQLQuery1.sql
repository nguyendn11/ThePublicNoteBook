
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/17/2018 10:37:08
-- Generated from EDMX file: E:\Hoc\Blog MVC\B129Blog\B129Blog\Models\Blogs.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ThePublicNoteBook];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Users_UserLevels]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_UserLevels];
GO
IF OBJECT_ID(N'[dbo].[FK_Pictures_Users]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Pictures] DROP CONSTRAINT [FK_Pictures_Users];
GO
IF OBJECT_ID(N'[dbo].[FK_Articles_Users]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Articles] DROP CONSTRAINT [FK_Articles_Users];
GO
IF OBJECT_ID(N'[dbo].[FK_ArticleLikes_Articles]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ArticleLikes] DROP CONSTRAINT [FK_ArticleLikes_Articles];
GO
IF OBJECT_ID(N'[dbo].[FK_ArticleLikes_Users]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ArticleLikes] DROP CONSTRAINT [FK_ArticleLikes_Users];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[UserLevels]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserLevels];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[Pictures]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Pictures];
GO
IF OBJECT_ID(N'[dbo].[Articles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Articles];
GO
IF OBJECT_ID(N'[dbo].[ArticleLikes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ArticleLikes];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'UserLevels'
CREATE TABLE [dbo].[UserLevels] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [LevelName] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserName] nvarchar(50)  NOT NULL,
    [Password] varchar(100)  NULL,
    [FullName] nvarchar(50)  NOT NULL,
    [Email] nvarchar(150)  NULL,
    [Phone] varchar(30)  NULL,
    [Address] nvarchar(250)  NULL,
    [Avatar] nvarchar(250)  NULL,
    [LevelId] int  NOT NULL,
    [Active] bit  NOT NULL
);
GO

-- Creating table 'Pictures'
CREATE TABLE [dbo].[Pictures] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Url] nvarchar(250)  NOT NULL,
    [UserId] int  NOT NULL
);
GO

-- Creating table 'Articles'
CREATE TABLE [dbo].[Articles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(250)  NOT NULL,
    [Image] nvarchar(250)  NOT NULL,
    [Description] nvarchar(1000)  NULL,
    [Content] nvarchar(max)  NOT NULL,
    [DateUp] datetime  NOT NULL,
    [Views] int  NOT NULL,
    [UserId] int  NOT NULL,
    [Active] bit  NOT NULL
);
GO

-- Creating table 'ArticleLikes'
CREATE TABLE [dbo].[ArticleLikes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [ArticleId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'UserLevels'
ALTER TABLE [dbo].[UserLevels]
ADD CONSTRAINT [PK_UserLevels]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Pictures'
ALTER TABLE [dbo].[Pictures]
ADD CONSTRAINT [PK_Pictures]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Articles'
ALTER TABLE [dbo].[Articles]
ADD CONSTRAINT [PK_Articles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ArticleLikes'
ALTER TABLE [dbo].[ArticleLikes]
ADD CONSTRAINT [PK_ArticleLikes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [LevelId] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_Users_UserLevels]
    FOREIGN KEY ([LevelId])
    REFERENCES [dbo].[UserLevels]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Users_UserLevels'
CREATE INDEX [IX_FK_Users_UserLevels]
ON [dbo].[Users]
    ([LevelId]);
GO

-- Creating foreign key on [UserId] in table 'Pictures'
ALTER TABLE [dbo].[Pictures]
ADD CONSTRAINT [FK_Pictures_Users]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Pictures_Users'
CREATE INDEX [IX_FK_Pictures_Users]
ON [dbo].[Pictures]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'Articles'
ALTER TABLE [dbo].[Articles]
ADD CONSTRAINT [FK_Articles_Users]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Articles_Users'
CREATE INDEX [IX_FK_Articles_Users]
ON [dbo].[Articles]
    ([UserId]);
GO

-- Creating foreign key on [ArticleId] in table 'ArticleLikes'
ALTER TABLE [dbo].[ArticleLikes]
ADD CONSTRAINT [FK_ArticleLikes_Articles]
    FOREIGN KEY ([ArticleId])
    REFERENCES [dbo].[Articles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ArticleLikes_Articles'
CREATE INDEX [IX_FK_ArticleLikes_Articles]
ON [dbo].[ArticleLikes]
    ([ArticleId]);
GO

-- Creating foreign key on [UserId] in table 'ArticleLikes'
ALTER TABLE [dbo].[ArticleLikes]
ADD CONSTRAINT [FK_ArticleLikes_Users]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ArticleLikes_Users'
CREATE INDEX [IX_FK_ArticleLikes_Users]
ON [dbo].[ArticleLikes]
    ([UserId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------