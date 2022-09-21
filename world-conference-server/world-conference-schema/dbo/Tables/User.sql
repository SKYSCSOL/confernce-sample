
CREATE TABLE [dbo].[User](
	[UserID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[CompanyID] [int] NULL,
	[LoginID] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nchar](10) NULL,
	[EmailId] [nvarchar](50) NULL,
	[Role] [nchar](10) NULL,
	[Status] [nchar](10) NULL,
	[Created] [datetime] DEFAULT (getdate()),
	[Modified] [datetime] NULL,
	[Accessed] [nchar](10) NULL,
	CONSTRAINT [FK_User_Company] FOREIGN KEY([CompanyID]) REFERENCES [dbo].[Company] ([CompanyID])
)


