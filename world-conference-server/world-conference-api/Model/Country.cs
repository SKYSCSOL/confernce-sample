using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace world_conference_api.Model
{
    public class Country
    {
        public int Id { get; set; }
        public string RegionCode { get; set; }
        public string CountryCode { get; set; }
        public string CountryName { get; set; }
    }
}
