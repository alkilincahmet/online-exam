USE [master]
GO
/****** Object:  Database [OnlineExam]    Script Date: 2.1.2014 17:37:37 ******/
CREATE DATABASE [OnlineExam]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'onlineExam', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\onlineExam.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'onlineExam_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\onlineExam_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OnlineExam] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineExam].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineExam] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineExam] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineExam] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineExam] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineExam] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineExam] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineExam] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineExam] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineExam] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineExam] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineExam] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineExam] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineExam] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineExam] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineExam] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineExam] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineExam] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineExam] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineExam] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineExam] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineExam] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineExam] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineExam] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineExam] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OnlineExam] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineExam] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineExam] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineExam] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineExam] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [OnlineExam]
GO
/****** Object:  Table [dbo].[tbl_Categories]    Script Date: 2.1.2014 17:37:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_ExamResult]    Script Date: 2.1.2014 17:37:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ExamResult](
	[ExamResultID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ExamID] [int] NULL,
	[NumberOfCorrect] [int] NULL,
	[NumberOfQuestion] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_ExamResult] PRIMARY KEY CLUSTERED 
(
	[ExamResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Exams]    Script Date: 2.1.2014 17:37:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Exams](
	[ExamID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[CategoryID] [int] NULL,
	[ExamName] [nvarchar](200) NULL,
	[ExamTime] [int] NULL,
	[NumberOfQuestion] [int] NULL,
 CONSTRAINT [PK_tbl_Exams] PRIMARY KEY CLUSTERED 
(
	[ExamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Questions]    Script Date: 2.1.2014 17:37:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Questions](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[ExamID] [int] NULL,
	[UserID] [int] NULL,
	[Question] [nvarchar](max) NULL,
	[Answer1] [nvarchar](2000) NULL,
	[Answer2] [nvarchar](2000) NULL,
	[Answer3] [nvarchar](2000) NULL,
	[Answer4] [nvarchar](2000) NULL,
	[Answer5] [nvarchar](2000) NULL,
	[CorrectAnswer] [char](1) NULL,
	[ImageUrl] [nvarchar](200) NULL,
 CONSTRAINT [PK_tbl_Questions] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Users]    Script Date: 2.1.2014 17:37:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](20) NULL,
	[Password] [nvarchar](20) NULL,
	[FullName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[LastLoginDate] [datetime] NULL,
	[Authory] [int] NULL,
 CONSTRAINT [PK_tbl_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tbl_Categories] ON 

INSERT [dbo].[tbl_Categories] ([CategoryID], [CategoryName]) VALUES (1, N'ASP.NET')
INSERT [dbo].[tbl_Categories] ([CategoryID], [CategoryName]) VALUES (2, N'Tarih')
INSERT [dbo].[tbl_Categories] ([CategoryID], [CategoryName]) VALUES (3, N'Matematik')
INSERT [dbo].[tbl_Categories] ([CategoryID], [CategoryName]) VALUES (4, N'Geometri')
SET IDENTITY_INSERT [dbo].[tbl_Categories] OFF
SET IDENTITY_INSERT [dbo].[tbl_ExamResult] ON 

INSERT [dbo].[tbl_ExamResult] ([ExamResultID], [UserID], [ExamID], [NumberOfCorrect], [NumberOfQuestion], [StartDate], [EndDate]) VALUES (13, 17, 2, 2, 2, CAST(0x0000A29D000F5C36 AS DateTime), CAST(0x0000A29D0010C2F1 AS DateTime))
INSERT [dbo].[tbl_ExamResult] ([ExamResultID], [UserID], [ExamID], [NumberOfCorrect], [NumberOfQuestion], [StartDate], [EndDate]) VALUES (14, 17, 2, 2, 2, CAST(0x0000A29D000F5C36 AS DateTime), CAST(0x0000A29D0011BC30 AS DateTime))
INSERT [dbo].[tbl_ExamResult] ([ExamResultID], [UserID], [ExamID], [NumberOfCorrect], [NumberOfQuestion], [StartDate], [EndDate]) VALUES (15, 17, 2, 2, 2, CAST(0x0000A29D000F5C36 AS DateTime), CAST(0x0000A29D0011CBE0 AS DateTime))
INSERT [dbo].[tbl_ExamResult] ([ExamResultID], [UserID], [ExamID], [NumberOfCorrect], [NumberOfQuestion], [StartDate], [EndDate]) VALUES (16, 17, 2, 2, 2, CAST(0x0000A29D000F5C36 AS DateTime), CAST(0x0000A29D0011DD5F AS DateTime))
INSERT [dbo].[tbl_ExamResult] ([ExamResultID], [UserID], [ExamID], [NumberOfCorrect], [NumberOfQuestion], [StartDate], [EndDate]) VALUES (17, 17, 2, 2, 2, CAST(0x0000A29D000F5C36 AS DateTime), CAST(0x0000A29D0011DF4B AS DateTime))
INSERT [dbo].[tbl_ExamResult] ([ExamResultID], [UserID], [ExamID], [NumberOfCorrect], [NumberOfQuestion], [StartDate], [EndDate]) VALUES (18, 17, 2, 2, 2, CAST(0x0000A29D000F5C36 AS DateTime), CAST(0x0000A29D0011E0D2 AS DateTime))
INSERT [dbo].[tbl_ExamResult] ([ExamResultID], [UserID], [ExamID], [NumberOfCorrect], [NumberOfQuestion], [StartDate], [EndDate]) VALUES (19, 17, 2, 2, 0, CAST(0x0000A29D0013B9C1 AS DateTime), CAST(0x0000A29D0013C00D AS DateTime))
INSERT [dbo].[tbl_ExamResult] ([ExamResultID], [UserID], [ExamID], [NumberOfCorrect], [NumberOfQuestion], [StartDate], [EndDate]) VALUES (20, 17, 2, 2, 0, CAST(0x0000A29D0013B9C1 AS DateTime), CAST(0x0000A29D0013DBE2 AS DateTime))
INSERT [dbo].[tbl_ExamResult] ([ExamResultID], [UserID], [ExamID], [NumberOfCorrect], [NumberOfQuestion], [StartDate], [EndDate]) VALUES (21, 17, 2, 2, 2, CAST(0x0000A29D00156542 AS DateTime), CAST(0x0000A29D00156AAF AS DateTime))
INSERT [dbo].[tbl_ExamResult] ([ExamResultID], [UserID], [ExamID], [NumberOfCorrect], [NumberOfQuestion], [StartDate], [EndDate]) VALUES (22, 17, 2, 2, 2, CAST(0x0000A29D00156542 AS DateTime), CAST(0x0000A29D00177069 AS DateTime))
INSERT [dbo].[tbl_ExamResult] ([ExamResultID], [UserID], [ExamID], [NumberOfCorrect], [NumberOfQuestion], [StartDate], [EndDate]) VALUES (23, 17, 2, 2, 2, CAST(0x0000A29D00156542 AS DateTime), CAST(0x0000A29D00184EBA AS DateTime))
INSERT [dbo].[tbl_ExamResult] ([ExamResultID], [UserID], [ExamID], [NumberOfCorrect], [NumberOfQuestion], [StartDate], [EndDate]) VALUES (24, 17, 2, 2, 0, CAST(0x0000A29D0018D0BB AS DateTime), CAST(0x0000A29D0018D678 AS DateTime))
INSERT [dbo].[tbl_ExamResult] ([ExamResultID], [UserID], [ExamID], [NumberOfCorrect], [NumberOfQuestion], [StartDate], [EndDate]) VALUES (25, 17, 2, 5, 2, CAST(0x0000A29D001A730E AS DateTime), CAST(0x0000A29D001AABA7 AS DateTime))
INSERT [dbo].[tbl_ExamResult] ([ExamResultID], [UserID], [ExamID], [NumberOfCorrect], [NumberOfQuestion], [StartDate], [EndDate]) VALUES (26, 17, 2, 5, 2, CAST(0x0000A29D001A730E AS DateTime), CAST(0x0000A29D001AEF0B AS DateTime))
INSERT [dbo].[tbl_ExamResult] ([ExamResultID], [UserID], [ExamID], [NumberOfCorrect], [NumberOfQuestion], [StartDate], [EndDate]) VALUES (27, 17, 2, 5, 3, CAST(0x0000A29D001B0F51 AS DateTime), CAST(0x0000A29D001BAB66 AS DateTime))
INSERT [dbo].[tbl_ExamResult] ([ExamResultID], [UserID], [ExamID], [NumberOfCorrect], [NumberOfQuestion], [StartDate], [EndDate]) VALUES (28, 17, 2, 5, 3, CAST(0x0000A29D001B0F51 AS DateTime), CAST(0x0000A29D001BFA38 AS DateTime))
INSERT [dbo].[tbl_ExamResult] ([ExamResultID], [UserID], [ExamID], [NumberOfCorrect], [NumberOfQuestion], [StartDate], [EndDate]) VALUES (29, 17, 2, 5, 3, CAST(0x0000A29D001B0F51 AS DateTime), CAST(0x0000A29D001C0161 AS DateTime))
INSERT [dbo].[tbl_ExamResult] ([ExamResultID], [UserID], [ExamID], [NumberOfCorrect], [NumberOfQuestion], [StartDate], [EndDate]) VALUES (30, 17, 2, 5, 0, CAST(0x0000A2A601449E35 AS DateTime), CAST(0x0000A2A60144AAA2 AS DateTime))
INSERT [dbo].[tbl_ExamResult] ([ExamResultID], [UserID], [ExamID], [NumberOfCorrect], [NumberOfQuestion], [StartDate], [EndDate]) VALUES (31, 17, 2, 5, 0, CAST(0x0000A2A601449E35 AS DateTime), CAST(0x0000A2A60145A20F AS DateTime))
INSERT [dbo].[tbl_ExamResult] ([ExamResultID], [UserID], [ExamID], [NumberOfCorrect], [NumberOfQuestion], [StartDate], [EndDate]) VALUES (32, 17, 4, 1, 1, CAST(0x0000A2A70000CE65 AS DateTime), CAST(0x0000A2A70000D2F8 AS DateTime))
INSERT [dbo].[tbl_ExamResult] ([ExamResultID], [UserID], [ExamID], [NumberOfCorrect], [NumberOfQuestion], [StartDate], [EndDate]) VALUES (33, 17, 2, 5, 2, CAST(0x0000A2A70001BF44 AS DateTime), CAST(0x0000A2A70001CCD7 AS DateTime))
INSERT [dbo].[tbl_ExamResult] ([ExamResultID], [UserID], [ExamID], [NumberOfCorrect], [NumberOfQuestion], [StartDate], [EndDate]) VALUES (34, 17, 2, 5, 2, CAST(0x0000A2A70001BF44 AS DateTime), CAST(0x0000A2A700023531 AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_ExamResult] OFF
SET IDENTITY_INSERT [dbo].[tbl_Exams] ON 

INSERT [dbo].[tbl_Exams] ([ExamID], [UserID], [CategoryID], [ExamName], [ExamTime], [NumberOfQuestion]) VALUES (2, 2, 1, N'Asp', 5, 5)
INSERT [dbo].[tbl_Exams] ([ExamID], [UserID], [CategoryID], [ExamName], [ExamTime], [NumberOfQuestion]) VALUES (3, 2, 2, N'Osmanlı', 10, 10)
INSERT [dbo].[tbl_Exams] ([ExamID], [UserID], [CategoryID], [ExamName], [ExamTime], [NumberOfQuestion]) VALUES (4, 2, 4, N'Açılar', 10, 10)
SET IDENTITY_INSERT [dbo].[tbl_Exams] OFF
SET IDENTITY_INSERT [dbo].[tbl_Questions] ON 

INSERT [dbo].[tbl_Questions] ([QuestionID], [ExamID], [UserID], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [Answer5], [CorrectAnswer], [ImageUrl]) VALUES (1, 2, 2, N'How do you make namespace available to ASP.NET page?', N'imports statement', N'import directive', N'using directive', N'None of the above', N'None of Them', N'2', NULL)
INSERT [dbo].[tbl_Questions] ([QuestionID], [ExamID], [UserID], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [Answer5], [CorrectAnswer], [ImageUrl]) VALUES (2, 2, 2, N'Which method ends session', N'session.end', N'response.end', N'session.abandon', N'request.end', N'None of Them', N'3', NULL)
INSERT [dbo].[tbl_Questions] ([QuestionID], [ExamID], [UserID], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [Answer5], [CorrectAnswer], [ImageUrl]) VALUES (3, 2, 2, N'How do you execute a page and return control to calling page', N'server.transfer', N'request.execute', N'server.execute', N'response.redirect', N'None of Them', N'3', N'Images/QuestionImage/10enbhc3b3d.jpg')
INSERT [dbo].[tbl_Questions] ([QuestionID], [ExamID], [UserID], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [Answer5], [CorrectAnswer], [ImageUrl]) VALUES (4, 2, 2, N'What is a persistent cookie?', N'One that is stored on the client even after session ended', N'One that is stored on the server', N'One that is stored both on server and client', N'One whose value cannot be changed', N'None of Them', N'1', NULL)
INSERT [dbo].[tbl_Questions] ([QuestionID], [ExamID], [UserID], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [Answer5], [CorrectAnswer], [ImageUrl]) VALUES (5, 2, 2, N'If a query returns only one value then which of the following is an appropriate method of SQLCommand?', N'Execute', N'ExecuteReader', N'ExecuteScalar', N'ExecuteValue', N'None of Them', N'3', NULL)
INSERT [dbo].[tbl_Questions] ([QuestionID], [ExamID], [UserID], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [Answer5], [CorrectAnswer], [ImageUrl]) VALUES (6, 4, 2, N'a', N'a', N'a', N'a', N'a', N'a', N'1', N'Images/QuestionImage/10enbhc3b3d.jpg')
SET IDENTITY_INSERT [dbo].[tbl_Questions] OFF
SET IDENTITY_INSERT [dbo].[tbl_Users] ON 

INSERT [dbo].[tbl_Users] ([UserID], [UserName], [Password], [FullName], [Email], [LastLoginDate], [Authory]) VALUES (1, N'admin', N'admin', N'ADMIN', N'admin', CAST(0x0000A29C017D173A AS DateTime), 0)
INSERT [dbo].[tbl_Users] ([UserID], [UserName], [Password], [FullName], [Email], [LastLoginDate], [Authory]) VALUES (2, N't', N't', N'Teacher', N'a', CAST(0x0000A2A60174895B AS DateTime), 1)
INSERT [dbo].[tbl_Users] ([UserID], [UserName], [Password], [FullName], [Email], [LastLoginDate], [Authory]) VALUES (17, N's', N's', N'Student', N's', CAST(0x0000A2A70000C925 AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[tbl_Users] OFF
ALTER TABLE [dbo].[tbl_ExamResult]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ExamResult_tbl_Exams1] FOREIGN KEY([ExamID])
REFERENCES [dbo].[tbl_Exams] ([ExamID])
GO
ALTER TABLE [dbo].[tbl_ExamResult] CHECK CONSTRAINT [FK_tbl_ExamResult_tbl_Exams1]
GO
ALTER TABLE [dbo].[tbl_ExamResult]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ExamResult_tbl_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[tbl_Users] ([UserID])
GO
ALTER TABLE [dbo].[tbl_ExamResult] CHECK CONSTRAINT [FK_tbl_ExamResult_tbl_Users]
GO
ALTER TABLE [dbo].[tbl_Exams]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Exams_tbl_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[tbl_Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[tbl_Exams] CHECK CONSTRAINT [FK_tbl_Exams_tbl_Categories]
GO
ALTER TABLE [dbo].[tbl_Questions]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Questions_tbl_Exams] FOREIGN KEY([ExamID])
REFERENCES [dbo].[tbl_Exams] ([ExamID])
GO
ALTER TABLE [dbo].[tbl_Questions] CHECK CONSTRAINT [FK_tbl_Questions_tbl_Exams]
GO
ALTER TABLE [dbo].[tbl_Questions]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Questions_tbl_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[tbl_Users] ([UserID])
GO
ALTER TABLE [dbo].[tbl_Questions] CHECK CONSTRAINT [FK_tbl_Questions_tbl_Users]
GO
USE [master]
GO
ALTER DATABASE [OnlineExam] SET  READ_WRITE 
GO
