using System;
using System.Collections.Generic;
using System.Linq;
using IOSAPI.Domain;
using Microsoft.EntityFrameworkCore;

namespace IOSAPI.Data
{
    public class ChampRepo : IChampRepo
    {
        private readonly ApiContext _context;
        private readonly DbSet<Champion> _champs;

        public ChampRepo(ApiContext _context)
        {
            this._context = _context;
            this._champs = _context.champions;

        }

        public IEnumerable<Champion> GetChampions() {
            return _context.champions.ToList();
        }
    }
}
