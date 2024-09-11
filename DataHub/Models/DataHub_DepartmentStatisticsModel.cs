using System;
using System.Collections.Generic;
using System.Text;

namespace DataHub.Models
{
    public class DataHub_DepartmentStatisticsModel
    {
        public string EmployeeId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int Role { get; set; }
        public int WorkHoursInWeek { get; set; }
        public int AverageSecondsPerCheckIn { get; set; }
        public int SecondsWorkedThisWeek { get; set; }
    }

    
}
