using DataHub.DataComm;
using DataHub.Models;
using System.Collections.Generic;

namespace DataHub.Logic
{
    public static class CheckInOutHandler
    {
        public static int NewCheckInOut(string userName)
        {
            DataHub_CheckInOutModel data = new DataHub_CheckInOutModel
            {
                UserName = userName,
            };

            string sql = @"dbo.spCheckInOut @Username = @UserName;";
            return SqlComm.SqlExecWithData(sql, data);
        }

        public static List<DataHub_LoadCheckInOutModel> LoadCheckInOut()
        {
            string sql = @"SELECT EmployeeId, CheckInDate, CheckOutDate, TimeWorked from dbo.WorkTable;";

            return SqlComm.SqlQueryList<DataHub_LoadCheckInOutModel>(sql);
        }


        /*Checks if the userId is checked in or not; returns info needed for check in page dynamic features*/
        public static List<DataHub_CheckInBtnModel> EmpCheckInStatus(string UserSessionId)
        {
            DataHub_CheckInBtnModel data = new DataHub_CheckInBtnModel
            {
                UserName = UserSessionId,  
            };
            
            string sql = @"EXEC dbo.spCheckInStatus @USessionId = @Username;";

            var val = SqlComm.SqlQueryWithData<DataHub_CheckInBtnModel>(sql, data);

            return val;
        }

        
    }
}