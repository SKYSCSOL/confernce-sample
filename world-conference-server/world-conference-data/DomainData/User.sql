SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([UserID], [CompanyID], [LoginID], [Password], [Name], [Phone], [EmailId], [Role], [Status], [Created], [Modified], [Accessed]) VALUES (1, 1, N'bibhuti@winwebconnect.com', NULL, N'Bibhuti Bibhaker', N'9323277214', N'bibhuti@winwebconnect.com', N'SuperAdmin', N'Active', CAST(N'2022-09-20T01:31:16.093' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[User] ([UserID], [CompanyID], [LoginID], [Password], [Name], [Phone], [EmailId], [Role], [Status], [Created], [Modified], [Accessed]) VALUES (2, 2, N'kumary@winwebconnect.com', NULL, N'Kumar Y', N'9323277214', N'bibhuti@winwebconnect.com', N'SuperAdmin', N'Active', CAST(N'2022-09-20T01:31:16.093' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO