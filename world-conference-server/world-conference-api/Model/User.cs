using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace world_conference_api.Model
{
    public class User
    {
        public int UserID { get; set; }
        public int CompanyID { get; set; }
        public string LoginID { get; set; }
        public string Password { get; set; }
        public string Name { get; set; }
        public string Phone { get; set; }
        public string EmailId { get; set; }
        public string Role { get; set; }
        public string Status { get; set; }
        public DateTime Created { get; set; }
        public DateTime? Modified { get; set; }
        public string Accessed { get; set; }
    }
}
