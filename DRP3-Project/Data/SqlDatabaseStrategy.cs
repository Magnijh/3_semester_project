using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using DRP3_Project.Abstraction;
namespace DRP3_Project.Data
{
    public class SqlDatabaseStrategy : IDatabaseStrategy
    {
        public DbConnection Connection
        {
            get
            {
                //Creating a new connection if there is "null" or if it was disposed
                if (_connection == null)
                {
                    _connection = new SqlConnection("Data Source = SQL5065.site4now.net; Initial Catalog = DB_A6B8C5_DRP3Database; User Id = DB_A6B8C5_DRP3Database_admin; Password = Password123");
                    _connection.Open();
                }
                //Now we open the connection if the state of it has anything, excpet disposed.
                else if (_connection.State != System.Data.ConnectionState.Open)
                {
                    _connection.Open();
                }

                return _connection;
            }
        }

        private DbConnection _connection;

        public void SeedDatabase()
        {

        }
    }
}









   
