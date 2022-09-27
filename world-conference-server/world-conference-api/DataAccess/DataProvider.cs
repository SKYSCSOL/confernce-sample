using Dapper;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using world_conference_api.Model;

namespace world_conference_api.DataAccess
{
    public class DataProvider : IDataProvider
    {
        private readonly IConfiguration _configuration;
        private readonly DataContext _context;

        public DataProvider(DataContext context, IConfiguration configuration)
        {
            _configuration = configuration;
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public IEnumerable<City> GetAllCity()
        {
            var cities = new List<City>();
            try
            {
                cities = _context.City.ToList();
            }
            catch (Exception ex)
            {

            }
            return cities;
        }

        public object getAllCompaniesCount(string countryCode, string cityName, string userName)
        {
            DynamicParameters countCompanyParameters = new DynamicParameters();

            using (IDbConnection databaseConnection = new SqlConnection(connectionString: _configuration["ConferenceConnection"]))
            {
                countCompanyParameters.Add(name: SqlParameterConstant.Country_Code, value: countryCode, dbType: DbType.String, direction: ParameterDirection.Input);
                countCompanyParameters.Add(name: SqlParameterConstant.City_Name, value: cityName, dbType: DbType.String, direction: ParameterDirection.Input);
                countCompanyParameters.Add(name: SqlParameterConstant.User_Name, value: userName, dbType: DbType.String, direction: ParameterDirection.Input);
                var companyCount = databaseConnection.QuerySingle(SqlStoredProcedureConstant.COMPANY_COUNT, countCompanyParameters, commandType: CommandType.StoredProcedure);
                return companyCount;

            }
        }

        public IEnumerable<Country> GetAllCountry()
        {
            var countries = new List<Country>();
            try
            {
                countries = _context.Country.ToList();

            }
            catch (Exception)
            {

            }
            return countries;
        }

        public IEnumerable<User> GetAllUser()
        {
            var users = new List<User>();
            try
            {
                users = _context.User.ToList();
            }
            catch (Exception)
            {

            }
            return users;
        }

        public async Task<IEnumerable<User>> GetAllUserByCompanyName(string companyName)
        {
            var companyUsers = new List<User>();
            try
            {
                DynamicParameters companyParameters = new DynamicParameters();
                using (IDbConnection databaseConnection = new SqlConnection(connectionString: _configuration["ConferenceConnection"]))
                {
                    companyParameters.Add(name: SqlParameterConstant.Company_Name, value: companyName, dbType: DbType.String, direction: ParameterDirection.Input);
                    companyUsers = (List<User>)await databaseConnection.QueryAsync<User>(SqlStoredProcedureConstant.GET_USER_BY_COMPANY, companyParameters, commandType: CommandType.StoredProcedure);

                }
            }
            catch (Exception ex)
            { }
            return companyUsers;

        }

        public async Task<IEnumerable<SearchCompany>> SearchCompaniesAsync(int pageNo, int pageSize, string countryCode, string cityName, string userName)
        {
            var companies = new List<SearchCompany>();
            try
            {
                DynamicParameters searchCompanyParameters = new DynamicParameters();

                using (IDbConnection databaseConnection = new SqlConnection(connectionString: _configuration["ConferenceConnection"]))
                {
                    searchCompanyParameters.Add(name: SqlParameterConstant.Page_No, value: pageNo, dbType: DbType.Int32, direction: ParameterDirection.Input);

                    searchCompanyParameters.Add(name: SqlParameterConstant.Page_Size, value: pageSize, dbType: DbType.Int32, direction: ParameterDirection.Input);

                    searchCompanyParameters.Add(name: SqlParameterConstant.Country_Code, value: countryCode, dbType: DbType.String, direction: ParameterDirection.Input);

                    searchCompanyParameters.Add(name: SqlParameterConstant.City_Name, value: cityName, dbType: DbType.String, direction: ParameterDirection.Input);

                    searchCompanyParameters.Add(name: SqlParameterConstant.User_Name, value: userName, dbType: DbType.String, direction: ParameterDirection.Input);
                    companies =(List<SearchCompany>)await databaseConnection.QueryAsync<SearchCompany>(SqlStoredProcedureConstant.COMPANY_SEARCH, searchCompanyParameters, commandType: CommandType.StoredProcedure);                  

                }
            }
            catch(Exception ex)
            { }
            return companies.ToList();

        }
    }
}