using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace world_conference_api.Model
{
    public class Company
    {
        public int CompanyID { get; set; }
        public string Name { get; set; }
        public string TheID { get; set; } //TODO: ENUM
        public string Address { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public string Phone { get; set; }
        public string EmailId { get; set; }
        public string Website { get; set; }
        public string HowComeToKnow { get; set; }
        public string Others { get; set; }
        public string Status { get; set; }
        public DateTime Created { get; set; }
        public DateTime? Modified { get; set; }
    }
}
