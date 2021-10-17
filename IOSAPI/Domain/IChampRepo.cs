using System;
using System.Collections.Generic;

namespace IOSAPI.Domain
{
    public interface IChampRepo
    {
        public IEnumerable<Champion> GetChampions();
    }
}
