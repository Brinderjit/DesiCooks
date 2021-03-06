/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2014 (12.0.2269)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [DesiCooks]    Script Date: 22/09/2017 3:21:17 PM ******/
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
/****** Object:  User [brinderjit123]    Script Date: 22/09/2017 3:21:17 PM ******/
CREATE USER [brinderjit123] FOR LOGIN [brinderjit123] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Foods]    Script Date: 22/09/2017 3:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Foods](
	[foodId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_Foods] PRIMARY KEY CLUSTERED 
(
	[foodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderFoodMapping]    Script Date: 22/09/2017 3:21:17 PM ******/
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
/****** Object:  Table [dbo].[orders]    Script Date: 22/09/2017 3:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[province]    Script Date: 22/09/2017 3:21:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[insertFood]    Script Date: 22/09/2017 3:21:17 PM ******/
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
/****** Object:  StoredProcedure [dbo].[insertOrder]    Script Date: 22/09/2017 3:21:17 PM ******/
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
/****** Object:  StoredProcedure [dbo].[userCheck]    Script Date: 22/09/2017 3:21:17 PM ******/
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
