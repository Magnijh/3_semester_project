using DataHub.DataComm;
using System;
using System.Collections.Generic;
using DataHub.Models;

namespace DataHub.Logic
{
    public static class AbsentHandler
    {
        public static List<DataHub_AbsentModel> NewAbsent(string employeeId, DateTime startDate, DateTime endDate, string reason)
        {
            DataHub_AbsentModel data = new DataHub_AbsentModel
            {
                EmployeeID = employeeId,
                StartDate = startDate,
                EndDate = endDate,
                Reason = reason
            };

            string sql = @"EXEC dbo.spAbsent @EmpId = @EmployeeId, @StartDate = @StartDate, @EndDate = @EndDate, @Reason = @Reason;";

            var val = SqlComm.SqlQueryWithData(sql, data);

            return val;
        }
    }
}