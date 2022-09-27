using System.Collections.Generic;
using System.Threading.Tasks;

using world_conference_api.Model;

namespace world_conference_api.DataAccess
{
    public interface IDataProvider
    {
        IEnumerable<Country> GetAllCountry();
        IEnumerable<City> GetAllCity();
        IEnumerable<User> GetAllUser();
        Task<IEnumerable<SearchCompany>> SearchCompaniesAsync(int pageNo, int pageSize, string countryCode, string cityName, string userName);
        object getAllCompaniesCount(string countryCode, string cityName, string userName);
        Task<IEnumerable<User>> GetAllUserByCompanyName(string companyName);
    }
}
