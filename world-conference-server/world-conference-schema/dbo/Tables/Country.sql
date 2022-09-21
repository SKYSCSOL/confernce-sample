
CREATE TABLE [dbo].[Country](
	[Id] [int] NOT NULL PRIMARY KEY IDENTITY(1,1),
	[RegionCode] [nchar](10) NULL,
	[CountryCode] [nchar](10) NULL,
	[CountryName] [nchar](10) NULL,
	UNIQUE (CountryCode)
)


