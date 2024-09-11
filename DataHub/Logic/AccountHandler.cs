using DataHub.DataComm;
using DataHub.Models;
using System.Collections.Generic;
using BCrypt.Net;

namespace DataHub.Logic
{
    public static class AccountHandler
    {


        public static List<DataHub_LoginModel> NewLogin(string employeeId)
        {
            DataHub_LoginModel data = new DataHub_LoginModel
            {
                EmployeeId = employeeId,                
            };

            string sql = @"EXEC dbo.spLogin @EmpID = @EmployeeId";

            var val = SqlComm.SqlQueryWithData(sql, data);
            

            return val;
        }
    }
}