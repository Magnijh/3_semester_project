using DataHub.DataComm;
using DataHub.Models;
using DataHub.Models.DataHub_PersonalStatistics;
using DataHub.Models.DataHub_VacationDepartmentOverview;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;

namespace DataHub.Logic
{
    public static class StatisticsHandler
    {
        public static List<DataHub_DepartmentStatisticsModel> GetDepartmentStatistics(int depId)
        {
            string sql = $"EXEC dbo.spStatisticsByDepOrEmpId @DepId = {depId}, @EmpId = '' ;";

            var val = SqlComm.SqlQueryList<DataHub_DepartmentStatisticsModel>(sql);

            return val;
        }

        public static DataHub_PersonalStatisticsModel GetAbsenceByEmpId(string empId)
        {
            string sqlAbsent = $"SELECT EmployeeId, StartDate, EndDate, Note as 'Reason' FROM dbo.AbsentTable WHERE EmployeeId = '{empId}';";
            var sqlDataAbsent = SqlComm.SqlQueryList<DataHub_AbsentModel>(sqlAbsent);

            string sqlStatistics = $"EXEC dbo.spStatisticsByDepOrEmpId @DepId = -1, @EmpId = '{empId}' ;";
            var sqlDataStatistics = SqlComm.SqlQueryList<DataHub_DepartmentStatisticsModel>(sqlStatistics);

            string sqlVacation = $"EXEC dbo.spVacationCurrentRequests @EmpId = '{empId}', @DepId = 0 ;";
            var sqlDataVacation = SqlComm.SqlQueryList<DataHub_VacationCurrentRequest>(sqlVacation);

            var Data = new DataHub_PersonalStatisticsModel();

            Data.AbsenceData = sqlDataAbsent;
            Data.AbsenceData.Reverse();

            Data.PersonalStatistics = sqlDataStatistics;
            Data.PersonalAcceptedVacation = sqlDataVacation;

            //graph - not done
            #region

            //string sqlGraphDepartment = $"EXEC dbo.spGraphDataDepartment @EmpId = '{empId}'";
            //var sqlDataGraphDepartment = SqlComm.SqlQueryList<DataHub_GraphDataModel>(sqlGraphDepartment);

            //string sqlGraphPersonal = $"EXEC dbo.spGraphDataPersonal @EmpId = '{empId}'";
            //var sqlDataGraphPersonal = SqlComm.SqlQueryList<DataHub_GraphDataModel>(sqlGraphPersonal);

            //var DataGraphPersonal = sqlDataGraphPersonal.Skip(sqlDataGraphPersonal.Count - 12);
            //var DataGraphDepartment = sqlDataGraphDepartment.Skip(sqlDataGraphDepartment.Count - 12).Take(12).Reverse();


            //foreach (var item in DataGraphPersonal)
            //{
            //    Data.PersonalGraphDataList[item.MonthNumber] = item.AvgSecondsWorked;
            //}

            //foreach (var item in DataGraphDepartment)
            //{
            //    Data.DepartmentGraphDataList[item.MonthNumber] = item.AvgSecondsWorked;
            //}



            //Debug.WriteLine("%&%&%&%&&%%&&&%&&%&%&%&%&%&%&%&%");

            //foreach (var item in Data.PersonalGraphDataList)
            //{
            //    Debug.WriteLine(item);
            //}
            //Debug.WriteLine("%&%&%&%&&%%&&&%&&%&%&%&%&%&%&%&%");

            //foreach (var item in Data.DepartmentGraphDataList)
            //{
            //    Debug.WriteLine(item);
            //}
            #endregion

            return Data;
        }

    }
}