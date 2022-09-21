using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using world_conference_api.DataAccess;

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
        public async Task<IActionResult> SearchCompany(int pageNo, int pageSize, string countryCode, string cityName, string userName, string sortOrder)
        {            
            var companyDetails =await _dataProvider.SearchCompaniesAsync(pageNo, pageSize, countryCode, cityName, userName, sortOrder);

            return Ok(companyDetails);
        }

    }
}
