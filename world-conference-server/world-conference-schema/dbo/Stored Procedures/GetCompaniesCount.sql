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
