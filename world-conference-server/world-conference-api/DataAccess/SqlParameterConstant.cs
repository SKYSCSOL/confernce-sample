using Microsoft.AspNetCore.Mvc.RazorPages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace world_conference_api.DataAccess
{
    public static class SqlParameterConstant
    {
        public const string Page_No = "@PageNo";
        public const string Page_Size = "@PageSize";
        public const string Country_Code = "@CountryCode";
        public const string City_Name = "@CityName";
        public const string User_Name = "@UserName";
        public const string Company_Name = "@CompanyName";

    }
}
