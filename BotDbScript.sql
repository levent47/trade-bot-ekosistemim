USE [master]
GO
/****** Object:  Database [MostBasedBotDB]    Script Date: 31.03.2020 23:23:31 ******/
CREATE DATABASE [MostBasedBotDB] ON  PRIMARY 
( NAME = N'MostBasedBotDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\MostBasedBotDB.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MostBasedBotDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\MostBasedBotDB_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MostBasedBotDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MostBasedBotDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MostBasedBotDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MostBasedBotDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MostBasedBotDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MostBasedBotDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MostBasedBotDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MostBasedBotDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MostBasedBotDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MostBasedBotDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MostBasedBotDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MostBasedBotDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MostBasedBotDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MostBasedBotDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MostBasedBotDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MostBasedBotDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MostBasedBotDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MostBasedBotDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MostBasedBotDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MostBasedBotDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MostBasedBotDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MostBasedBotDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MostBasedBotDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MostBasedBotDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MostBasedBotDB] SET  MULTI_USER 
GO
ALTER DATABASE [MostBasedBotDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MostBasedBotDB] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MostBasedBotDB', N'ON'
GO
USE [MostBasedBotDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [MostBasedBotDB]
GO
/****** Object:  Table [dbo].[FiyatKontrolTablosu]    Script Date: 31.03.2020 23:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FiyatKontrolTablosu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IslemID] [int] NULL,
	[KontrolTarihi] [datetime] NULL,
	[KontrolFiyat] [decimal](20, 8) NULL,
	[KarOrani] [decimal](12, 2) NULL,
 CONSTRAINT [PK_FiyatKontrolTablosu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IslemTablosu]    Script Date: 31.03.2020 23:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IslemTablosu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Sembol] [nvarchar](50) NULL,
	[Periyot] [nvarchar](50) NULL,
	[MostParametreleri] [nvarchar](50) NULL,
	[GirisTarihi] [datetime] NULL,
	[GirisBarAcilisTarihi] [datetime] NULL,
	[CoinAdeti] [decimal](20, 8) NULL,
	[GirisFiyat] [decimal](20, 8) NULL,
	[GirisPariteKarsiligi] [decimal](20, 8) NULL,
	[KontrolTarihi] [datetime] NULL,
	[KontrolFiyat] [decimal](20, 8) NULL,
	[KontrolPariteKarsiligi] [decimal](20, 8) NULL,
	[KarPariteKarsiligi] [decimal](20, 8) NULL,
	[KarOrani] [decimal](12, 2) NULL,
	[IslemKapandiMi] [bit] NULL,
	[PikFiyat] [decimal](20, 8) NULL,
	[PikOrani] [decimal](12, 2) NULL,
	[PikTarihi] [datetime] NULL,
 CONSTRAINT [PK_IslemTablosu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RehberTablo]    Script Date: 31.03.2020 23:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RehberTablo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Sembol] [nvarchar](50) NULL,
	[Periyot] [nvarchar](50) NULL,
	[MostParametreleri] [nvarchar](50) NULL,
	[KarOran] [decimal](12, 2) NULL,
	[BarSayisi] [int] NULL,
	[IslemSayisi] [int] NULL,
	[BasariliIslemSayisi] [int] NULL,
 CONSTRAINT [PK_RehberTablo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StratejiyeTakilanlar]    Script Date: 31.03.2020 23:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StratejiyeTakilanlar](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sembol] [nvarchar](50) NULL,
	[Periyot] [nvarchar](50) NULL,
	[MostParametreleri] [nvarchar](50) NULL,
	[GecenBarSayisi] [int] NULL,
	[AlSinyalFiyat] [decimal](20, 8) NULL,
	[MevcutFiyat] [decimal](20, 8) NULL,
	[Sebep] [nvarchar](250) NULL,
 CONSTRAINT [PK_StratejiyeTakilanlar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TarayiciSonuclari]    Script Date: 31.03.2020 23:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TarayiciSonuclari](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Sembol] [nvarchar](50) NULL,
	[Periyot] [nvarchar](50) NULL,
	[MostParametreleri] [nvarchar](50) NULL,
	[Sermaye] [decimal](12, 8) NULL,
	[Kar] [decimal](12, 8) NULL,
	[KarOran] [decimal](12, 2) NULL,
	[BarSayisi] [int] NULL,
	[IslemSayisi] [int] NULL,
	[SonDurum] [nvarchar](50) NULL,
	[AlBarAcilisTarihi] [datetime] NULL,
	[GecenBarSayisi] [int] NULL,
	[AlSinyalFiyat] [decimal](12, 8) NULL,
	[MevcutFiyat] [decimal](12, 8) NULL,
	[AlVeMevcutFarkOran] [decimal](12, 2) NULL,
 CONSTRAINT [PK_TarayiciSonuclari] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[temp_RehberTablo]    Script Date: 31.03.2020 23:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_RehberTablo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Sembol] [nvarchar](50) NULL,
	[Periyot] [nvarchar](50) NULL,
	[MostParametreleri] [nvarchar](50) NULL,
	[KarOran] [decimal](12, 2) NULL,
	[BarSayisi] [int] NULL,
	[IslemSayisi] [int] NULL,
	[BasariliIslemSayisi] [int] NULL,
 CONSTRAINT [PK_temp_RehberTablo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[temp_TarayiciSonuclari]    Script Date: 31.03.2020 23:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_TarayiciSonuclari](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Sembol] [nvarchar](50) NULL,
	[Periyot] [nvarchar](50) NULL,
	[MostParametreleri] [nvarchar](50) NULL,
	[Sermaye] [decimal](12, 8) NULL,
	[Kar] [decimal](12, 8) NULL,
	[KarOran] [decimal](12, 2) NULL,
	[BarSayisi] [int] NULL,
	[IslemSayisi] [int] NULL,
	[SonDurum] [nvarchar](50) NULL,
	[AlBarAcilisTarihi] [datetime] NULL,
	[GecenBarSayisi] [int] NULL,
	[AlSinyalFiyat] [decimal](12, 8) NULL,
	[MevcutFiyat] [decimal](12, 8) NULL,
	[AlVeMevcutFarkOran] [decimal](12, 2) NULL,
 CONSTRAINT [PK_temp_TarayiciSonuclari] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [MostBasedBotDB] SET  READ_WRITE 
GO
