using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using IOSAPI.Domain;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace IOSAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]

    public class ChampController : ControllerBase
    {
        private readonly IChampRepo _champRepository;

        public ChampController(IChampRepo context)
        {
            _champRepository = context;
        }

        [HttpGet]
        public IEnumerable<Champion> GetChampions() {

            IEnumerable<Champion> champs = _champRepository.GetChampions();

            if (champs.Count() == 0){
                champs.Append(new Champion
                {
                    Id =2,
                    Name = "fail",
                    Price =10

                }); 

            }

            return champs;
        }



    }
}
