using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using System.Web.Mvc;
using DataHub.DataComm;
using DataHub.Models;
using Newtonsoft.Json;
//using System.Text.Json;


namespace DataHub.Logic
{
    public static class CalenderHandler
    {
        public static string NewCalenderData(string employeeId, string request)
        {
            DataHub_CalenderModel data = new DataHub_CalenderModel
            {
                EmployeeId = employeeId,
                Request = request
            };

            var sql = @"EXEC dbo.spCalender @EmpId = @EmployeeId, @Request = @Request;";

            var val = SqlComm.SqlQueryWithData(sql, data) ;

            string json = JsonConvert.SerializeObject(val, Formatting.Indented);

            return json;
            
        }


    }
}
