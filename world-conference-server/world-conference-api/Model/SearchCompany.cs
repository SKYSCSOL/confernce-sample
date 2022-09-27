using System.Collections.Generic;

namespace world_conference_api.Model
{
    public class SearchCompany
    {
        public string UserName { get; set; }
        public string CountryCode { get; set; }
        public string CityName { get; set; }
        public string EmailId { get; set; }
        public string UserID { get; set; }
        public string CompanyName { get; set; }
        //public List<User> Users { get; set; } = new List<User>(); //TODO
    }  
}
