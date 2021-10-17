using System;
using IOSAPI.Domain;
using Microsoft.EntityFrameworkCore;

namespace IOSAPI.Data
{
    public class ApiContext : DbContext
    {
        public DbSet<Champion> champions { get; set; }
        public ApiContext(DbContextOptions<ApiContext> options) : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            builder.Entity<Champion>().HasData(
                new Champion { Id = 1,Name ="test" , Price=100}
                );

            
        }
    }
}
