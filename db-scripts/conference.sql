USE [conference]
GO
/****** Object:  Table [dbo].[City]    Script Date: 22-09-2022 16:26:20 ******/
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
/****** Object:  Table [dbo].[Company]    Script Date: 22-09-2022 16:26:20 ******/
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
/****** Object:  Table [dbo].[Country]    Script Date: 22-09-2022 16:26:20 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 22-09-2022 16:26:20 ******/
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
INSERT [dbo].[City] ([Id], [CountryCode], [CityCode], [CityName]) VALUES (1, N'IN', N'BOM', N'Mumbai')
GO
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Company] ON 
GO
INSERT [dbo].[Company] ([CompanyID], [Name], [TheID], [Address], [City], [Country], [Phone], [EmailId], [Website], [HowComeToKnow], [Others], [Status], [Created], [Modified]) VALUES (1, N'WIN       ', N'3         ', N'Mumbai, India', N'BOM       ', N'IN        ', N'9323277214', N'bibhuti@winwebconnect.com', N'www.winwebconnect.com', N'Search Engine', NULL, N'New       ', CAST(N'2022-09-20T01:29:09.283' AS DateTime), NULL)
GO
INSERT [dbo].[Company] ([CompanyID], [Name], [TheID], [Address], [City], [Country], [Phone], [EmailId], [Website], [HowComeToKnow], [Others], [Status], [Created], [Modified]) VALUES (2, N'WIN       ', N'2         ', N'Mumbai, India', N'BOM       ', N'IN        ', N'9323277212', N'company1@winwebconnect.com', N'www.comwinwebconnect.com', N'Search Engine', NULL, N'New       ', CAST(N'2022-09-20T01:29:09.283' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Company] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 
GO
INSERT [dbo].[Country] ([Id], [RegionCode], [CountryCode], [CountryName]) VALUES (1, N'AS', N'IN', N'INDIA')
GO
INSERT [dbo].[Country] ([Id], [RegionCode], [CountryCode], [CountryName]) VALUES (3, N'AS', N'NP', N'NEPAL')
GO
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([UserID], [CompanyID], [LoginID], [Password], [Name], [Phone], [EmailId], [Role], [Status], [Created], [Modified], [Accessed]) VALUES (1, 1, N'bibhuti@winwebconnect.com', NULL, N'Bibhuti Bibhaker', N'9323277214', N'bibhuti@winwebconnect.com', N'SuperAdmin', N'Active    ', CAST(N'2022-09-20T01:31:16.093' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([UserID], [CompanyID], [LoginID], [Password], [Name], [Phone], [EmailId], [Role], [Status], [Created], [Modified], [Accessed]) VALUES (2, 2, N'kumary@winwebconnect.com', NULL, N'Kumar Y', N'9323277214', N'bibhuti@winwebconnect.com', N'SuperAdmin', N'Active    ', CAST(N'2022-09-20T01:31:16.093' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__City__B488218C253B3BE4]    Script Date: 22-09-2022 16:26:21 ******/
ALTER TABLE [dbo].[City] ADD UNIQUE NONCLUSTERED 
(
	[CityCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Country__5D9B0D2CE900573A]    Script Date: 22-09-2022 16:26:21 ******/
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
