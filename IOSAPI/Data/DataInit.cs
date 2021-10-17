using System;
namespace IOSAPI.Data
{
    public class DataInit
    {
        private readonly ApiContext _dbContext;

        public DataInit(ApiContext dbContext)
        {
            _dbContext = dbContext;
        }

        public void InitializeData()
        {
            _dbContext.Database.EnsureDeleted();
            if (_dbContext.Database.EnsureCreated())
            {
                //seeding the database with recipes, see DBContext               
            }
        }

    }
}
