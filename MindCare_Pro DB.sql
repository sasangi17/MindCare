USE [master]
GO
/****** Object:  Database [MindCare_ProDB]    Script Date: 5/16/2026 11:00:06 AM ******/
CREATE DATABASE [MindCare_ProDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MindCare_ProDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MindCare_ProDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MindCare_ProDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MindCare_ProDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MindCare_ProDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MindCare_ProDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MindCare_ProDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MindCare_ProDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MindCare_ProDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MindCare_ProDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MindCare_ProDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MindCare_ProDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MindCare_ProDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MindCare_ProDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MindCare_ProDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MindCare_ProDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MindCare_ProDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MindCare_ProDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MindCare_ProDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MindCare_ProDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MindCare_ProDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MindCare_ProDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MindCare_ProDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MindCare_ProDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MindCare_ProDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MindCare_ProDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MindCare_ProDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [MindCare_ProDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MindCare_ProDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MindCare_ProDB] SET  MULTI_USER 
GO
ALTER DATABASE [MindCare_ProDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MindCare_ProDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MindCare_ProDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MindCare_ProDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MindCare_ProDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MindCare_ProDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MindCare_ProDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [MindCare_ProDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MindCare_ProDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/16/2026 11:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 5/16/2026 11:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/16/2026 11:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/16/2026 11:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/16/2026 11:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/16/2026 11:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/16/2026 11:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 5/16/2026 11:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssessmentAnswers]    Script Date: 5/16/2026 11:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssessmentAnswers](
	[AnswerId] [int] IDENTITY(1,1) NOT NULL,
	[AssessmentId] [int] NOT NULL,
	[QuestionId] [int] NOT NULL,
	[Score] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assessments]    Script Date: 5/16/2026 11:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assessments](
	[AssessmentId] [int] IDENTITY(1,1) NOT NULL,
	[Id] [nvarchar](450) NOT NULL,
	[TotalScore] [int] NOT NULL,
	[AssessmentDate] [datetime] NULL,
	[DepressionScore] [int] NULL,
	[AnxietyScore] [int] NULL,
	[StressScore] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AssessmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consultations]    Script Date: 5/16/2026 11:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consultations](
	[ConsultationId] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [int] NULL,
	[UserId] [nvarchar](450) NULL,
	[AppointmentDate] [date] NULL,
	[TimeSlot] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Fee] [decimal](10, 2) NULL,
	[Status] [nvarchar](50) NULL,
	[CreatedAt] [datetime] NULL,
	[DoctorName] [nvarchar](200) NULL,
	[PaymentStatus] [nvarchar](100) NULL,
	[Symptoms] [nvarchar](max) NULL,
	[IsCompleted] [bit] NOT NULL,
	[IsCancelled] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ConsultationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 5/16/2026 11:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[DoctorId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Specialization] [nvarchar](100) NULL,
	[Description] [nvarchar](255) NULL,
	[Fee] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 5/16/2026 11:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionText] [nvarchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reminders]    Script Date: 5/16/2026 11:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reminders](
	[ReminderId] [int] IDENTITY(1,1) NOT NULL,
	[Id] [nvarchar](450) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[ReminderDate] [datetime] NOT NULL,
	[IsCompleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReminderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDashboard]    Script Date: 5/16/2026 11:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDashboard](
	[DashboardId] [int] IDENTITY(1,1) NOT NULL,
	[Id] [nvarchar](450) NOT NULL,
	[TotalAssessments] [int] NULL,
	[AverageScore] [float] NULL,
	[TotalReminders] [int] NULL,
	[CompletedReminders] [int] NULL,
	[TotalConsultations] [int] NULL,
	[LastUpdated] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[DashboardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20260326101933_Initial Create', N'8.0.23')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'219d538a-36cc-4f1c-a581-e6665b0d08c5', N'User', N'USER', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'f90611a1-5b7d-4005-a806-b044785c8e0a', N'Admin', N'ADMIN', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e7653a73-00ea-4210-ad3d-3058941192c7', N'f90611a1-5b7d-4005-a806-b044785c8e0a')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'70179c7e-bb4f-4d9b-b9e7-93faf2d3725b', N'Sasangi', N'Samadara', N'sasangip17@gmail.com', N'SASANGIP17@GMAIL.COM', N'sasangip17@gmail.com', N'SASANGIP17@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEM9dBwkfsghwlNpzqObqvtwVh733fCTRzXd42dC8lu8hFXCfHTnKKtRpp01Uqy6i+Q==', N'BAP5TA4HSIDIRWW2WIGSQSV2T3W6DLZC', N'a9933a94-9366-4552-ac14-063876a4928b', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'90384d53-9f91-4314-9725-815ea8b648b6', N'Anna', N'Perera', N'aqisystem2025@gmail.com', N'AQISYSTEM2025@GMAIL.COM', N'aqisystem2025@gmail.com', N'AQISYSTEM2025@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAENHWTeSjGp+EKWtlR94KmWVXlLH0ELfeH4YbEzyMXX580ri8drLbRPIGvCbgUf+MYQ==', N'XX6XHLOBFRYBWIMVHC5BLBCGRQZQEPQS', N'578004b9-1347-49f1-b498-c0c3e0a803b6', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e7653a73-00ea-4210-ad3d-3058941192c7', N'Mind', N'Care', N'MindCareAdmin@admin.com', N'MINDCAREADMIN@ADMIN.COM', N'MindCareAdmin@admin.com', N'MINDCAREADMIN@ADMIN.COM', 0, N'AQAAAAIAAYagAAAAEKY89hE7fLn72qly9JRyLN6C/8lEpM2B4tqQ5hoIobuhWAnU95+UZTDj4fS4dQIcfw==', N'KKZLY4WI3J67X7A7HM3WSEO46XR7UOUP', N'd4852db7-c319-47d6-b69c-5ca642968fde', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Assessments] ON 

INSERT [dbo].[Assessments] ([AssessmentId], [Id], [TotalScore], [AssessmentDate], [DepressionScore], [AnxietyScore], [StressScore]) VALUES (9, N'70179c7e-bb4f-4d9b-b9e7-93faf2d3725b', 25, CAST(N'2026-04-22T12:24:00.023' AS DateTime), 12, 6, 7)
INSERT [dbo].[Assessments] ([AssessmentId], [Id], [TotalScore], [AssessmentDate], [DepressionScore], [AnxietyScore], [StressScore]) VALUES (10, N'70179c7e-bb4f-4d9b-b9e7-93faf2d3725b', 40, CAST(N'2026-04-22T12:47:56.043' AS DateTime), 16, 12, 12)
INSERT [dbo].[Assessments] ([AssessmentId], [Id], [TotalScore], [AssessmentDate], [DepressionScore], [AnxietyScore], [StressScore]) VALUES (11, N'70179c7e-bb4f-4d9b-b9e7-93faf2d3725b', 20, CAST(N'2026-05-02T14:19:03.770' AS DateTime), 10, 5, 5)
INSERT [dbo].[Assessments] ([AssessmentId], [Id], [TotalScore], [AssessmentDate], [DepressionScore], [AnxietyScore], [StressScore]) VALUES (12, N'70179c7e-bb4f-4d9b-b9e7-93faf2d3725b', 23, CAST(N'2026-05-08T13:13:39.870' AS DateTime), 9, 7, 7)
INSERT [dbo].[Assessments] ([AssessmentId], [Id], [TotalScore], [AssessmentDate], [DepressionScore], [AnxietyScore], [StressScore]) VALUES (13, N'90384d53-9f91-4314-9725-815ea8b648b6', 23, CAST(N'2026-05-09T17:54:20.683' AS DateTime), 10, 7, 6)
INSERT [dbo].[Assessments] ([AssessmentId], [Id], [TotalScore], [AssessmentDate], [DepressionScore], [AnxietyScore], [StressScore]) VALUES (14, N'90384d53-9f91-4314-9725-815ea8b648b6', 26, CAST(N'2026-05-09T17:55:03.997' AS DateTime), 10, 7, 9)
INSERT [dbo].[Assessments] ([AssessmentId], [Id], [TotalScore], [AssessmentDate], [DepressionScore], [AnxietyScore], [StressScore]) VALUES (15, N'90384d53-9f91-4314-9725-815ea8b648b6', 32, CAST(N'2026-05-13T15:04:16.480' AS DateTime), 15, 8, 9)
INSERT [dbo].[Assessments] ([AssessmentId], [Id], [TotalScore], [AssessmentDate], [DepressionScore], [AnxietyScore], [StressScore]) VALUES (16, N'70179c7e-bb4f-4d9b-b9e7-93faf2d3725b', 21, CAST(N'2026-05-13T18:16:45.040' AS DateTime), 10, 6, 5)
INSERT [dbo].[Assessments] ([AssessmentId], [Id], [TotalScore], [AssessmentDate], [DepressionScore], [AnxietyScore], [StressScore]) VALUES (17, N'70179c7e-bb4f-4d9b-b9e7-93faf2d3725b', 25, CAST(N'2026-05-13T19:58:21.843' AS DateTime), 10, 7, 8)
INSERT [dbo].[Assessments] ([AssessmentId], [Id], [TotalScore], [AssessmentDate], [DepressionScore], [AnxietyScore], [StressScore]) VALUES (18, N'70179c7e-bb4f-4d9b-b9e7-93faf2d3725b', 16, CAST(N'2026-05-15T21:05:04.563' AS DateTime), 5, 5, 6)
SET IDENTITY_INSERT [dbo].[Assessments] OFF
GO
SET IDENTITY_INSERT [dbo].[Consultations] ON 

INSERT [dbo].[Consultations] ([ConsultationId], [DoctorId], [UserId], [AppointmentDate], [TimeSlot], [Type], [Fee], [Status], [CreatedAt], [DoctorName], [PaymentStatus], [Symptoms], [IsCompleted], [IsCancelled]) VALUES (2, 2, N'70179c7e-bb4f-4d9b-b9e7-93faf2d3725b', CAST(N'2026-09-17' AS Date), N'03:00 PM', N'Video', CAST(0.00 AS Decimal(10, 2)), N'Pending', CAST(N'2026-04-30T16:18:14.800' AS DateTime), N'Dr. Dilini Vidusha', N'Pending', NULL, 0, 0)
INSERT [dbo].[Consultations] ([ConsultationId], [DoctorId], [UserId], [AppointmentDate], [TimeSlot], [Type], [Fee], [Status], [CreatedAt], [DoctorName], [PaymentStatus], [Symptoms], [IsCompleted], [IsCancelled]) VALUES (3, 1, N'70179c7e-bb4f-4d9b-b9e7-93faf2d3725b', CAST(N'2026-04-30' AS Date), N'09:00 AM', N'Video', CAST(0.00 AS Decimal(10, 2)), N'Pending', CAST(N'2026-04-30T16:42:46.270' AS DateTime), N'Dr. Chamara Wijesinghe', N'Pending', NULL, 0, 0)
INSERT [dbo].[Consultations] ([ConsultationId], [DoctorId], [UserId], [AppointmentDate], [TimeSlot], [Type], [Fee], [Status], [CreatedAt], [DoctorName], [PaymentStatus], [Symptoms], [IsCompleted], [IsCancelled]) VALUES (4, 1, N'70179c7e-bb4f-4d9b-b9e7-93faf2d3725b', CAST(N'2026-05-07' AS Date), N'09:00 AM', N'Video', CAST(0.00 AS Decimal(10, 2)), N'Pending', CAST(N'2026-04-30T22:28:14.040' AS DateTime), N'Dr. Chamara Wijesinghe', N'Pending', NULL, 0, 0)
INSERT [dbo].[Consultations] ([ConsultationId], [DoctorId], [UserId], [AppointmentDate], [TimeSlot], [Type], [Fee], [Status], [CreatedAt], [DoctorName], [PaymentStatus], [Symptoms], [IsCompleted], [IsCancelled]) VALUES (6, 10, N'70179c7e-bb4f-4d9b-b9e7-93faf2d3725b', CAST(N'2026-05-20' AS Date), N'10:00 AM', N'Video', CAST(10000.00 AS Decimal(10, 2)), N'Paid', CAST(N'2026-05-01T19:35:49.257' AS DateTime), N'Dr. Renuka Jayasinghe', N'Paid', NULL, 0, 0)
INSERT [dbo].[Consultations] ([ConsultationId], [DoctorId], [UserId], [AppointmentDate], [TimeSlot], [Type], [Fee], [Status], [CreatedAt], [DoctorName], [PaymentStatus], [Symptoms], [IsCompleted], [IsCancelled]) VALUES (7, 7, N'70179c7e-bb4f-4d9b-b9e7-93faf2d3725b', CAST(N'2026-05-21' AS Date), N'10:00 AM', N'Video', CAST(9500.00 AS Decimal(10, 2)), N'Paid', CAST(N'2026-05-01T20:19:17.737' AS DateTime), N'Dr. Jayan Mendis', N'Paid', NULL, 0, 0)
INSERT [dbo].[Consultations] ([ConsultationId], [DoctorId], [UserId], [AppointmentDate], [TimeSlot], [Type], [Fee], [Status], [CreatedAt], [DoctorName], [PaymentStatus], [Symptoms], [IsCompleted], [IsCancelled]) VALUES (9, 8, N'70179c7e-bb4f-4d9b-b9e7-93faf2d3725b', CAST(N'2026-05-28' AS Date), N'10:00 AM', N'Video', CAST(10500.00 AS Decimal(10, 2)), N'Completed', CAST(N'2026-05-07T12:11:08.173' AS DateTime), N'Dr. Lakshini Wikramasinghe', N'Paid', NULL, 1, 0)
INSERT [dbo].[Consultations] ([ConsultationId], [DoctorId], [UserId], [AppointmentDate], [TimeSlot], [Type], [Fee], [Status], [CreatedAt], [DoctorName], [PaymentStatus], [Symptoms], [IsCompleted], [IsCancelled]) VALUES (11, 2, N'70179c7e-bb4f-4d9b-b9e7-93faf2d3725b', CAST(N'2026-05-20' AS Date), N'10:00 AM', N'Video', CAST(10000.00 AS Decimal(10, 2)), N'Paid', CAST(N'2026-05-08T15:05:18.230' AS DateTime), N'Dr. Dilini Vidusha', N'Paid', NULL, 0, 0)
INSERT [dbo].[Consultations] ([ConsultationId], [DoctorId], [UserId], [AppointmentDate], [TimeSlot], [Type], [Fee], [Status], [CreatedAt], [DoctorName], [PaymentStatus], [Symptoms], [IsCompleted], [IsCancelled]) VALUES (14, 9, N'70179c7e-bb4f-4d9b-b9e7-93faf2d3725b', CAST(N'2026-09-16' AS Date), N'03:00 PM', N'Video', CAST(11500.00 AS Decimal(10, 2)), N'Pending', CAST(N'2026-05-09T17:47:51.340' AS DateTime), N'Dr. Nisha Samarasinghe', N'Paid', N'', 0, 0)
INSERT [dbo].[Consultations] ([ConsultationId], [DoctorId], [UserId], [AppointmentDate], [TimeSlot], [Type], [Fee], [Status], [CreatedAt], [DoctorName], [PaymentStatus], [Symptoms], [IsCompleted], [IsCancelled]) VALUES (15, 9, N'90384d53-9f91-4314-9725-815ea8b648b6', CAST(N'2026-09-10' AS Date), N'03:00 PM', N'Video', CAST(11500.00 AS Decimal(10, 2)), N'Pending', CAST(N'2026-05-09T17:56:55.070' AS DateTime), N'Dr. Nisha Samarasinghe', N'Paid', N'', 0, 0)
INSERT [dbo].[Consultations] ([ConsultationId], [DoctorId], [UserId], [AppointmentDate], [TimeSlot], [Type], [Fee], [Status], [CreatedAt], [DoctorName], [PaymentStatus], [Symptoms], [IsCompleted], [IsCancelled]) VALUES (16, 14, N'90384d53-9f91-4314-9725-815ea8b648b6', CAST(N'2026-09-17' AS Date), N'03:00 PM', N'Video', CAST(8000.00 AS Decimal(10, 2)), N'Pending', CAST(N'2026-05-09T18:34:55.053' AS DateTime), N'Dr. Nethma Padmakumara', N'Paid', N'', 0, 0)
INSERT [dbo].[Consultations] ([ConsultationId], [DoctorId], [UserId], [AppointmentDate], [TimeSlot], [Type], [Fee], [Status], [CreatedAt], [DoctorName], [PaymentStatus], [Symptoms], [IsCompleted], [IsCancelled]) VALUES (17, 5, N'90384d53-9f91-4314-9725-815ea8b648b6', CAST(N'2026-08-26' AS Date), N'03:00 PM', N'Video', CAST(13000.00 AS Decimal(10, 2)), N'Pending', CAST(N'2026-05-13T15:06:41.280' AS DateTime), N'Dr. Yasira Doluweera', N'Paid', N'', 0, 0)
SET IDENTITY_INSERT [dbo].[Consultations] OFF
GO
SET IDENTITY_INSERT [dbo].[Doctors] ON 

INSERT [dbo].[Doctors] ([DoctorId], [Name], [Specialization], [Description], [Fee]) VALUES (1, N'Dr. Chamara Wijesinghe', N'Psychiatrist', N'15 years experience - Colombo', CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Doctors] ([DoctorId], [Name], [Specialization], [Description], [Fee]) VALUES (2, N'Dr. Dilini Vidusha', N'Psychiatrist', N'10 years experience - Kandy', CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Doctors] ([DoctorId], [Name], [Specialization], [Description], [Fee]) VALUES (3, N'Dr. Senaka B. Jayasundara', N'Psychiatrist', N'12 years experience - Colombo', CAST(11000.00 AS Decimal(10, 2)))
INSERT [dbo].[Doctors] ([DoctorId], [Name], [Specialization], [Description], [Fee]) VALUES (4, N'Dr. Dasanthi Akmeemana', N'Psychiatrist', N'8 years experience - Kalubowila', CAST(9000.00 AS Decimal(10, 2)))
INSERT [dbo].[Doctors] ([DoctorId], [Name], [Specialization], [Description], [Fee]) VALUES (5, N'Dr. Yasira Doluweera', N'Psychiatrist', N'14 years experience - Maharagama', CAST(13000.00 AS Decimal(10, 2)))
INSERT [dbo].[Doctors] ([DoctorId], [Name], [Specialization], [Description], [Fee]) VALUES (6, N'Dr. Gemunu Rambukwella', N'Psychiatrist', N'16 years experience - Colombo', CAST(14000.00 AS Decimal(10, 2)))
INSERT [dbo].[Doctors] ([DoctorId], [Name], [Specialization], [Description], [Fee]) VALUES (7, N'Dr. Jayan Mendis', N'Psychiatrist', N'9 years experience - Colombo', CAST(9500.00 AS Decimal(10, 2)))
INSERT [dbo].[Doctors] ([DoctorId], [Name], [Specialization], [Description], [Fee]) VALUES (8, N'Dr. Lakshini Wikramasinghe', N'Psychologist', N'11 years experience - Colombo', CAST(10500.00 AS Decimal(10, 2)))
INSERT [dbo].[Doctors] ([DoctorId], [Name], [Specialization], [Description], [Fee]) VALUES (9, N'Dr. Nisha Samarasinghe', N'Psychologist', N'13 years experience - Colombo', CAST(11500.00 AS Decimal(10, 2)))
INSERT [dbo].[Doctors] ([DoctorId], [Name], [Specialization], [Description], [Fee]) VALUES (10, N'Dr. Renuka Jayasinghe', N'Psychologist', N'10 years experience - Colombo', CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Doctors] ([DoctorId], [Name], [Specialization], [Description], [Fee]) VALUES (14, N'Dr. Nethma Padmakumara', N'psychiatric', N'9 years experience -Battaramulla', CAST(8000.00 AS Decimal(10, 2)))
INSERT [dbo].[Doctors] ([DoctorId], [Name], [Specialization], [Description], [Fee]) VALUES (15, N'Dr.Sewmi Gayanji', N'psychiatric', N'7 Years experience - Hambantota ', CAST(10000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Doctors] OFF
GO
SET IDENTITY_INSERT [dbo].[Questions] ON 

INSERT [dbo].[Questions] ([QuestionId], [QuestionText]) VALUES (21, N'I felt I was close to panic')
INSERT [dbo].[Questions] ([QuestionId], [QuestionText]) VALUES (22, N'I found it difficult to work up the initiative to do things')
INSERT [dbo].[Questions] ([QuestionId], [QuestionText]) VALUES (23, N'I felt down-hearted and blue')
INSERT [dbo].[Questions] ([QuestionId], [QuestionText]) VALUES (24, N'I was intolerant of anything that kept me from getting on with what I was doing')
INSERT [dbo].[Questions] ([QuestionId], [QuestionText]) VALUES (25, N'I felt that I had nothing to look forward to')
INSERT [dbo].[Questions] ([QuestionId], [QuestionText]) VALUES (26, N'I felt scared without any good reason')
INSERT [dbo].[Questions] ([QuestionId], [QuestionText]) VALUES (27, N'I tended to overreact to situations')
INSERT [dbo].[Questions] ([QuestionId], [QuestionText]) VALUES (28, N'I was worried about situations in which I might panic')
INSERT [dbo].[Questions] ([QuestionId], [QuestionText]) VALUES (29, N'I found it difficult to relax')
INSERT [dbo].[Questions] ([QuestionId], [QuestionText]) VALUES (30, N'I couldn’t seem to experience any positive feeling at all')
SET IDENTITY_INSERT [dbo].[Questions] OFF
GO
SET IDENTITY_INSERT [dbo].[Reminders] ON 

INSERT [dbo].[Reminders] ([ReminderId], [Id], [Title], [ReminderDate], [IsCompleted]) VALUES (2, N'70179c7e-bb4f-4d9b-b9e7-93faf2d3725b', N'Reading Book', CAST(N'2026-03-30T09:14:00.000' AS DateTime), 1)
INSERT [dbo].[Reminders] ([ReminderId], [Id], [Title], [ReminderDate], [IsCompleted]) VALUES (3, N'70179c7e-bb4f-4d9b-b9e7-93faf2d3725b', N'Yoga', CAST(N'2026-03-31T17:12:00.000' AS DateTime), 1)
INSERT [dbo].[Reminders] ([ReminderId], [Id], [Title], [ReminderDate], [IsCompleted]) VALUES (4, N'70179c7e-bb4f-4d9b-b9e7-93faf2d3725b', N'Yoga', CAST(N'2026-03-30T15:21:00.000' AS DateTime), 1)
INSERT [dbo].[Reminders] ([ReminderId], [Id], [Title], [ReminderDate], [IsCompleted]) VALUES (5, N'70179c7e-bb4f-4d9b-b9e7-93faf2d3725b', N'Go to the Gym', CAST(N'2026-04-07T09:30:00.000' AS DateTime), 1)
INSERT [dbo].[Reminders] ([ReminderId], [Id], [Title], [ReminderDate], [IsCompleted]) VALUES (6, N'70179c7e-bb4f-4d9b-b9e7-93faf2d3725b', N'Yoga', CAST(N'2026-05-13T18:41:00.000' AS DateTime), 1)
INSERT [dbo].[Reminders] ([ReminderId], [Id], [Title], [ReminderDate], [IsCompleted]) VALUES (7, N'70179c7e-bb4f-4d9b-b9e7-93faf2d3725b', N'Reading Book', CAST(N'2026-05-13T19:05:00.000' AS DateTime), 1)
INSERT [dbo].[Reminders] ([ReminderId], [Id], [Title], [ReminderDate], [IsCompleted]) VALUES (8, N'70179c7e-bb4f-4d9b-b9e7-93faf2d3725b', N'Reading Book', CAST(N'2026-05-13T19:08:00.000' AS DateTime), 1)
INSERT [dbo].[Reminders] ([ReminderId], [Id], [Title], [ReminderDate], [IsCompleted]) VALUES (9, N'70179c7e-bb4f-4d9b-b9e7-93faf2d3725b', N'Reading Book', CAST(N'2026-05-14T10:08:00.000' AS DateTime), 1)
INSERT [dbo].[Reminders] ([ReminderId], [Id], [Title], [ReminderDate], [IsCompleted]) VALUES (10, N'70179c7e-bb4f-4d9b-b9e7-93faf2d3725b', N'Yoga', CAST(N'2026-05-14T19:29:00.000' AS DateTime), 1)
INSERT [dbo].[Reminders] ([ReminderId], [Id], [Title], [ReminderDate], [IsCompleted]) VALUES (11, N'70179c7e-bb4f-4d9b-b9e7-93faf2d3725b', N'Yoga', CAST(N'2026-05-14T21:58:00.000' AS DateTime), 1)
INSERT [dbo].[Reminders] ([ReminderId], [Id], [Title], [ReminderDate], [IsCompleted]) VALUES (12, N'70179c7e-bb4f-4d9b-b9e7-93faf2d3725b', N'Drink water', CAST(N'2026-05-21T10:26:00.000' AS DateTime), 0)
INSERT [dbo].[Reminders] ([ReminderId], [Id], [Title], [ReminderDate], [IsCompleted]) VALUES (13, N'70179c7e-bb4f-4d9b-b9e7-93faf2d3725b', N'Meditation', CAST(N'2026-05-14T10:43:00.000' AS DateTime), 1)
INSERT [dbo].[Reminders] ([ReminderId], [Id], [Title], [ReminderDate], [IsCompleted]) VALUES (14, N'70179c7e-bb4f-4d9b-b9e7-93faf2d3725b', N'Yoga', CAST(N'2026-05-20T12:51:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Reminders] OFF
GO
SET IDENTITY_INSERT [dbo].[UserDashboard] ON 

INSERT [dbo].[UserDashboard] ([DashboardId], [Id], [TotalAssessments], [AverageScore], [TotalReminders], [CompletedReminders], [TotalConsultations], [LastUpdated]) VALUES (1, N'70179c7e-bb4f-4d9b-b9e7-93faf2d3725b', 6, 25, 13, 9, 9, CAST(N'2026-05-14T10:51:50.920' AS DateTime))
SET IDENTITY_INSERT [dbo].[UserDashboard] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 5/16/2026 11:00:06 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 5/16/2026 11:00:06 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 5/16/2026 11:00:06 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 5/16/2026 11:00:06 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 5/16/2026 11:00:06 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 5/16/2026 11:00:06 AM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 5/16/2026 11:00:06 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Assessments] ADD  DEFAULT (getdate()) FOR [AssessmentDate]
GO
ALTER TABLE [dbo].[Consultations] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Consultations] ADD  DEFAULT ((0)) FOR [IsCompleted]
GO
ALTER TABLE [dbo].[Consultations] ADD  DEFAULT ((0)) FOR [IsCancelled]
GO
ALTER TABLE [dbo].[Reminders] ADD  DEFAULT ((0)) FOR [IsCompleted]
GO
ALTER TABLE [dbo].[UserDashboard] ADD  DEFAULT ((0)) FOR [TotalAssessments]
GO
ALTER TABLE [dbo].[UserDashboard] ADD  DEFAULT ((0)) FOR [AverageScore]
GO
ALTER TABLE [dbo].[UserDashboard] ADD  DEFAULT ((0)) FOR [TotalReminders]
GO
ALTER TABLE [dbo].[UserDashboard] ADD  DEFAULT ((0)) FOR [CompletedReminders]
GO
ALTER TABLE [dbo].[UserDashboard] ADD  DEFAULT ((0)) FOR [TotalConsultations]
GO
ALTER TABLE [dbo].[UserDashboard] ADD  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AssessmentAnswers]  WITH CHECK ADD FOREIGN KEY([AssessmentId])
REFERENCES [dbo].[Assessments] ([AssessmentId])
GO
ALTER TABLE [dbo].[AssessmentAnswers]  WITH CHECK ADD FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([QuestionId])
GO
ALTER TABLE [dbo].[Assessments]  WITH CHECK ADD  CONSTRAINT [FK_Assessments_User] FOREIGN KEY([Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Assessments] CHECK CONSTRAINT [FK_Assessments_User]
GO
ALTER TABLE [dbo].[Reminders]  WITH CHECK ADD  CONSTRAINT [FK_Reminders_User] FOREIGN KEY([Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Reminders] CHECK CONSTRAINT [FK_Reminders_User]
GO
ALTER TABLE [dbo].[UserDashboard]  WITH CHECK ADD  CONSTRAINT [FK_Dashboard_User] FOREIGN KEY([Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserDashboard] CHECK CONSTRAINT [FK_Dashboard_User]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddAssessment]    Script Date: 5/16/2026 11:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[sp_AddAssessment]
    @Id NVARCHAR(450),
    @TotalScore INT,
    @DepressionScore INT,
    @AnxietyScore INT,
    @StressScore INT
AS
BEGIN
    INSERT INTO Assessments
    (Id, TotalScore, AssessmentDate, DepressionScore, AnxietyScore, StressScore)
    VALUES
    (@Id, @TotalScore, GETDATE(), @DepressionScore, @AnxietyScore, @StressScore)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AddReminder]    Script Date: 5/16/2026 11:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_AddReminder]
    @Id NVARCHAR(450),
    @Title NVARCHAR(200),
    @ReminderDate DATETIME
AS
BEGIN
    INSERT INTO Reminders (Id, Title, ReminderDate)
    VALUES (@Id, @Title, @ReminderDate)

    -- update dashboard automatically
    EXEC dbo.sp_UpdateDashboard @Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAssessmentHistory]    Script Date: 5/16/2026 11:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetAssessmentHistory]
    @Id NVARCHAR(450)
