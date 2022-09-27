namespace world_conference_api.DataAccess
{
    public static class SqlStoredProcedureConstant
    {       
        public const string COMPANY_SEARCH = @"[dbo].[CompanySearch]";
        public const string COMPANY_COUNT = @"[dbo].[GetCompaniesCount]";
        public const string GET_USER_BY_COMPANY= @"[dbo].[GetUserByCompany]";
    }
}
