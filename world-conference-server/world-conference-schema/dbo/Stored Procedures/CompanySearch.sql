
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- exec CompanySearch  1,5, null, 'IN', 'Mumbai', null
-- =============================================
CREATE PROCEDURE [dbo].[CompanySearch]
@PageNo INT = 0,  --@Page int,
@PageSize INT =0, --@RecsPerPage  int,
@SortOrder VARCHAR(200)= '',
@CountryCode NVARCHAR(100) = '',
@CityName NVARCHAR(100) = '',
@UserName NVARCHAR(1000) = ''
AS
  BEGIN
	-- The number of rows affected by the different commands
	-- does not interest the application, so turn NOCOUNT ON
SET NOCOUNT ON


-- Determine the first record and last record 
DECLARE @FirstRec int, @LastRec int

SELECT @FirstRec = (@PageNo - 1) * @PageSize
SELECT @LastRec = (@PageNo * @PageSize + 1);

BEGIN TRY

WITH TempResult as
(
SELECT  DISTINCT
Company.CompanyID  as RowNum,
LTRIM(RTRIM(Country.CountryCode)) AS CountryCode, LTRIM(RTRIM(City.CityName)) AS CityName, 
LTRIM(RTRIM([Company].[Name])) AS CompanyName
FROM            City INNER JOIN
                         Company ON City.CityCode = Company.City INNER JOIN
                         Country ON City.CountryCode = Country.CountryCode AND Company.Country = Country.CountryCode INNER JOIN
                         [User] ON Company.CompanyID = [User].CompanyID

      WHERE
             [City].[CountryCode] LIKE '%'+ ISNULL(@CountryCode, '') + '%'
              AND[City].[CityName] LIKE '%' + ISNULL(@CityName, '') + '%'
			  AND [User].[Name] LIKE '%' + ISNULL(@UserName, '') + '%'
			  group by Company.CompanyID,[Company].[Name],[User].[Name],Country.CountryCode,City.CityName,
						 [User].EmailId,[User].UserID
)

SELECT top (@LastRec-1) *
FROM TempResult
WHERE RowNum > @FirstRec 
AND RowNum < @LastRec

-- Turn NOCOUNT back OFF
SET NOCOUNT OFF

    END TRY
    BEGIN CATCH
      RETURN 'Erorr occured in the serch.'
    END CATCH
    RETURN 0
  END