using System;
using System.Collections.Generic;
using System.Text;
using Dapper;
using System.Configuration;
using System.Data;
using System.Reflection;
using System.Reflection.Metadata.Ecma335;
using System.Linq;
using System.Data.SqlClient;
using System.Web.Mvc;

namespace DataHub.DataComm
{

        public static class SqlComm
    {
        public static string GetConnectionString()
        {
            return "Data Source = SQL5065.site4now.net; Initial Catalog = DB_A6B8C5_DRP3Database; User Id = DB_A6B8C5_DRP3Database_admin; Password = Password123";
            // no-go, Pull from appsettings.json. Fix later.
        }


        
        public static List<T> SqlQueryList<T>(string sql)
        {
            using (IDbConnection conn = new SqlConnection(GetConnectionString()))
            {
                return conn.Query<T>(sql).ToList();
            }
        }

        public static int SqlExecWithData<T>(string sql, T data)
        {
            using (IDbConnection conn = new SqlConnection(GetConnectionString()))
            {
                return conn.Execute(sql, data);
            }
        }

        public static List<T> SqlQueryWithData<T>(string sql, T data)
        {
            using (IDbConnection conn = new SqlConnection(GetConnectionString()))
            {
                return conn.Query<T>(sql, data).ToList();
            }
        }


        // ExecuteScalar = Executes the query, and returns the first column of the first row in the result set 
        // returned by the query. Additional columns or rows are ignored.
        public static int SqlExecWithDataScalar<T>(string sql, T data)
        {
            using (IDbConnection conn = new SqlConnection(GetConnectionString()))
            {
                return (int)conn.ExecuteScalar(sql, data);
            }
        }
        





    }
}
