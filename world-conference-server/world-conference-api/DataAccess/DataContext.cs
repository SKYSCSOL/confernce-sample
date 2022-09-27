using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using world_conference_api.Model;

namespace world_conference_api.DataAccess
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options)
           : base(options)
        {
        }

        public DbSet<Country> Country { get; set; } = null!;

        public DbSet<City> City { get; set; } = null!;

        public DbSet<User> User { get; set; } = null!;

        public DbSet<Company> Company { get; set; } = null!;

    }
}