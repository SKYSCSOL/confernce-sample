CREATE TABLE [dbo].[City](
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
	[CountryCode] [nchar](10) NULL,
	[CityCode] [nchar](10) NULL,
	[CityName] [nchar](10) NULL,	
	UNIQUE (CityCode),
	CONSTRAINT [FK_City_Country] FOREIGN KEY([CountryCode])
    REFERENCES [dbo].[Country] ([CountryCode])
	)


