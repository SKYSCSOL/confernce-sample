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
