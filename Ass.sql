USE [master]
GO
/****** Object:  Database [MusicApp]    Script Date: 03/23/2022 09:18:20 ******/
CREATE DATABASE [MusicApp] 
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MusicApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MusicApp] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [MusicApp] SET ANSI_NULLS OFF
GO
ALTER DATABASE [MusicApp] SET ANSI_PADDING OFF
GO
ALTER DATABASE [MusicApp] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [MusicApp] SET ARITHABORT OFF
GO
ALTER DATABASE [MusicApp] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [MusicApp] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [MusicApp] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [MusicApp] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [MusicApp] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [MusicApp] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [MusicApp] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [MusicApp] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [MusicApp] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [MusicApp] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [MusicApp] SET  DISABLE_BROKER
GO
ALTER DATABASE [MusicApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [MusicApp] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [MusicApp] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [MusicApp] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [MusicApp] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [MusicApp] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [MusicApp] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [MusicApp] SET  READ_WRITE
GO
ALTER DATABASE [MusicApp] SET RECOVERY SIMPLE
GO
ALTER DATABASE [MusicApp] SET  MULTI_USER
GO
ALTER DATABASE [MusicApp] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [MusicApp] SET DB_CHAINING OFF
GO
USE [MusicApp]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 03/23/2022 09:18:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[FullName] [nvarchar](50) NOT NULL,
	[Email] [nchar](20) NOT NULL,
	[PassWord] [nchar](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayList]    Script Date: 03/23/2022 09:18:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayList](
	[IDPlayList] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nchar](400) NULL,
 CONSTRAINT [PK_PlayList] PRIMARY KEY CLUSTERED 
(
	[IDPlayList] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 03/23/2022 09:18:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[IDUser] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Email] [nchar](20) NOT NULL,
	[PassWord] [nchar](10) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IDUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 03/23/2022 09:18:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[IDType] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Type_1] PRIMARY KEY CLUSTERED 
(
	[IDType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Song]    Script Date: 03/23/2022 09:18:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Song](
	[IDSong] [int] IDENTITY(1,1) NOT NULL,
	[IDType] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Singer] [nvarchar](100) NOT NULL,
	[Image] [nchar](400) NOT NULL,
	[Link] [nchar](1000) NOT NULL,
	[Des] [varchar](200) NULL,
 CONSTRAINT [PK_Song] PRIMARY KEY CLUSTERED 
(
	[IDSong] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PlayListUser]    Script Date: 03/23/2022 09:18:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayListUser](
	[IDPlayList] [int] NOT NULL,
	[IDUser] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FavorSong]    Script Date: 03/23/2022 09:18:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavorSong](
	[IDUser] [int] NOT NULL,
	[IDSong] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayListSongUser]    Script Date: 03/23/2022 09:18:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayListSongUser](
	[IDUser] [int] NOT NULL,
	[IDPlayList] [int] NOT NULL,
	[IDSong] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayListSong]    Script Date: 03/23/2022 09:18:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayListSong](
	[IDPlayList] [int] NOT NULL,
	[IDSong] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Song_Type]    Script Date: 03/23/2022 09:18:21 ******/
ALTER TABLE [dbo].[Song]  WITH CHECK ADD  CONSTRAINT [FK_Song_Type] FOREIGN KEY([IDType])
REFERENCES [dbo].[Type] ([IDType])
GO
ALTER TABLE [dbo].[Song] CHECK CONSTRAINT [FK_Song_Type]
GO
/****** Object:  ForeignKey [FK_PlayListUser_User]    Script Date: 03/23/2022 09:18:21 ******/
ALTER TABLE [dbo].[PlayListUser]  WITH CHECK ADD  CONSTRAINT [FK_PlayListUser_User] FOREIGN KEY([IDUser])
REFERENCES [dbo].[User] ([IDUser])
GO
ALTER TABLE [dbo].[PlayListUser] CHECK CONSTRAINT [FK_PlayListUser_User]
GO
/****** Object:  ForeignKey [FK_FavorSong_Song]    Script Date: 03/23/2022 09:18:21 ******/
ALTER TABLE [dbo].[FavorSong]  WITH CHECK ADD  CONSTRAINT [FK_FavorSong_Song] FOREIGN KEY([IDSong])
REFERENCES [dbo].[Song] ([IDSong])
GO
ALTER TABLE [dbo].[FavorSong] CHECK CONSTRAINT [FK_FavorSong_Song]
GO
/****** Object:  ForeignKey [FK_FavorSong_User]    Script Date: 03/23/2022 09:18:21 ******/
ALTER TABLE [dbo].[FavorSong]  WITH CHECK ADD  CONSTRAINT [FK_FavorSong_User] FOREIGN KEY([IDUser])
REFERENCES [dbo].[User] ([IDUser])
GO
ALTER TABLE [dbo].[FavorSong] CHECK CONSTRAINT [FK_FavorSong_User]
GO
/****** Object:  ForeignKey [FK_PlayListSongUser_Song]    Script Date: 03/23/2022 09:18:21 ******/
ALTER TABLE [dbo].[PlayListSongUser]  WITH CHECK ADD  CONSTRAINT [FK_PlayListSongUser_Song] FOREIGN KEY([IDSong])
REFERENCES [dbo].[Song] ([IDSong])
GO
ALTER TABLE [dbo].[PlayListSongUser] CHECK CONSTRAINT [FK_PlayListSongUser_Song]
GO
/****** Object:  ForeignKey [FK_PlayListSongUser_User]    Script Date: 03/23/2022 09:18:21 ******/
ALTER TABLE [dbo].[PlayListSongUser]  WITH CHECK ADD  CONSTRAINT [FK_PlayListSongUser_User] FOREIGN KEY([IDUser])
REFERENCES [dbo].[User] ([IDUser])
GO
ALTER TABLE [dbo].[PlayListSongUser] CHECK CONSTRAINT [FK_PlayListSongUser_User]
GO
/****** Object:  ForeignKey [FK_PlayListSong_PlayList]    Script Date: 03/23/2022 09:18:21 ******/
ALTER TABLE [dbo].[PlayListSong]  WITH CHECK ADD  CONSTRAINT [FK_PlayListSong_PlayList] FOREIGN KEY([IDPlayList])
REFERENCES [dbo].[PlayList] ([IDPlayList])
GO
ALTER TABLE [dbo].[PlayListSong] CHECK CONSTRAINT [FK_PlayListSong_PlayList]
GO
/****** Object:  ForeignKey [FK_PlayListSong_Song]    Script Date: 03/23/2022 09:18:21 ******/
ALTER TABLE [dbo].[PlayListSong]  WITH CHECK ADD  CONSTRAINT [FK_PlayListSong_Song] FOREIGN KEY([IDSong])
REFERENCES [dbo].[Song] ([IDSong])
GO
ALTER TABLE [dbo].[PlayListSong] CHECK CONSTRAINT [FK_PlayListSong_Song]
GO
