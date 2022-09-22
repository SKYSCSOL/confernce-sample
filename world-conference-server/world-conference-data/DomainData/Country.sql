SET IDENTITY_INSERT [dbo].[Country] ON 
GO
INSERT [dbo].[Country] ([Id], [RegionCode], [CountryCode], [CountryName]) VALUES (1, N'AS', N'IN', N'INDIA')
GO
INSERT [dbo].[Country] ([Id], [RegionCode], [CountryCode], [CountryName]) VALUES (3, N'AS', N'NP', N'NEPAL')
GO
SET IDENTITY_INSERT [dbo].[Country] OFF