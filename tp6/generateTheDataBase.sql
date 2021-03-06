USE [master]
GO
/****** Object:  Database [OnlineQuiz]    Script Date: 06-May-20 4:03:29 PM ******/
CREATE DATABASE [OnlineQuiz]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineQuiz', FILENAME = N'C:\Users\Moham\AppData\Local\Microsoft\VisualStudio\SSDT\OnlineQuiz.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineQuiz_log', FILENAME = N'C:\Users\Moham\AppData\Local\Microsoft\VisualStudio\SSDT\OnlineQuiz.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [OnlineQuiz] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineQuiz].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineQuiz] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [OnlineQuiz] SET ANSI_NULLS ON 
GO
ALTER DATABASE [OnlineQuiz] SET ANSI_PADDING ON 
GO
ALTER DATABASE [OnlineQuiz] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [OnlineQuiz] SET ARITHABORT ON 
GO
ALTER DATABASE [OnlineQuiz] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineQuiz] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineQuiz] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineQuiz] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineQuiz] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [OnlineQuiz] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [OnlineQuiz] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineQuiz] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [OnlineQuiz] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineQuiz] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineQuiz] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineQuiz] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineQuiz] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineQuiz] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineQuiz] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineQuiz] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineQuiz] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineQuiz] SET RECOVERY FULL 
GO
ALTER DATABASE [OnlineQuiz] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineQuiz] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineQuiz] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineQuiz] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineQuiz] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineQuiz] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OnlineQuiz] SET QUERY_STORE = OFF
GO
USE [OnlineQuiz]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [OnlineQuiz]
GO
/****** Object:  Table [dbo].[person]    Script Date: 06-May-20 4:03:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[person](
	[personID] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [nvarchar](max) NULL,
	[lastName] [nvarchar](max) NULL,
	[email] [nvarchar](800) NULL,
	[password] [nvarchar](max) NULL,
 CONSTRAINT [PK_person] PRIMARY KEY CLUSTERED 
(
	[personID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[question]    Script Date: 06-May-20 4:03:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question](
	[questionID] [int] IDENTITY(1,1) NOT NULL,
	[testID] [int] NULL,
	[questionText] [nvarchar](max) NULL,
	[correctAnswerNumber] [int] NULL,
	[answer0] [nvarchar](max) NULL,
	[answer1] [nvarchar](max) NULL,
	[answer2] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[questionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[result]    Script Date: 06-May-20 4:03:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[result](
	[studentID] [int] NOT NULL,
	[testID] [int] NOT NULL,
 CONSTRAINT [PK_result] PRIMARY KEY CLUSTERED 
(
	[studentID] ASC,
	[testID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[studentAnswer]    Script Date: 06-May-20 4:03:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[studentAnswer](
	[questionID] [int] NOT NULL,
	[studentID] [int] NOT NULL,
	[answerNumber] [int] NULL,
 CONSTRAINT [PK_studentAnswer] PRIMARY KEY CLUSTERED 
(
	[questionID] ASC,
	[studentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test]    Script Date: 06-May-20 4:03:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test](
	[testID] [int] IDENTITY(1001,1) NOT NULL,
	[teacherID] [int] NULL,
	[title] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[testID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[person] ON 

INSERT [dbo].[person] ([personID], [firstName], [lastName], [email], [password]) VALUES (6, N'mohamad', N'abdallah', N'mohamad1031998@gmail.com', N'123456789')
INSERT [dbo].[person] ([personID], [firstName], [lastName], [email], [password]) VALUES (9, N'ibrahim', N'jazzar', N'bob98@gmail.com', N'123456')
INSERT [dbo].[person] ([personID], [firstName], [lastName], [email], [password]) VALUES (1004, N'karim', N'zod', N'kk@htmail.com', N'159')
SET IDENTITY_INSERT [dbo].[person] OFF
GO
SET IDENTITY_INSERT [dbo].[question] ON 

INSERT [dbo].[question] ([questionID], [testID], [questionText], [correctAnswerNumber], [answer0], [answer1], [answer2]) VALUES (1, 1001, N'You''re 3rd place right now in a race. What place are you in when you pass the person in 2nd place?', 1, N'1st', N'2nd', N'3rd')
INSERT [dbo].[question] ([questionID], [testID], [questionText], [correctAnswerNumber], [answer0], [answer1], [answer2]) VALUES (2, 1001, N'How many months have 28 days?', 2, N'2', N'1', N'All of them')
INSERT [dbo].[question] ([questionID], [testID], [questionText], [correctAnswerNumber], [answer0], [answer1], [answer2]) VALUES (3, 1001, N'How many 0.5cm slices of bread can you cut from a whole bread that''s 25cm long?', 0, N'1', N'50', N'None of the above')
INSERT [dbo].[question] ([questionID], [testID], [questionText], [correctAnswerNumber], [answer0], [answer1], [answer2]) VALUES (4, 1001, N'Divide 30 by half and add ten. ', 2, N'I know this is a trick question, so NONE. Ha!', N'12', N'70')
INSERT [dbo].[question] ([questionID], [testID], [questionText], [correctAnswerNumber], [answer0], [answer1], [answer2]) VALUES (5, 1001, N'There are two clocks of different colors: The red clock is broken and doesn''t run at all, but the blue clock loses one second every 24 hours. Which clock is more accurate?', 0, N'The red clock', N'The blue clock', N'Neither')
INSERT [dbo].[question] ([questionID], [testID], [questionText], [correctAnswerNumber], [answer0], [answer1], [answer2]) VALUES (6, 1001, N'A farmer has 17 sheep, all of them but 8 die. How many sheep are still standing?', 0, N'8', N'9', N'Neither')
INSERT [dbo].[question] ([questionID], [testID], [questionText], [correctAnswerNumber], [answer0], [answer1], [answer2]) VALUES (7, 1001, N'If a leaf falls to the ground in a forest and no one hears it, does it make a sound? ', 0, N'Yes', N'No', N'Depends on how heavy the leaf was')
INSERT [dbo].[question] ([questionID], [testID], [questionText], [correctAnswerNumber], [answer0], [answer1], [answer2]) VALUES (8, 1001, N'There are 45 apples in your basket. You take three apples out of the basket. How many apples are left?', 2, N'3', N'42', N'45')
INSERT [dbo].[question] ([questionID], [testID], [questionText], [correctAnswerNumber], [answer0], [answer1], [answer2]) VALUES (1002, 2004, N'1+1=', 1, N'1', N'2', N'3')
INSERT [dbo].[question] ([questionID], [testID], [questionText], [correctAnswerNumber], [answer0], [answer1], [answer2]) VALUES (1003, 2004, N'5*5=?', 2, N'5', N'10', N'25')
INSERT [dbo].[question] ([questionID], [testID], [questionText], [correctAnswerNumber], [answer0], [answer1], [answer2]) VALUES (1004, 2005, N'symbol of water?', 0, N'H2O', N'O2', N'H2')
INSERT [dbo].[question] ([questionID], [testID], [questionText], [correctAnswerNumber], [answer0], [answer1], [answer2]) VALUES (1005, 2005, N'symbol of Oxygen', 2, N'Si', N'O3', N'O2')
SET IDENTITY_INSERT [dbo].[question] OFF
GO
INSERT [dbo].[result] ([studentID], [testID]) VALUES (6, 2004)
INSERT [dbo].[result] ([studentID], [testID]) VALUES (9, 1001)
INSERT [dbo].[result] ([studentID], [testID]) VALUES (9, 2005)
INSERT [dbo].[result] ([studentID], [testID]) VALUES (1004, 2004)
GO
INSERT [dbo].[studentAnswer] ([questionID], [studentID], [answerNumber]) VALUES (1, 9, 1)
INSERT [dbo].[studentAnswer] ([questionID], [studentID], [answerNumber]) VALUES (2, 9, 2)
INSERT [dbo].[studentAnswer] ([questionID], [studentID], [answerNumber]) VALUES (3, 9, 0)
INSERT [dbo].[studentAnswer] ([questionID], [studentID], [answerNumber]) VALUES (4, 9, 2)
INSERT [dbo].[studentAnswer] ([questionID], [studentID], [answerNumber]) VALUES (5, 9, -1)
INSERT [dbo].[studentAnswer] ([questionID], [studentID], [answerNumber]) VALUES (6, 9, -1)
INSERT [dbo].[studentAnswer] ([questionID], [studentID], [answerNumber]) VALUES (7, 9, -1)
INSERT [dbo].[studentAnswer] ([questionID], [studentID], [answerNumber]) VALUES (8, 9, -1)
INSERT [dbo].[studentAnswer] ([questionID], [studentID], [answerNumber]) VALUES (1002, 6, 1)
INSERT [dbo].[studentAnswer] ([questionID], [studentID], [answerNumber]) VALUES (1002, 1004, 1)
INSERT [dbo].[studentAnswer] ([questionID], [studentID], [answerNumber]) VALUES (1003, 6, 1)
INSERT [dbo].[studentAnswer] ([questionID], [studentID], [answerNumber]) VALUES (1003, 1004, 2)
INSERT [dbo].[studentAnswer] ([questionID], [studentID], [answerNumber]) VALUES (1004, 9, -1)
INSERT [dbo].[studentAnswer] ([questionID], [studentID], [answerNumber]) VALUES (1005, 9, -1)
GO
SET IDENTITY_INSERT [dbo].[test] ON 

INSERT [dbo].[test] ([testID], [teacherID], [title]) VALUES (1001, 6, N'Smartness QuiZ')
INSERT [dbo].[test] ([testID], [teacherID], [title]) VALUES (2004, 6, N'Math-Test-Apr')
INSERT [dbo].[test] ([testID], [teacherID], [title]) VALUES (2005, 6, N'Chemistry-Test-May')
SET IDENTITY_INSERT [dbo].[test] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__person__AB6E61642E402109]    Script Date: 06-May-20 4:03:29 PM ******/
ALTER TABLE [dbo].[person] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[getMyQuizByTeacherID]    Script Date: 06-May-20 4:03:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
select test.testID,test.title,result.studentID,person.firstName+' '+person.lastName as name,question.questionID,question.questionText,question.answer0,question.answer1,question.answer2,
question.correctAnswerNumber,studentAnswer.answerNumber,question.correctAnswerNumber-studentAnswer.answerNumber as correct from test
left join result on test.testID=result.testID
left join person on result.studentID=person.personID
left join question on result.testID=question.testID
left join studentAnswer on question.questionID=studentAnswer.questionID
where test.teacherID='6'*/

