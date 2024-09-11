using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Threading.Tasks;

namespace DRP3_Project.Abstraction
{
    public interface IDatabaseStrategy
    {
        // To seed the database
        void SeedDatabase();

        // Get the Database connection
        DbConnection Connection { get; }

    }
}
