CREATE TABLE [dbo].[Company](
	[CompanyID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
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
	[Created] [datetime]  DEFAULT (getdate()),
	[Modified] [datetime] NULL,
	CONSTRAINT [FK_Company_City] FOREIGN KEY([City]) REFERENCES [dbo].[City] ([CityCode]),
	CONSTRAINT [FK_Company_Country] FOREIGN KEY([Country]) REFERENCES [dbo].[Country] ([CountryCode]),
)



