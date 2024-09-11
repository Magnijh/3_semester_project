using DataHub.Models.DataHub_VacationDepartmentOverview;
using System;
using System.Collections.Generic;
using System.Text;

namespace DataHub.Models.DataHub_PersonalStatistics
{
    public class DataHub_PersonalStatisticsModel
    {
        public List<DataHub_AbsentModel> AbsenceData = new List<DataHub_AbsentModel>();

        public List<DataHub_DepartmentStatisticsModel> PersonalStatistics = new List<DataHub_DepartmentStatisticsModel>();

        public List<DataHub_VacationCurrentRequest> PersonalAcceptedVacation = new List<DataHub_VacationCurrentRequest>();

        //public List<int> DepartmentGraphDataList = new List<int>();
        //public List<int> PersonalGraphDataList = new List<int>();

    }
}
