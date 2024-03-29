USE [master]
GO
/****** Object:  Database [OTSv1]    Script Date: 4.01.2022 15:51:11 ******/
CREATE DATABASE [OTSv1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OTSv1', FILENAME = N'C:\ProjectData\OTSv1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OTSv1_log', FILENAME = N'C:\ProjectData\OTSv1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OTSv1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OTSv1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OTSv1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OTSv1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OTSv1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OTSv1] SET ARITHABORT OFF 
GO
ALTER DATABASE [OTSv1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OTSv1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OTSv1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OTSv1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OTSv1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OTSv1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OTSv1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OTSv1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OTSv1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OTSv1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OTSv1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OTSv1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OTSv1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OTSv1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OTSv1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OTSv1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OTSv1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OTSv1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OTSv1] SET  MULTI_USER 
GO
ALTER DATABASE [OTSv1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OTSv1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OTSv1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OTSv1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OTSv1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OTSv1] SET QUERY_STORE = OFF
GO
USE [OTSv1]
GO
/****** Object:  Table [dbo].[datOgrenci]    Script Date: 4.01.2022 15:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datOgrenci](
	[OgrenciID] [tinyint] IDENTITY(1,1) NOT NULL,
	[OgrNo] [smallint] NOT NULL,
	[OgrAd] [nvarchar](50) NOT NULL,
	[OgrSoyad] [nvarchar](50) NOT NULL,
	[SinifID] [tinyint] NOT NULL,
	[OgrDT] [nvarchar](8) NOT NULL,
	[OgrCinsiyet] [char](1) NOT NULL,
 CONSTRAINT [PK_datOgrenci] PRIMARY KEY CLUSTERED 
(
	[OgrenciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datUser]    Script Date: 4.01.2022 15:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datUser](
	[UserID] [tinyint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](10) NOT NULL,
	[UserPass] [nvarchar](10) NOT NULL,
	[UserFName] [nvarchar](50) NOT NULL,
	[UserLName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_datUser] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prmSinif]    Script Date: 4.01.2022 15:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prmSinif](
	[SinifID] [tinyint] IDENTITY(1,1) NOT NULL,
	[SinifTnm] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_prmSinif] PRIMARY KEY CLUSTERED 
(
	[SinifID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[datOgrenci] ON 

INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (1, 100, N'Ümit', N'KARAÇİVİ', 1, N'20220119', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (2, 101, N'Nurgül', N'KARAÇIVI', 4, N'20220111', N'K')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (3, 102, N'Doga Bengi', N'KARAÇIVI', 3, N'20220125', N'K')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (4, 1, N'Joline', N'Lace', 2, N'20060229', N'K')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (5, 2, N'Jillie', N'Kerin', 3, N'20050906', N'K')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (6, 3, N'Nataline', N'Yakov', 6, N'20060416', N'K')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (7, 4, N'Betsey', N'Toopin', 6, N'20050131', N'K')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (8, 5, N'Clarey', N'Brugger', 5, N'20050402', N'K')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (9, 6, N'Scotty', N'McGrayle', 4, N'20050102', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (10, 7, N'Cyndie', N'Coopman', 6, N'20061216', N'K')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (11, 8, N'Ozzie', N'Simison', 1, N'20060413', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (12, 9, N'Dom', N'Syfax', 3, N'20051124', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (13, 10, N'Welch', N'Websdale', 5, N'20060605', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (14, 11, N'Biddie', N'Hedlestone', 6, N'20060508', N'K')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (15, 12, N'Thedrick', N'Emberson', 3, N'20060517', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (16, 13, N'Ad', N'Meatyard', 2, N'20050821', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (17, 14, N'Dick', N'Beagles', 5, N'20050415', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (18, 15, N'Patin', N'Dallosso', 2, N'20060820', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (19, 16, N'Llywellyn', N'Very', 3, N'20060107', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (20, 17, N'Faustina', N'Mathers', 1, N'20060927', N'K')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (21, 18, N'Bill', N'McVanamy', 6, N'20060928', N'K')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (22, 19, N'Jeramie', N'Belden', 3, N'20060114', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (23, 20, N'Caryl', N'Treadaway', 2, N'20060830', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (24, 21, N'Latisha', N'Badam', 2, N'20060706', N'K')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (25, 22, N'Court', N'Germann', 2, N'20060918', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (26, 23, N'Moshe', N'Ragat', 2, N'20050418', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (27, 24, N'Alfonse', N'Caulcott', 6, N'20050316', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (28, 25, N'Joanie', N'Iannini', 4, N'20061217', N'K')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (29, 26, N'Ariela', N'Fellini', 6, N'20050125', N'K')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (30, 27, N'Farra', N'Seiller', 2, N'20051117', N'K')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (31, 28, N'Nannette', N'McCosh', 1, N'20050129', N'K')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (32, 29, N'Alejandro', N'Grist', 6, N'20060111', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (33, 30, N'Emmanuel', N'Gledstane', 2, N'20050215', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (34, 31, N'Burt', N'Pittet', 4, N'20050701', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (35, 32, N'Camille', N'Fellowes', 1, N'20050526', N'K')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (36, 33, N'Antonino', N'Brandin', 6, N'20060723', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (37, 34, N'Luther', N'Carff', 3, N'20060417', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (38, 35, N'Travis', N'Ogger', 3, N'20060104', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (39, 36, N'Bastien', N'Adhams', 4, N'20050804', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (40, 37, N'Hailey', N'Craythorn', 2, N'20060523', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (41, 38, N'Niles', N'Royste', 1, N'20050304', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (42, 39, N'Nicolais', N'Goldston', 6, N'20050310', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (43, 40, N'Avictor', N'Huncoot', 4, N'20051010', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (44, 41, N'Dania', N'Wessing', 3, N'20051014', N'K')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (45, 42, N'Alfie', N'Teese', 3, N'20050603', N'K')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (46, 43, N'Nick', N'McAuslene', 3, N'20050308', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (47, 44, N'Angel', N'Vaar', 3, N'20050724', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (48, 45, N'Monro', N'Muirhead', 3, N'20050316', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (49, 46, N'Bax', N'Dungey', 3, N'20050122', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (50, 47, N'Kris', N'Ilyas', 2, N'20050610', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (51, 48, N'Irvine', N'Steenson', 6, N'20050114', N'E')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (52, 49, N'Noemi', N'Rook', 3, N'20050730', N'K')
INSERT [dbo].[datOgrenci] ([OgrenciID], [OgrNo], [OgrAd], [OgrSoyad], [SinifID], [OgrDT], [OgrCinsiyet]) VALUES (53, 50, N'Gaelan', N'Drage', 4, N'20060806', N'E')
SET IDENTITY_INSERT [dbo].[datOgrenci] OFF
GO
SET IDENTITY_INSERT [dbo].[datUser] ON 

INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [UserFName], [UserLName]) VALUES (1, N'ece.d', N'123', N'Ece', N'DİNÇER')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [UserFName], [UserLName]) VALUES (2, N'buse.a', N'123', N'Buse', N'Alkan')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [UserFName], [UserLName]) VALUES (3, N'okan.i', N'123', N'Okan', N'İŞLİ')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [UserFName], [UserLName]) VALUES (4, N'meryemc.d', N'123', N'Meryem Can', N'DOĞAN')
INSERT [dbo].[datUser] ([UserID], [UserName], [UserPass], [UserFName], [UserLName]) VALUES (5, N'umit.k', N'123', N'Ümit', N'KARAÇİVİ')
SET IDENTITY_INSERT [dbo].[datUser] OFF
GO
SET IDENTITY_INSERT [dbo].[prmSinif] ON 

INSERT [dbo].[prmSinif] ([SinifID], [SinifTnm]) VALUES (1, N'A Sınıfı')
INSERT [dbo].[prmSinif] ([SinifID], [SinifTnm]) VALUES (2, N'B Sınıfı')
INSERT [dbo].[prmSinif] ([SinifID], [SinifTnm]) VALUES (3, N'C Sınıfı')
INSERT [dbo].[prmSinif] ([SinifID], [SinifTnm]) VALUES (4, N'D Sınıfı')
INSERT [dbo].[prmSinif] ([SinifID], [SinifTnm]) VALUES (5, N'E Sınıfı')
INSERT [dbo].[prmSinif] ([SinifID], [SinifTnm]) VALUES (6, N'F Sınıfı')
SET IDENTITY_INSERT [dbo].[prmSinif] OFF
GO
USE [master]
GO
ALTER DATABASE [OTSv1] SET  READ_WRITE 
GO
