using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace world_conference_api.Model
{
    public class City
    {
        public int Id { get; set; }
        public string CountryCode { get; set; }
        public string CityCode { get; set; }
        public string CityName { get; set; }
    }
}
