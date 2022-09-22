SET IDENTITY_INSERT [dbo].[Company] ON 
GO
INSERT [dbo].[Company] ([CompanyID], [Name], [TheID], [Address], [City], [Country], [Phone], [EmailId], [Website], [HowComeToKnow], [Others], [Status], [Created], [Modified]) VALUES (1, N'WIN', N'3', N'Mumbai, India', N'BOM ', N'IN', N'9323277214', N'bibhuti@winwebconnect.com', N'www.winwebconnect.com', N'Search Engine', NULL, N'New', CAST(N'2022-09-20T01:29:09.283' AS DateTime), NULL)
GO
INSERT [dbo].[Company] ([CompanyID], [Name], [TheID], [Address], [City], [Country], [Phone], [EmailId], [Website], [HowComeToKnow], [Others], [Status], [Created], [Modified]) VALUES (2, N'WIN', N'2', N'Mumbai, India', N'BOM', N'IN', N'9323277212', N'company1@winwebconnect.com', N'www.comwinwebconnect.com', N'Search Engine', NULL, N'New', CAST(N'2022-09-20T01:29:09.283' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Company] OFF
GO