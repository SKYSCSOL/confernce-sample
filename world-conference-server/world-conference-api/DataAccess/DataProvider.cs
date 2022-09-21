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
            catch (Exception)
            {

            }
            return cities;
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


        public async Task<IEnumerable<SearchCompany>> SearchCompaniesAsync(int pageNo, int pageSize, string countryCode, string cityName, string userName, string sortOrder)
        {
            DynamicParameters searchCompanyParameters = new DynamicParameters();

            using (IDbConnection databaseConnection = new SqlConnection(connectionString: _configuration["ConferenceConnection"]))
            {
                searchCompanyParameters.Add(name: SqlParameterConstant.Page_No, value: pageNo, dbType: DbType.Int32, direction: ParameterDirection.Input);

                searchCompanyParameters.Add(name: SqlParameterConstant.Page_Size, value: pageSize, dbType: DbType.Int32, direction: ParameterDirection.Input);

                searchCompanyParameters.Add(name: SqlParameterConstant.Country_Code, value: countryCode, dbType: DbType.String, direction: ParameterDirection.Input);

                searchCompanyParameters.Add(name: SqlParameterConstant.City_Name, value: cityName, dbType: DbType.String, direction: ParameterDirection.Input);

                searchCompanyParameters.Add(name: SqlParameterConstant.User_Name, value: userName, dbType: DbType.String, direction: ParameterDirection.Input);
                var companies = await databaseConnection.QueryAsync<SearchCompany>(SqlStoredProcedureConstant.COMPANY_SEARCH, searchCompanyParameters, commandType: CommandType.StoredProcedure);
                return companies.ToList();

            }
        }
    }
}