AS
BEGIN
    SELECT 
        AssessmentId,
        TotalScore,
        AssessmentDate
    FROM Assessments
    WHERE Id = @Id
    ORDER BY AssessmentDate DESC
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetDashboard]    Script Date: 5/16/2026 11:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetDashboard]
    @Id NVARCHAR(450)
AS
BEGIN
    SELECT 
        TotalAssessments,
        AverageScore,
        TotalReminders,
        CompletedReminders,
        TotalConsultations
    FROM UserDashboard
    WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateDashboard]    Script Date: 5/16/2026 11:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UpdateDashboard]
    @Id NVARCHAR(450)
AS
BEGIN
    DECLARE @TotalAssessments INT = 0
    DECLARE @AverageScore FLOAT = 0
    DECLARE @TotalReminders INT = 0
    DECLARE @CompletedReminders INT = 0
    DECLARE @TotalConsultations INT = 0

    -- Assessments
    SELECT 
        @TotalAssessments = COUNT(*),
        @AverageScore = ISNULL(AVG(TotalScore), 0)
    FROM Assessments
    WHERE Id = @Id

    -- Reminders
    SELECT 
        @TotalReminders = COUNT(*),
        @CompletedReminders =
            ISNULL(SUM(
                CASE WHEN IsCompleted = 1
                THEN 1 ELSE 0 END),0)
    FROM Reminders
    WHERE Id = @Id

    -- Consultations
    SELECT 
        @TotalConsultations = COUNT(*)
    FROM Consultations
    WHERE UserId = @Id

    -- Insert or Update
    IF EXISTS (
        SELECT 1
        FROM UserDashboard
        WHERE Id = @Id
    )
    BEGIN
        UPDATE UserDashboard
        SET 
            TotalAssessments = @TotalAssessments,
            AverageScore = @AverageScore,
            TotalReminders = @TotalReminders,
            CompletedReminders = @CompletedReminders,
            TotalConsultations = @TotalConsultations,
            LastUpdated = GETDATE()
        WHERE Id = @Id
    END
    ELSE
    BEGIN
        INSERT INTO UserDashboard
        (
            Id,
            TotalAssessments,
            AverageScore,
            TotalReminders,
            CompletedReminders,
            TotalConsultations
        )
        VALUES
        (
            @Id,
            @TotalAssessments,
            @AverageScore,
            @TotalReminders,
            @CompletedReminders,
            @TotalConsultations
        )
    END
END
GO
USE [master]
GO
ALTER DATABASE [MindCare_ProDB] SET  READ_WRITE 
GO
