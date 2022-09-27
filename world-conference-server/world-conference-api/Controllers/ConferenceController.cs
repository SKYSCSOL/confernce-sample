using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using world_conference_api.DataAccess;
using world_conference_api.Model;

namespace world_conference_api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ConferenceController : ControllerBase
    {
        private readonly IDataProvider _dataProvider;

        public ConferenceController(IDataProvider dataProvider)
        {
            _dataProvider = dataProvider;
        }
        [HttpGet("getCountry")]
        public IActionResult GetAllCountry()
        {
            var countries = _dataProvider.GetAllCountry();
            return Ok(countries);
        }
        [HttpGet("getCity")]
        public IActionResult GetAllCity()
        {
            var cities = _dataProvider.GetAllCity();
            return Ok(cities);
        }
        [HttpGet("getUser")]
        public IActionResult GetAllUser()
        {
            var users = _dataProvider.GetAllUser();
            return Ok(users);
        }

        [HttpGet("SearchCompany")]
        public async Task<IActionResult> SearchCompany(int pageNo, int pageSize, string countryCode, string cityName, string userName)
        {
            var companyDetails = await _dataProvider.SearchCompaniesAsync(pageNo, pageSize, countryCode, cityName, userName);

            return Ok(companyDetails);
        }

        [HttpGet("getAllCompaniesCount")]
        public object getAllCompaniesCount(string countryCode, string cityName, string userName)
        {
            var companyDetailsCount = _dataProvider.getAllCompaniesCount(countryCode, cityName, userName);
            return companyDetailsCount;
        }

        [HttpGet("getAllUserByCompanyName")]
        public async Task<IActionResult> GetAllUserByCompanyName(string companyName)
        {
            var companyUsers = await _dataProvider.GetAllUserByCompanyName(companyName);
            return Ok(companyUsers);
        }
    }
}
