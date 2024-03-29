USE [master]
GO
/****** Object:  Database [SoldatovaCRUD]    Script Date: 3/5/2024 1:36:22 PM ******/
CREATE DATABASE [SoldatovaCRUD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SoldatovaCRUD', FILENAME = N'D:\SQL\MSSQL16.SQLEXPRESS\MSSQL\DATA\SoldatovaCRUD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SoldatovaCRUD_log', FILENAME = N'D:\SQL\MSSQL16.SQLEXPRESS\MSSQL\DATA\SoldatovaCRUD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SoldatovaCRUD] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SoldatovaCRUD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SoldatovaCRUD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SoldatovaCRUD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SoldatovaCRUD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SoldatovaCRUD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SoldatovaCRUD] SET ARITHABORT OFF 
GO
ALTER DATABASE [SoldatovaCRUD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SoldatovaCRUD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SoldatovaCRUD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SoldatovaCRUD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SoldatovaCRUD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SoldatovaCRUD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SoldatovaCRUD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SoldatovaCRUD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SoldatovaCRUD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SoldatovaCRUD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SoldatovaCRUD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SoldatovaCRUD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SoldatovaCRUD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SoldatovaCRUD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SoldatovaCRUD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SoldatovaCRUD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SoldatovaCRUD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SoldatovaCRUD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SoldatovaCRUD] SET  MULTI_USER 
GO
ALTER DATABASE [SoldatovaCRUD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SoldatovaCRUD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SoldatovaCRUD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SoldatovaCRUD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SoldatovaCRUD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SoldatovaCRUD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SoldatovaCRUD] SET QUERY_STORE = ON
GO
ALTER DATABASE [SoldatovaCRUD] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SoldatovaCRUD]
GO
/****** Object:  Table [dbo].[EntryHistory]    Script Date: 3/5/2024 1:36:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntryHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DateTime] [date] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_EntryHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntryType]    Script Date: 3/5/2024 1:36:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntryType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EntryType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Merch]    Script Date: 3/5/2024 1:36:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Merch](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[cost] [int] NOT NULL,
	[sale] [int] NULL,
	[picture] [nvarchar](50) NULL,
 CONSTRAINT [PK_Merch] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/5/2024 1:36:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DateOrder] [date] NOT NULL,
	[DateArrive] [date] NOT NULL,
	[Arrived] [bit] NOT NULL,
	[Place] [int] NOT NULL,
	[UserID] [int] NULL,
	[Amount] [int] NULL,
	[Cost] [int] NULL,
	[Code] [int] NULL,
	[Sale] [int] NULL,
	[MerchID] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderMerch]    Script Date: 3/5/2024 1:36:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderMerch](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[MerchID] [int] NOT NULL,
 CONSTRAINT [PK_OrderMerch] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Places]    Script Date: 3/5/2024 1:36:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Places](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Place] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Places] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/5/2024 1:36:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[roleTitle] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Worker]    Script Date: 3/5/2024 1:36:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Worker](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Date] [date] NOT NULL,
	[Time] [time](7) NOT NULL,
	[Entry] [int] NOT NULL,
	[Picture] [nvarchar](50) NULL,
 CONSTRAINT [PK_Worker] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EntryHistory] ON 

INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (1, CAST(N'2023-12-06' AS Date), 26)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (2, CAST(N'2023-12-06' AS Date), 2)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (3, CAST(N'2023-12-06' AS Date), 2)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (4, CAST(N'2023-12-07' AS Date), 2)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (5, CAST(N'2023-12-07' AS Date), 2)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (6, CAST(N'2023-12-07' AS Date), 2)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (7, CAST(N'2023-12-07' AS Date), 2)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (8, CAST(N'2023-12-07' AS Date), 2)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (9, CAST(N'2023-12-07' AS Date), 2)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (10, CAST(N'2023-12-07' AS Date), 2)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (11, CAST(N'2023-12-07' AS Date), 2)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (12, CAST(N'2023-12-07' AS Date), 2)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (13, CAST(N'2023-12-07' AS Date), 2)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (14, CAST(N'2023-12-07' AS Date), 2)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (15, CAST(N'2023-12-07' AS Date), 2)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (16, CAST(N'2023-12-07' AS Date), 2)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (17, CAST(N'2023-12-13' AS Date), 26)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (18, CAST(N'2023-12-13' AS Date), 26)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (19, CAST(N'2023-12-13' AS Date), 2)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (20, CAST(N'2023-12-13' AS Date), 2)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (21, CAST(N'2023-12-13' AS Date), 26)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (22, CAST(N'2023-12-13' AS Date), 26)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (23, CAST(N'2023-12-13' AS Date), 2)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (24, CAST(N'2023-12-13' AS Date), 2)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (25, CAST(N'2023-12-13' AS Date), 26)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (26, CAST(N'2023-12-13' AS Date), 26)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (27, CAST(N'2024-03-05' AS Date), 2)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (28, CAST(N'2024-03-05' AS Date), 2)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (29, CAST(N'2024-03-05' AS Date), 2)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (30, CAST(N'2024-03-05' AS Date), 3)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (31, CAST(N'2024-03-05' AS Date), 4)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (32, CAST(N'2024-03-05' AS Date), 13)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (33, CAST(N'2024-03-05' AS Date), 13)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (34, CAST(N'2024-03-05' AS Date), 13)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (35, CAST(N'2024-03-05' AS Date), 27)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (36, CAST(N'2024-03-05' AS Date), 27)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (37, CAST(N'2024-03-05' AS Date), 2)
INSERT [dbo].[EntryHistory] ([ID], [DateTime], [UserID]) VALUES (38, CAST(N'2024-03-05' AS Date), 2)
SET IDENTITY_INSERT [dbo].[EntryHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[EntryType] ON 

INSERT [dbo].[EntryType] ([ID], [Type]) VALUES (1, N'Success')
INSERT [dbo].[EntryType] ([ID], [Type]) VALUES (2, N'Unsuccess')
SET IDENTITY_INSERT [dbo].[EntryType] OFF
GO
SET IDENTITY_INSERT [dbo].[Merch] ON 

INSERT [dbo].[Merch] ([ID], [name], [cost], [sale], [picture]) VALUES (1, N'Консультация', 10000, 10, N'/Res/stuff/a.jpeg')
INSERT [dbo].[Merch] ([ID], [name], [cost], [sale], [picture]) VALUES (2, N'Подсчет налогов', 50000, NULL, N'/Res/stuff/o.jpg')
INSERT [dbo].[Merch] ([ID], [name], [cost], [sale], [picture]) VALUES (3, N'Бизнес-план', 100000, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Merch] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (1, CAST(N'2023-11-11' AS Date), CAST(N'2023-12-22' AS Date), 0, 1, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (2, CAST(N'2023-11-12' AS Date), CAST(N'2024-01-01' AS Date), 0, 2, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (3, CAST(N'2023-10-12' AS Date), CAST(N'2023-11-11' AS Date), 1, 3, 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (4, CAST(N'2023-12-02' AS Date), CAST(N'2023-12-09' AS Date), 0, 1, NULL, 1, NULL, 3105, NULL, NULL)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (5, CAST(N'2023-12-02' AS Date), CAST(N'2023-12-09' AS Date), 0, 1, 0, 1, 0, 4569, 0, 3)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (6, CAST(N'2023-12-02' AS Date), CAST(N'2023-12-09' AS Date), 0, 1, 0, 1, 500, 3415, NULL, 3)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (7, CAST(N'2023-12-02' AS Date), CAST(N'2023-12-09' AS Date), 0, 1, 1, 1, 100, 7631, 10, 1)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (8, CAST(N'2023-12-02' AS Date), CAST(N'2023-12-09' AS Date), 0, 1, 1, 1, 500, 6176, NULL, 3)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (9, CAST(N'2023-12-02' AS Date), CAST(N'2023-12-09' AS Date), 0, 1, 1, 1, 500, 6331, NULL, 3)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (10, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 1, 1, 100, 2409, 10, 1)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (11, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 1, 1, 500, 6324, NULL, 3)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (12, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 1, 1, 100, 9348, 10, 1)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (13, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 26, 1, 100, 8355, 10, 1)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (14, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 26, 1, 500, 9384, NULL, 3)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (15, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 26, 1, 500, 7909, NULL, 3)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (16, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 26, 1, 500, 7412, NULL, 3)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (17, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 26, 1, 500, 6031, NULL, 3)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (18, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 26, 1, 100, 8366, 10, 1)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (19, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 26, 1, 500, 1952, NULL, 3)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (20, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 26, 1, 100, 6594, 10, 1)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (21, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 26, 1, 500, 1621, NULL, 3)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (22, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 26, 1, 100, 4059, 10, 1)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (23, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 26, 1, 90, 9381, 10, 1)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (24, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 26, 1, 90, 8012, 10, 1)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (25, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 26, 1, NULL, 3250, NULL, 3)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (26, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 26, 1, 90, 7655, 10, 1)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (27, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 26, 1, NULL, 5698, NULL, 3)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (28, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 26, 1, 100, 2050, 10, 1)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (29, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 26, 1, 100, 1401, 10, 1)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (30, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 26, 1, NULL, 4759, NULL, 2)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (31, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 26, 1, NULL, 2719, NULL, 3)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (32, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 26, 1, NULL, 3075, NULL, 3)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (33, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 26, 1, NULL, 1005, NULL, 3)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (34, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 26, 1, NULL, 1386, NULL, 3)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (35, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 26, 1, NULL, 5947, NULL, 3)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (36, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 26, 1, NULL, 6810, NULL, 3)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (37, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 26, 1, 90, 3603, 10, 1)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (38, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 26, 1, 90, 3067, 10, 1)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (39, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 26, 1, NULL, 7435, NULL, 3)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (40, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 26, 1, 90, 8434, 10, 1)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (41, CAST(N'2023-12-03' AS Date), CAST(N'2023-12-10' AS Date), 0, 1, 26, 1, NULL, 7215, NULL, 3)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (42, CAST(N'2023-12-04' AS Date), CAST(N'2023-12-11' AS Date), 0, 1, 26, 1, NULL, 8089, NULL, 3)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (43, CAST(N'2023-12-05' AS Date), CAST(N'2023-12-12' AS Date), 0, 1, 26, 1, 90, 1733, 10, 1)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (44, CAST(N'2023-12-13' AS Date), CAST(N'2023-12-20' AS Date), 0, 1, 26, 1, 1000000, 2515, 10, 1)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (45, CAST(N'2024-03-05' AS Date), CAST(N'2024-03-12' AS Date), 0, 1, 13, 1, 50000, 4702, NULL, 2)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (46, CAST(N'2024-03-05' AS Date), CAST(N'2024-03-08' AS Date), 0, 2, 13, 2, 18000, 1873, 10, 1)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (47, CAST(N'2024-03-05' AS Date), CAST(N'2024-03-12' AS Date), 0, 1, 13, 1, 50000, 5340, NULL, 2)
INSERT [dbo].[Order] ([ID], [DateOrder], [DateArrive], [Arrived], [Place], [UserID], [Amount], [Cost], [Code], [Sale], [MerchID]) VALUES (48, CAST(N'2024-03-05' AS Date), CAST(N'2024-03-12' AS Date), 0, 1, 27, 1, 10000, 3701, 10, 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderMerch] ON 

INSERT [dbo].[OrderMerch] ([ID], [OrderID], [MerchID]) VALUES (1, 1, 1)
INSERT [dbo].[OrderMerch] ([ID], [OrderID], [MerchID]) VALUES (2, 1, 2)
INSERT [dbo].[OrderMerch] ([ID], [OrderID], [MerchID]) VALUES (3, 2, 2)
INSERT [dbo].[OrderMerch] ([ID], [OrderID], [MerchID]) VALUES (4, 3, 3)
INSERT [dbo].[OrderMerch] ([ID], [OrderID], [MerchID]) VALUES (5, 3, 1)
INSERT [dbo].[OrderMerch] ([ID], [OrderID], [MerchID]) VALUES (6, 3, 2)
SET IDENTITY_INSERT [dbo].[OrderMerch] OFF
GO
SET IDENTITY_INSERT [dbo].[Places] ON 

INSERT [dbo].[Places] ([ID], [Place]) VALUES (1, N'North')
INSERT [dbo].[Places] ([ID], [Place]) VALUES (2, N'East')
INSERT [dbo].[Places] ([ID], [Place]) VALUES (3, N'West')
INSERT [dbo].[Places] ([ID], [Place]) VALUES (4, N'South')
SET IDENTITY_INSERT [dbo].[Places] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([ID], [roleTitle]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([ID], [roleTitle]) VALUES (2, N'Manager')
INSERT [dbo].[Role] ([ID], [roleTitle]) VALUES (3, N'Worker')
INSERT [dbo].[Role] ([ID], [roleTitle]) VALUES (4, N'User')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Worker] ON 

INSERT [dbo].[Worker] ([ID], [RoleID], [name], [Login], [Password], [Date], [Time], [Entry], [Picture]) VALUES (2, 1, N'Antony', N'root', N'12345', CAST(N'2012-01-01' AS Date), CAST(N'12:00:00' AS Time), 1, N'/Res/Сотрудники_import/Хохлов.jpeg')
INSERT [dbo].[Worker] ([ID], [RoleID], [name], [Login], [Password], [Date], [Time], [Entry], [Picture]) VALUES (3, 2, N'semen', N'roots', N'123456', CAST(N'2023-11-27' AS Date), CAST(N'18:21:20.4306036' AS Time), 1, N'/Res/Сотрудники_import/Иванов.jpeg')
INSERT [dbo].[Worker] ([ID], [RoleID], [name], [Login], [Password], [Date], [Time], [Entry], [Picture]) VALUES (4, 3, N'aaaa', N'aaaaaa', N'aaaaaa', CAST(N'2023-11-27' AS Date), CAST(N'18:24:00.7586035' AS Time), 1, N'/Res/Сотрудники_import/Федоров.jpeg')
INSERT [dbo].[Worker] ([ID], [RoleID], [name], [Login], [Password], [Date], [Time], [Entry], [Picture]) VALUES (13, 4, N'user', N'123456', N'user', CAST(N'2023-11-28' AS Date), CAST(N'18:09:36.4206516' AS Time), 1, N'/Res/Сотрудники_import/Беляева.jpeg')
INSERT [dbo].[Worker] ([ID], [RoleID], [name], [Login], [Password], [Date], [Time], [Entry], [Picture]) VALUES (15, 4, N'aaaaa', N'aaaaa', N'aaaaa', CAST(N'2023-11-28' AS Date), CAST(N'19:33:24.6403496' AS Time), 1, N'/Res/Сотрудники_import/Ширяев.jpeg')
INSERT [dbo].[Worker] ([ID], [RoleID], [name], [Login], [Password], [Date], [Time], [Entry], [Picture]) VALUES (26, 4, N'Matew', N'userr', N'userr', CAST(N'2023-11-29' AS Date), CAST(N'18:39:55.0530842' AS Time), 1, N'/Res/Сотрудники_import/Игнатов.jpg')
INSERT [dbo].[Worker] ([ID], [RoleID], [name], [Login], [Password], [Date], [Time], [Entry], [Picture]) VALUES (27, 4, N'user', N'1234567', N'1234567', CAST(N'2024-03-05' AS Date), CAST(N'13:13:50.6718636' AS Time), 1, N'/Res/Сотрудники_import/Иванов.jpeg')
SET IDENTITY_INSERT [dbo].[Worker] OFF
GO
ALTER TABLE [dbo].[EntryHistory]  WITH CHECK ADD  CONSTRAINT [FK_EntryHistory_Worker] FOREIGN KEY([UserID])
REFERENCES [dbo].[Worker] ([ID])
GO
ALTER TABLE [dbo].[EntryHistory] CHECK CONSTRAINT [FK_EntryHistory_Worker]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Places1] FOREIGN KEY([Place])
REFERENCES [dbo].[Places] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Places1]
GO
ALTER TABLE [dbo].[OrderMerch]  WITH CHECK ADD  CONSTRAINT [FK_OrderMerch_Merch] FOREIGN KEY([MerchID])
REFERENCES [dbo].[Merch] ([ID])
GO
ALTER TABLE [dbo].[OrderMerch] CHECK CONSTRAINT [FK_OrderMerch_Merch]
GO
ALTER TABLE [dbo].[OrderMerch]  WITH CHECK ADD  CONSTRAINT [FK_OrderMerch_Order1] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderMerch] CHECK CONSTRAINT [FK_OrderMerch_Order1]
GO
ALTER TABLE [dbo].[Worker]  WITH CHECK ADD  CONSTRAINT [FK_Worker_EntryType] FOREIGN KEY([Entry])
REFERENCES [dbo].[EntryType] ([ID])
GO
ALTER TABLE [dbo].[Worker] CHECK CONSTRAINT [FK_Worker_EntryType]
GO
ALTER TABLE [dbo].[Worker]  WITH CHECK ADD  CONSTRAINT [FK_Worker_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[Worker] CHECK CONSTRAINT [FK_Worker_Role]
GO
USE [master]
GO
ALTER DATABASE [SoldatovaCRUD] SET  READ_WRITE 
GO