CREATE PROCEDURE [dbo].[getMyQuizByTeacherID] @TeacherID nvarchar(30)
AS
select test.testID,test.title,result.studentID,person.firstName+' '+person.lastName as name,question.questionID,question.questionText,question.answer0,question.answer1,question.answer2,
question.correctAnswerNumber,studentAnswer.answerNumber,question.correctAnswerNumber-studentAnswer.answerNumber as correct from test
left join result on test.testID=result.testID
left join person on result.studentID=person.personID
left join question on result.testID=question.testID
left join studentAnswer on question.questionID=studentAnswer.questionID and studentAnswer.studentID=result.studentID
WHERE test.teacherID = @TeacherID
GO
/****** Object:  StoredProcedure [dbo].[getQuestionsOfTest]    Script Date: 06-May-20 4:03:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getQuestionsOfTest]
	@testID int
AS
	SELECT * FROM question WHERE testID = @testID
GO
/****** Object:  StoredProcedure [dbo].[getResultByStudentID]    Script Date: 06-May-20 4:03:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*select result.testID,test.title,test.teacherID,person.firstName+' '+person.lastName as name,question.questionID,question.questionText,question.answer0,question.answer1,question.answer2,
question.correctAnswerNumber,studentAnswer.answerNumber,question.correctAnswerNumber-studentAnswer.answerNumber as correct, SUM(CASE WHEN question.correctAnswerNumber-studentAnswer.answerNumber = 0 
                THEN 1 
                ELSE 0 END) AS correctAns  from result
join test on result.testID=test.testID
join person on test.teacherID=person.personID
join question on result.testID=question.testID
join studentAnswer on question.questionID=studentAnswer.questionID
where result.studentID='6'
group by result.testID*/

/*exec getResultByStudentID '6'*/

/*select test.title,SUM(CASE WHEN question.correctAnswerNumber-studentAnswer.answerNumber = 0 
                THEN 1 
                ELSE 0 END)*100/count(question.questionID) AS note  from result
join test on result.testID=test.testID
join person on test.teacherID=person.personID
join question on result.testID=question.testID
join studentAnswer on question.questionID=studentAnswer.questionID
where result.studentID='6'
group by test.title*/

CREATE PROCEDURE [dbo].[getResultByStudentID] @StudentID nvarchar(30)
AS
select test.title,SUM(CASE WHEN question.correctAnswerNumber-studentAnswer.answerNumber = 0 
                THEN 1 
                ELSE 0 END)*100/count(question.questionID) AS note  from result
join test on result.testID=test.testID
join person on test.teacherID=person.personID
join question on result.testID=question.testID
join studentAnswer on question.questionID=studentAnswer.questionID and studentAnswer.studentID=result.studentID
where result.studentID=@StudentID
group by test.title
GO
USE [master]
GO
ALTER DATABASE [OnlineQuiz] SET  READ_WRITE 
GO
