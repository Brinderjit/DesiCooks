USE [master]
GO
/****** Object:  Database [DesiCooks]    Script Date: 27/10/2017 9:05:44 AM ******/
CREATE DATABASE [DesiCooks]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DesiCooks', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DesiCooks.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DesiCooks_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DesiCooks_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DesiCooks] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DesiCooks].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DesiCooks] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DesiCooks] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DesiCooks] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DesiCooks] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DesiCooks] SET ARITHABORT OFF 
GO
ALTER DATABASE [DesiCooks] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DesiCooks] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DesiCooks] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DesiCooks] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DesiCooks] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DesiCooks] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DesiCooks] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DesiCooks] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DesiCooks] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DesiCooks] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DesiCooks] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DesiCooks] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DesiCooks] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DesiCooks] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DesiCooks] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DesiCooks] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DesiCooks] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DesiCooks] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DesiCooks] SET  MULTI_USER 
GO
ALTER DATABASE [DesiCooks] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DesiCooks] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DesiCooks] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DesiCooks] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DesiCooks] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DesiCooks]
GO
/****** Object:  User [brinderjit123]    Script Date: 27/10/2017 9:05:44 AM ******/
CREATE USER [brinderjit123] FOR LOGIN [brinderjit123] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Foods]    Script Date: 27/10/2017 9:05:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Foods](
	[foodId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[imagePath] [varchar](100) NULL,
	[description] [varchar](500) NULL,
 CONSTRAINT [PK_Foods] PRIMARY KEY CLUSTERED 
(
	[foodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[orderFoodMapping]    Script Date: 27/10/2017 9:05:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderFoodMapping](
	[foodid] [int] NULL,
	[orderId] [bigint] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_orderFoodMapping] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orders]    Script Date: 27/10/2017 9:05:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[orders](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](50) NULL,
	[lastname] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[postalcode] [varchar](50) NULL,
	[provinceId] [int] NULL,
	[foodId] [int] NULL,
	[deliveryType] [varchar](50) NULL,
	[comments] [varchar](50) NULL,
	[phoneNumber] [bigint] NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[province]    Script Date: 27/10/2017 9:05:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[province](
	[provinceId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_province] PRIMARY KEY CLUSTERED 
(
	[provinceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Foods] ON 

INSERT [dbo].[Foods] ([foodId], [name], [imagePath], [description]) VALUES (1, N'Lemon drizzle cake', N'https://storage.googleapis.com/desicooks_bucket/FoodImages/LemonDrizzleCake.jpg', NULL)
INSERT [dbo].[Foods] ([foodId], [name], [imagePath], [description]) VALUES (2, N'Chilli con carne', N'https://storage.googleapis.com/desicooks_bucket/FoodImages/Chilliconcarne.jpeg', NULL)
INSERT [dbo].[Foods] ([foodId], [name], [imagePath], [description]) VALUES (3, N'Yummy scrummy carrot', N'https://storage.googleapis.com/desicooks_bucket/FoodImages/Yummyscrummycarrot.jpg', NULL)
INSERT [dbo].[Foods] ([foodId], [name], [imagePath], [description]) VALUES (4, N'Chocolate brownies', N'https://storage.googleapis.com/desicooks_bucket/FoodImages/Chocolatebrownies.jpg', NULL)
INSERT [dbo].[Foods] ([foodId], [name], [imagePath], [description]) VALUES (5, N'Spiced carrot', N'https://storage.googleapis.com/desicooks_bucket/FoodImages/Spicedcarrot.jpg', NULL)
INSERT [dbo].[Foods] ([foodId], [name], [imagePath], [description]) VALUES (6, N'Raspberry Bakewell cake', N'https://storage.googleapis.com/desicooks_bucket/FoodImages/RaspberryBakewellcake.jpg', NULL)
SET IDENTITY_INSERT [dbo].[Foods] OFF
SET IDENTITY_INSERT [dbo].[orderFoodMapping] ON 

INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (1, 3, 1)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (2, 3, 2)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (3, 3, 3)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (1, 4, 4)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (2, 4, 5)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (3, 4, 6)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (1, 5, 7)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (2, 5, 8)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (3, 5, 9)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (1, 6, 10)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (2, 6, 11)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (3, 6, 12)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (1, 7, 13)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (2, 7, 14)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (3, 7, 15)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (1, 8, 16)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (2, 8, 17)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (3, 8, 18)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (4, 8, 19)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (5, 8, 20)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (6, 8, 21)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (1, 9, 22)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (2, 9, 23)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (3, 9, 24)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (4, 9, 25)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (5, 9, 26)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (6, 9, 27)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (1, 10, 28)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (2, 10, 29)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (3, 10, 30)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (4, 10, 31)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (5, 10, 32)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (6, 10, 33)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (1, 11, 34)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (2, 11, 35)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (3, 11, 36)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (5, 11, 37)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (6, 11, 38)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (1, 12, 39)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (2, 12, 40)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (3, 12, 41)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (5, 12, 42)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (6, 12, 43)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (1, 13, 44)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (2, 13, 45)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (3, 13, 46)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (5, 13, 47)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (6, 13, 48)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (1, 14, 49)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (2, 14, 50)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (3, 14, 51)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (5, 14, 52)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (6, 14, 53)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (1, 15, 54)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (2, 15, 55)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (3, 15, 56)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (5, 15, 57)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (6, 15, 58)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (3, 16, 59)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (4, 16, 60)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (5, 16, 61)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (3, 17, 62)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (4, 17, 63)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (5, 17, 64)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (3, 18, 65)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (4, 18, 66)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (5, 18, 67)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (3, 19, 68)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (4, 19, 69)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (5, 19, 70)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (3, 20, 71)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (4, 20, 72)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (5, 20, 73)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (3, 21, 74)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (4, 21, 75)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (5, 21, 76)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (3, 22, 77)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (4, 22, 78)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (5, 22, 79)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (3, 23, 80)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (4, 23, 81)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (5, 23, 82)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (3, 24, 83)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (4, 24, 84)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (5, 24, 85)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (3, 25, 86)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (4, 25, 87)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (5, 25, 88)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (3, 26, 89)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (4, 26, 90)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (5, 26, 91)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (1, 27, 92)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (2, 27, 93)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (1, 28, 94)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (2, 28, 95)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (1, 29, 96)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (2, 29, 97)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (1, 30, 98)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (2, 30, 99)
GO
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (1, 31, 100)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (2, 31, 101)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (1, 32, 102)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (2, 32, 103)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (3, 32, 104)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (4, 32, 105)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (1, 33, 106)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (2, 33, 107)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (3, 33, 108)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (1, 34, 109)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (2, 34, 110)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (5, 34, 111)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (6, 34, 112)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (1, 35, 113)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (2, 35, 114)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (3, 35, 115)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (5, 35, 116)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (6, 35, 117)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (1, 36, 118)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (2, 36, 119)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (3, 36, 120)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (5, 36, 121)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (6, 36, 122)
INSERT [dbo].[orderFoodMapping] ([foodid], [orderId], [id]) VALUES (8, 36, 123)
SET IDENTITY_INSERT [dbo].[orderFoodMapping] OFF
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (1, N'e', N'e', N'f', N'f', 1, NULL, N'P', N'sasx', 5643287654)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (2, N'e', N'e', N'f', N'f', 1, NULL, N'P', N'dfsda', 5643287654)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (3, N'e', N'e', N'f', N'f', 1, NULL, N'P', N'thgrferws', 5643287654)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (4, N'e', N'e', N'f', N'f', 1, NULL, N'P', N'trefwdqws', 5643287654)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (5, N'e', N'e', N'f', N'f', 1, NULL, N'P', N'trefwdqws', 5643287654)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (6, N'efdsafeds', N'efdwsa', N'fedcs', N'fvecdxs', 1, NULL, N'Pickup', N'trefwdqws', 5643287654)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (7, N'efdsafeds', N'efdwsa', N'fedcs', N'fvecdxs', 2, NULL, N'Pickup', N'trefwdqws', 5643287654)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (8, N'efdsafeds', N'efdwsa', N'fedcs', N'fvecdxs', 3, NULL, N'Pickup', N'trefwdqws', 5643287654)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (9, N'efdsafeds', N'efdwsa', N'fedcs', N'fvecdxs', 7, NULL, N'Pickup', N'trefwdqws', 5643287654)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (10, N'efdsafeds', N'efdwsa', N'fedcs', N'fvecdxs', 2, NULL, N'Pickup', N'trefwdqws', 5643287654)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (11, N'efdsafeds', N'efdwsa', N'fedcs', N'fvecdxs', 7, NULL, N'Pickup', N'trefwdqws', 5643287654)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (12, N'efdsafeds', N'efdwsa', N'fedcs', N'fvecdxs', 9, NULL, N'Pickup', N'trefwdqws', 5643287654)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (13, N'efd', N'efdwsa', N'fedcs', N'fvecdxs', 9, NULL, N'Pickup', N'trefwdqws', 5643287654)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (14, N'efdsafeds', N'efdwsa', N'fedcs', N'fvecdxs', 9, NULL, N'Pickup', N'trefwdqws', 5643287654)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (15, N'efdsafeds', N'efdwsa', N'fedcs', N'fvecdxs', 9, NULL, N'Pickup', N'trefwdqws', 5643287654)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (16, N'efdsafeds', N'efdwsa', N'fedcs', N'fvecdxs', 1, NULL, N'Pickup', N'ghfd', 5643287654)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (17, N'efdsafeds', N'efdwsa', N'fedcs', N'fvecdxs', 1, NULL, N'Pickup', N'ghfd', 5643287654)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (18, N'efdsafeds', N'efdwsa', N'fedcs', N'fvecdxs', 1, NULL, N'Pickup', N'ghfd', 5643287654)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (19, N'efdsafeds', N'efdwsasa', N'fedcs', N'fvecdxs', 1, NULL, N'Pickup', N'ghfd', 5643287654)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (20, N'efdsafeds', N'efdwsasa', N'fedcs', N'fvecdxs', 1, NULL, N'Pickup', N'ghfd', 5643287654)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (21, N'efdsafeds', N'efdwsasa', N'fedcs', N'fvecdxs', 1, NULL, N'Pickup', N'ghfd', 5643287654)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (22, N'efdsafeds', N'efdwsasa', N'fedcs', N'fvecdxs', 1, NULL, N'Pickup', N'ghfd', 5643287654)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (23, N'efdsafeds', N'efdwsasa', N'fedcs', N'fvecdxs', 1, NULL, N'Pickup', N'ghfd', 5643287654)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (24, N'efdsafeds', N'efdwsasa', N'fedcs', N'fvecdxs', 1, NULL, N'Pickup', N'ghfd', 5643287654)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (25, N'efdsafeds', N'efdwsasa', N'fedcs', N'fvecdxs', 1, NULL, N'Pickup', N'ghfd', 5643287654)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (26, N'efdsafeds', N'efdwsasa', N'fedcs', N'fvecdxs', 1, NULL, N'Pickup', N'ghfd', 5643287654)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (27, N'fryytgyh', N'fcghh', N'yuhtgr', N'tre', 1, NULL, N'Pickup', N'yhtygrf', 6543)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (28, N'ewsd', N'fcghh', N'yuhtgr', N'tre', 1, NULL, N'Pickup', N'yhtygrf', 6543)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (29, N'fryytgyh', N'ewsd', N'yuhtgr', N'tre', 1, NULL, N'Pickup', N'yhtygrf', 6543)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (30, N'fryytgyh', N'ewsd', N'yuhtgr', N'tre', 1, NULL, N'Pickup', N'yhtygrf', 6543)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (31, N'fryytgyh', N'fcghh', N'yuhtgr', N'tre', 5, NULL, N'Pickup', N'yhtygrf', 6543)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (32, N'tbrvefcdwxsbgnhbf vcxz', N'bgfvdcsxa', N'hgbfvdcsx', N'gvfdcsx', 1, NULL, N'Pickup', N'kiumjynhtbgrvfecdxwsza', 87654321)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (33, N'brinder', N'singh', N'gtrfecds', N'gbvfdcs', 1, NULL, N'Pickup', N'jnnhgbfvdcsx', 654376543)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (34, N'brinderjit', N'singh', N'gtrfecds', N'gbvfdcs', 1, NULL, N'Pickup', N'jnnhgbfvdcsx', 654376543)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (35, N'brinderjit', N'singh', N'gtrfecds', N'gbvfdcs', 1, NULL, N'Pickup', N'jnnhgbfvdcsx', 654376543)
INSERT [dbo].[orders] ([id], [firstname], [lastname], [city], [postalcode], [provinceId], [foodId], [deliveryType], [comments], [phoneNumber]) VALUES (36, N'brinderjit', N'singh', N'gtrfecds', N'gbvfdcs', 1, NULL, N'Delivery', N'jnnhgbfvdcsx', 654376543)
SET IDENTITY_INSERT [dbo].[orders] OFF
SET IDENTITY_INSERT [dbo].[province] ON 

INSERT [dbo].[province] ([provinceId], [name]) VALUES (1, N'Alberta')
INSERT [dbo].[province] ([provinceId], [name]) VALUES (2, N'British Columbia')
INSERT [dbo].[province] ([provinceId], [name]) VALUES (3, N'Manitoba')
INSERT [dbo].[province] ([provinceId], [name]) VALUES (4, N'New Brunswick')
INSERT [dbo].[province] ([provinceId], [name]) VALUES (5, N'Newfoundland and Labrador')
INSERT [dbo].[province] ([provinceId], [name]) VALUES (6, N'Nova Scotia')
INSERT [dbo].[province] ([provinceId], [name]) VALUES (7, N'Ontario')
INSERT [dbo].[province] ([provinceId], [name]) VALUES (8, N'Prince Edward Island')
INSERT [dbo].[province] ([provinceId], [name]) VALUES (9, N'Quebec')
INSERT [dbo].[province] ([provinceId], [name]) VALUES (10, N'Saskatchewan')
SET IDENTITY_INSERT [dbo].[province] OFF
/****** Object:  StoredProcedure [dbo].[insertFood]    Script Date: 27/10/2017 9:05:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertFood]
	@orderId bigint,
	@foodId int
AS
BEGIN
	insert into orderFoodMapping(foodid,orderId) values(@foodId,@orderId)
END

GO
/****** Object:  StoredProcedure [dbo].[insertOrder]    Script Date: 27/10/2017 9:05:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertOrder]
	-- Add the parameters for the stored procedure here
@firstName varchar(50),
@lastName varchar(50),
@city varchar(50),
@postalCode varchar(50),
@phoneNumber bigint,
@comments varchar(200),
@deliveryType varchar(50),
@province int,
@orderId bigint out

AS
BEGIN
	insert into orders(Firstname,lastname,city,postalCode,phoneNumber,deliveryType,provinceId,comments)
	values (@firstName,@lastName,@city,@postalCode,@phoneNumber,@deliveryType,@province,@comments)
	select @orderId=MAX(id) from orders
END

GO
/****** Object:  StoredProcedure [dbo].[proc_insertNewFood]    Script Date: 27/10/2017 9:05:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_insertNewFood]
	-- Add the parameters for the stored procedure here
@title varchar(50),
@path varchar(100),
@description varchar(500)
AS
BEGIN
	insert into Foods(name,imagePath,description) values(@title,@path,@description)
END

GO
/****** Object:  StoredProcedure [dbo].[userCheck]    Script Date: 27/10/2017 9:05:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
 CREATE  PROCEDURE [dbo].[userCheck] 
@firstname varchar(50),
@lastname varchar(50),
@flag int out
As
declare @count int
BEGIN
    set @flag=1;
	select @count=COUNT(*) from orders where @firstname=firstname and @lastname=lastname
		print(@count)
	if @count!=0
	begin
	select * from orders where @firstname= firstname and @lastname=lastname
		print(@flag)
	end
	else
	begin 
	set @flag=2;
	print(@flag)
	end
END

GO
USE [master]
GO
ALTER DATABASE [DesiCooks] SET  READ_WRITE 
GO
