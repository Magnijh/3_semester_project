using DataHub.DataComm;
using DataHub.Models;
using System.Collections.Generic;
using System.Diagnostics;


namespace DataHub.Logic
{
    public static class AdminHandler
    {
        
        public static List<DataHub_CheckInBtnModel> CheckIfEmpIdExists(string empId)
        {
            //reusing
            DataHub_CheckInBtnModel data = new DataHub_CheckInBtnModel
            {
                UserName = empId,
            };

            string sql = "SELECT EmployeeId FROM dbo.EmployeeTable WHERE EmployeeId = @UserName;";

            var val = SqlComm.SqlQueryWithData<DataHub_CheckInBtnModel>(sql, data);
           

            return val;
        }

        public static List<DataHub_DepartmentList> GetDepartmentList()
        {
            
            string sql = "SELECT * FROM dbo.DepartmentTable";

            var val = SqlComm.SqlQueryList<DataHub_DepartmentList>(sql);

            return val;
        }
    }
}