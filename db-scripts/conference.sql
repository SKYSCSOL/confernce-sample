USE [master]
GO
/****** Object:  Database [conference]    Script Date: 27-09-2022 18:54:15 ******/
CREATE DATABASE [conference]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'conference', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\conference_Primary.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'conference_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\conference_Primary.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [conference] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [conference].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [conference] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [conference] SET ANSI_NULLS ON 
GO
ALTER DATABASE [conference] SET ANSI_PADDING ON 
GO
ALTER DATABASE [conference] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [conference] SET ARITHABORT ON 
GO
ALTER DATABASE [conference] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [conference] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [conference] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [conference] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [conference] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [conference] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [conference] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [conference] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [conference] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [conference] SET  DISABLE_BROKER 
GO
ALTER DATABASE [conference] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [conference] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [conference] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [conference] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [conference] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [conference] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [conference] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [conference] SET RECOVERY FULL 
GO
ALTER DATABASE [conference] SET  MULTI_USER 
GO
ALTER DATABASE [conference] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [conference] SET DB_CHAINING OFF 
GO
ALTER DATABASE [conference] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [conference] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [conference] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [conference] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'conference', N'ON'
GO
ALTER DATABASE [conference] SET QUERY_STORE = OFF
GO
USE [conference]
GO
/****** Object:  Table [dbo].[City]    Script Date: 27-09-2022 18:54:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CountryCode] [nchar](10) NULL,
	[CityCode] [nchar](10) NULL,
	[CityName] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 27-09-2022 18:54:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](10) NULL,
	[TheID] [nchar](10) NULL,
	[Address] [nvarchar](256) NULL,
	[City] [nchar](10) NULL,
	[Country] [nchar](10) NULL,
	[Phone] [nchar](10) NULL,
	[EmailId] [nvarchar](256) NULL,
	[Website] [nvarchar](256) NULL,
	[HowComeToKnow] [nvarchar](256) NULL,
	[Others] [nvarchar](256) NULL,
	[Status] [nchar](10) NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 27-09-2022 18:54:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RegionCode] [nchar](10) NULL,
	[CountryCode] [nchar](10) NULL,
	[CountryName] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 27-09-2022 18:54:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NULL,
	[LoginID] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nchar](10) NULL,
	[EmailId] [nvarchar](50) NULL,
	[Role] [nchar](10) NULL,
	[Status] [nchar](10) NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[Accessed] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[City] ON 
GO
INSERT [dbo].[City] ([Id], [CountryCode], [CityCode], [CityName]) VALUES (1, N'IN        ', N'BOM       ', N'Mumbai    ')
GO
INSERT [dbo].[City] ([Id], [CountryCode], [CityCode], [CityName]) VALUES (2, N'NP        ', N'KH        ', N'Kathmandu ')
GO
INSERT [dbo].[City] ([Id], [CountryCode], [CityCode], [CityName]) VALUES (3, N'IN        ', N'AH        ', N'Ahmednagar')
GO
INSERT [dbo].[City] ([Id], [CountryCode], [CityCode], [CityName]) VALUES (4, N'IN        ', N'NP        ', N'Nagpur    ')
GO
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Company] ON 
GO
INSERT [dbo].[Company] ([CompanyID], [Name], [TheID], [Address], [City], [Country], [Phone], [EmailId], [Website], [HowComeToKnow], [Others], [Status], [Created], [Modified]) VALUES (1, N'WIN1      ', N'3         ', N'Mumbai, India1', N'BOM       ', N'IN        ', N'9323277214', N'bibhuti@winwebconnect.com', N'www.winwebconnect.com', N'Search Engine', NULL, N'New       ', CAST(N'2022-09-20T01:29:09.283' AS DateTime), NULL)
GO
INSERT [dbo].[Company] ([CompanyID], [Name], [TheID], [Address], [City], [Country], [Phone], [EmailId], [Website], [HowComeToKnow], [Others], [Status], [Created], [Modified]) VALUES (2, N'WIN2      ', N'2         ', N'Mumbai, India2', N'BOM       ', N'IN        ', N'9323277212', N'company1@winwebconnect.com', N'www.comwinwebconnect.com', N'Search Engine', NULL, N'New       ', CAST(N'2022-09-20T01:29:09.283' AS DateTime), NULL)
GO
INSERT [dbo].[Company] ([CompanyID], [Name], [TheID], [Address], [City], [Country], [Phone], [EmailId], [Website], [HowComeToKnow], [Others], [Status], [Created], [Modified]) VALUES (3, N'WIN3      ', N'3         ', N'Mumbai, India3', N'BOM       ', N'IN        ', N'9323277214', N'bibhuti@winwebconnect.com', N'www.winwebconnect.com', N'Search Engine', NULL, N'New       ', CAST(N'2022-09-20T01:29:09.283' AS DateTime), NULL)
GO
INSERT [dbo].[Company] ([CompanyID], [Name], [TheID], [Address], [City], [Country], [Phone], [EmailId], [Website], [HowComeToKnow], [Others], [Status], [Created], [Modified]) VALUES (4, N'WIN4      ', N'2         ', N'Mumbai, India4', N'BOM       ', N'NP        ', N'9323277212', N'company1@winwebconnect.com', N'www.comwinwebconnect.com', N'Search Engine', NULL, N'New       ', CAST(N'2022-09-20T01:29:09.283' AS DateTime), NULL)
GO
INSERT [dbo].[Company] ([CompanyID], [Name], [TheID], [Address], [City], [Country], [Phone], [EmailId], [Website], [HowComeToKnow], [Others], [Status], [Created], [Modified]) VALUES (5, N'WIN5      ', N'3         ', N'Mumbai, India5', N'BOM       ', N'NP        ', N'9323277214', N'bibhuti@winwebconnect.com', N'www.winwebconnect.com', N'Search Engine', NULL, N'New       ', CAST(N'2022-09-20T01:29:09.283' AS DateTime), NULL)
GO
INSERT [dbo].[Company] ([CompanyID], [Name], [TheID], [Address], [City], [Country], [Phone], [EmailId], [Website], [HowComeToKnow], [Others], [Status], [Created], [Modified]) VALUES (6, N'WIN6      ', N'2         ', N'Mumbai, India6', N'BOM       ', N'NP        ', N'9323277212', N'company1@winwebconnect.com', N'www.comwinwebconnect.com', N'Search Engine', NULL, N'New       ', CAST(N'2022-09-20T01:29:09.283' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Company] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 
GO
INSERT [dbo].[Country] ([Id], [RegionCode], [CountryCode], [CountryName]) VALUES (1, N'AS        ', N'IN        ', N'INDIA     ')
GO
INSERT [dbo].[Country] ([Id], [RegionCode], [CountryCode], [CountryName]) VALUES (3, N'AS        ', N'NP        ', N'NEPAL     ')
GO
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([UserID], [CompanyID], [LoginID], [Password], [Name], [Phone], [EmailId], [Role], [Status], [Created], [Modified], [Accessed]) VALUES (1, 1, N'bibhuti@winwebconnect.com', NULL, N'Bibhuti Bibhaker1', N'9323277214', N'bibhuti@winwebconnect.com', N'SuperAdmin', N'Active    ', CAST(N'2022-09-20T01:31:16.093' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([UserID], [CompanyID], [LoginID], [Password], [Name], [Phone], [EmailId], [Role], [Status], [Created], [Modified], [Accessed]) VALUES (2, 1, N'kumary@winwebconnect.com', NULL, N'Kumar', N'9323277214', N'bibhuti@winwebconnect.com', N'SuperAdmin', N'Active    ', CAST(N'2022-09-20T01:31:16.093' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([UserID], [CompanyID], [LoginID], [Password], [Name], [Phone], [EmailId], [Role], [Status], [Created], [Modified], [Accessed]) VALUES (3, 1, N'bibhuti@winwebconnect.com', NULL, N'Bibhuti Bibhaker2', N'9323277214', N'bibhuti@winwebconnect.com', N'SuperAdmin', N'Active    ', CAST(N'2022-09-20T01:31:16.093' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([UserID], [CompanyID], [LoginID], [Password], [Name], [Phone], [EmailId], [Role], [Status], [Created], [Modified], [Accessed]) VALUES (4, 3, N'kumary@winwebconnect.com', NULL, N'Kumar Y2', N'9323277214', N'bibhuti@winwebconnect.com', N'SuperAdmin', N'Active    ', CAST(N'2022-09-20T01:31:16.093' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([UserID], [CompanyID], [LoginID], [Password], [Name], [Phone], [EmailId], [Role], [Status], [Created], [Modified], [Accessed]) VALUES (5, 3, N'bibhuti@winwebconnect.com', NULL, N'Bibhuti Bibhaker3', N'9323277214', N'bibhuti@winwebconnect.com', N'SuperAdmin', N'Active    ', CAST(N'2022-09-20T01:31:16.093' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([UserID], [CompanyID], [LoginID], [Password], [Name], [Phone], [EmailId], [Role], [Status], [Created], [Modified], [Accessed]) VALUES (6, 2, N'kumary@winwebconnect.com', NULL, N'Kumar Y3', N'9323277214', N'bibhuti@winwebconnect.com', N'SuperAdmin', N'Active    ', CAST(N'2022-09-20T01:31:16.093' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__City__B488218C253B3BE4]    Script Date: 27-09-2022 18:54:22 ******/
ALTER TABLE [dbo].[City] ADD UNIQUE NONCLUSTERED 
(
	[CityCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Country__5D9B0D2CE900573A]    Script Date: 27-09-2022 18:54:22 ******/
ALTER TABLE [dbo].[Country] ADD UNIQUE NONCLUSTERED 
(
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Company] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([CountryCode])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Country]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_City] FOREIGN KEY([City])
REFERENCES [dbo].[City] ([CityCode])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_City]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_Country] FOREIGN KEY([Country])
REFERENCES [dbo].[Country] ([CountryCode])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_Country]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Company]
GO
/****** Object:  StoredProcedure [dbo].[CompanySearch]    Script Date: 27-09-2022 18:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- exec CompanySearch  1,5, null, 'IN', 'Mumbai', null
-- =============================================
CREATE PROCEDURE [dbo].[CompanySearch]
@PageNo INT = 0,  --@Page int,
@PageSize INT =0, --@RecsPerPage  int,
@SortOrder VARCHAR(200)= '',
@CountryCode NVARCHAR(100) = '',
@CityName NVARCHAR(100) = '',
@UserName NVARCHAR(1000) = ''
AS
  BEGIN
	-- The number of rows affected by the different commands
	-- does not interest the application, so turn NOCOUNT ON
SET NOCOUNT ON


-- Determine the first record and last record 
DECLARE @FirstRec int, @LastRec int

SELECT @FirstRec = (@PageNo - 1) * @PageSize
SELECT @LastRec = (@PageNo * @PageSize + 1);

BEGIN TRY

WITH TempResult as
(
SELECT  DISTINCT
Company.CompanyID  as RowNum,
LTRIM(RTRIM(Country.CountryCode)) AS CountryCode, LTRIM(RTRIM(City.CityName)) AS CityName, 
LTRIM(RTRIM([Company].[Name])) AS CompanyName
FROM            City INNER JOIN
                         Company ON City.CityCode = Company.City INNER JOIN
                         Country ON City.CountryCode = Country.CountryCode AND Company.Country = Country.CountryCode INNER JOIN
                         [User] ON Company.CompanyID = [User].CompanyID

      WHERE
             [City].[CountryCode] LIKE '%'+ ISNULL(@CountryCode, '') + '%'
              AND[City].[CityName] LIKE '%' + ISNULL(@CityName, '') + '%'
			  AND [User].[Name] LIKE '%' + ISNULL(@UserName, '') + '%'
			  group by Company.CompanyID,[Company].[Name],[User].[Name],Country.CountryCode,City.CityName,
						 [User].EmailId,[User].UserID
)

SELECT top (@LastRec-1) *
FROM TempResult
WHERE RowNum > @FirstRec 
AND RowNum < @LastRec

-- Turn NOCOUNT back OFF
SET NOCOUNT OFF

    END TRY
    BEGIN CATCH
      RETURN 'Erorr occured in the serch.'
    END CATCH
    RETURN 0
  END
GO
/****** Object:  StoredProcedure [dbo].[GetCompaniesCount]    Script Date: 27-09-2022 18:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCompaniesCount]
@CountryCode NVARCHAR(100) = '',
@CityName NVARCHAR(100) = '',
@UserName NVARCHAR(1000) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT COUNT(DISTINCT Company.[Name]) AS CompaniesCount
	FROM            City INNER JOIN
							 Company ON City.CityCode = Company.City INNER JOIN
							 Country ON City.CountryCode = Country.CountryCode AND Company.Country = Country.CountryCode INNER JOIN
							 [User] ON Company.CompanyID = [User].CompanyID							
		  WHERE
				 [City].[CountryCode] LIKE '%'+ ISNULL(@CountryCode, '') + '%'
				  AND[City].[CityName] LIKE '%' + ISNULL(@CityName, '') + '%'
				  AND [User].[Name] LIKE '%' + ISNULL(@UserName, '') + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserByCompany]    Script Date: 27-09-2022 18:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- GetUserByCompany 'WIN1'
-- =============================================
CREATE PROCEDURE [dbo].[GetUserByCompany]
	@CompanyName NVARCHAR(50),
	@UserName NVARCHAR(1000) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

(SELECT [User].*
FROM            City INNER JOIN
                         Company ON City.CityCode = Company.City INNER JOIN
                         Country ON City.CountryCode = Country.CountryCode AND Company.Country = Country.CountryCode INNER JOIN
                         [User] ON Company.CompanyID = [User].CompanyID

      WHERE [Company].[Name] LIKE '%' + ISNULL(@CompanyName, '') + '%'
	  AND [User].[Name] LIKE '%' + ISNULL(@UserName, '') + '%'
			 
)
END
GO
USE [master]
GO
ALTER DATABASE [conference] SET  READ_WRITE 
GO
