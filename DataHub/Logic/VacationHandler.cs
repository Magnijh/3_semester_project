using DataHub.DataComm;
using DataHub.Models;
using DataHub.Models.DataHub_VacationDepartmentOverview;
using System;
using System.Collections.Generic;
using System.Diagnostics;

namespace DataHub.Logic
{
    public static class VacationHandler
    {
        public static List<DataHub_RequestVacationModel> NewVacationRequest(string employeeId, DateTime startDate, DateTime endDate)
        {
            DataHub_RequestVacationModel data = new DataHub_RequestVacationModel
            {
                EmployeeID = employeeId,
                StartDate = startDate,
                EndDate = endDate
            };

            string sql = @"EXEC dbo.spRequestVacation @EmpID = @EmployeeId, @StartDate = @StartDate, @EndDate = @EndDate;";

            var val = SqlComm.SqlQueryWithData(sql, data);

            return val;
        }

        public static List<DataHub_VacationRequestsGroupedByWeek> GetVacationRequestsGroupedByWeek(int depId)
        {
            string sql = $"EXEC dbo.spVacationRequestsGroupedByWeek @DepId = {depId} ;";

            var Data = SqlComm.SqlQueryList<DataHub_VacationRequestsGroupedByWeek>(sql);

            return Data;
        }

        public static List<DataHub_VacationCurrentRequest> GetVacationCurrentRequest(int depId)
        {
            string sql = $"EXEC dbo.spVacationCurrentRequests @EmpId = '', @DepId = {depId} ;";

            var Data = SqlComm.SqlQueryList<DataHub_VacationCurrentRequest>(sql);

            return Data;
        }

        public static List<DataHub_ChangeVacationStatusModel> ChangeVacationStatusDatabase(int id, int newStatus, string changedByUserId)
        {
            DataHub_ChangeVacationStatusModel data = new DataHub_ChangeVacationStatusModel
            {
                Id = id,
                NewStatus = newStatus,
                ChangedByUserId = changedByUserId
            };

            string sql = @"UPDATE dbo.VacationTable SET Approved = @NewStatus, ApprovedBy = @ChangedByUserId WHERE Id = @Id";

            var returVal = SqlComm.SqlQueryWithData(sql, data);
            Debug.WriteLine(returVal);
            return returVal;
        }
    }
} 